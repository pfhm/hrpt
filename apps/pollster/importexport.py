import datetime
from collections import namedtuple
import json as vanilajson
import itertools
import sys
import pprint

from django.core import serializers
from django.db.models import get_model
from . import models

ModelKey = namedtuple('ModelKey', ['model', 'pk'])

EntityDef = namedtuple('EntityDef',['json_key','fkeys', 'm2ms'])

FKeyDef = namedtuple('FKeyDef', ['field_name', 'model'])

#We could use FKeyDef where we use this, but it becomes clearer this way
M2MDef = namedtuple('M2MDef', ['field_name', 'model'])


#TODO: oh well... this should be possible to retriev programatically from the models module

IMPORT_ENTITIES_DEFINITIONS = [
    EntityDef(
        "survey_questions",
        ["survey", "data_type", FKeyDef("open_option_data_type", 'QuestionDataType')],
        []
    ),
    EntityDef(
        "survey_translations",
        ["survey"],
        []
    ),
    EntityDef(
        "rows",
        ["question"],
        []
    ),
    EntityDef(
        "columns",
        ["question"],
        []
    ),
    EntityDef(
        'options',
        ["question", FKeyDef("virtual_type", "VirtualOptionType")], # TODO: possibly row and column, check this
        []
    ),
    # EntityDef(
    #     "question_rows",
    #     ["question"],
    #     []
    # ),
    # EntityDef(
    #     "question_columns",
    #     ["question"],
    #     []
    # ),
    EntityDef( #TODO: check if any
        "subject_options",
        [
            "question",
            FKeyDef("clone" ,"Option"),
            FKeyDef("row", "QuestionRow"),
            FKeyDef("column","QuestionColumn"),
            FKeyDef("virtual_type", "VirtualOptionType")
        ],
        []
    ),
    EntityDef( #TODO: check if any
        "object_options",
        [
            "question",
            FKeyDef("clone" ,"Option"),
            FKeyDef("row", "QuestionRow"),
            FKeyDef("column","QuestionColumn"),
            FKeyDef("virtual_type", "VirtualOptionType")
        ],
        []),
    EntityDef(
        "rules",
        [
            FKeyDef("rule_type", "RuleType"),
            FKeyDef("subject_question", "Question"),
            FKeyDef("object_question", "Question"),
        ],
        [
            M2MDef("object_options", "Option"),
            M2MDef("subject_options", "Option")
        ]
    ),
    EntityDef(
        "translation_questions",
        [
            "question",
            FKeyDef("translation", "TranslationSurvey")
        ],
        []
    ),
    EntityDef(
        "translation_column",
        ["translation", "column"],
        []
    ),
    EntityDef(
        "translation_row",
        ["translation", "row"],
        []
    ),
    EntityDef(
        "translation_option",
        ["translation", "option"],
        []
    ),

    #TODO. go throught tables and check if any missing
]



def create_survey_from_json(json_string):
    data_from_json = vanilajson.loads(json_string)

    #specialPrint("OOOOOOOOOOOOOOOOO" + pprint.pformat(data_from_json))

    # we use this to map old keys present in the exported file, to new keys obtained on insert
    keys_save = {}

    # the main survey object needs to be saved separately because it is a special case
    # we need to prevent survey shortname colisions
    keys_save = _save_serialized_survey(data_from_json['survey'][0], keys_save)

    #this is just so we can define relationships both with a string in the simple case,
    # or with a FKeyDef in the case where the target model name does not match the attribute name
    normalized_import_defs = _normalize_fkey_definitions(IMPORT_ENTITIES_DEFINITIONS)

    #specialPrint("FOOOOOO-------")
    #specialPrint(pprint.pformat(data_from_json["survey_translations"]))

    for definition in normalized_import_defs:

        #specialPrint("definition: " + str(definition))
        for serialized_instance in data_from_json[definition.json_key]:
            #specialPrint("definition.json_key: " + str(definition.json_key))
            #specialPrint("serialized_instance->" + str(serialized_instance))
            keys_save = _save_model_from_serialized_data(serialized_instance, definition, keys_save)



def survey_to_json(survey):
    survey_questions = survey.question_set.all()
    survey_translations = survey.translationsurvey_set.all()

    all_options_nested          = [ question.option_set.all() for question in survey_questions ]
    all_transl_questions_nested = [ trasl_survey.translationquestion_set.all() for trasl_survey in survey_translations ]
    all_transl_columns_nested   = [ trasl_survey.translationquestioncolumn_set.all() for trasl_survey in survey_translations ]
    all_transl_rows_nested      = [ translationsurvey.translationquestionrow_set.all() for translationsurvey in survey_translations ]
    all_transl_options_nested   = [ translationsurvey.translationoption_set.all() for translationsurvey in survey_translations ]
    all_rules_nested            = [ q.subject_of_rules.all() for q in survey_questions ]
    all_rows_nested             = [ q.rows for q in survey_questions ]
    all_columns_nested          = [ q.columns for q in survey_questions ]


    all_options          = _flaten(all_options_nested)
    all_transl_questions = _flaten(all_transl_questions_nested)
    all_transl_columns   = _flaten(all_transl_columns_nested)
    all_transl_rows      = _flaten(all_transl_rows_nested)
    all_transl_options   = _flaten(all_transl_options_nested)
    all_rules            = _flaten(all_rules_nested)
    all_rows             = _flaten(all_rows_nested)
    all_columns          = _flaten(all_columns_nested)

    subject_options_nested = [ rule.subject_options.all() for rule in all_rules ]
    object_options_nested  = [ rule.object_options.all() for rule in all_rules ]

    subject_options = _flaten(subject_options_nested)
    object_options = _flaten(object_options_nested)

    #note that IMPORT_ENTITIES_DEFINITIONS must match this... obviously.
    serialize_this = {
        'survey':                 serializers.serialize("python", [survey],),
        'survey_questions':       serializers.serialize("python", survey_questions),
        'survey_translations':    serializers.serialize("python", survey_translations),
        "rows":                   serializers.serialize("python", all_rows),
        "columns":                serializers.serialize("python", all_columns),
        'options' :               serializers.serialize("python", all_options),
        #"question_rows" :         serializers.serialize("python", all_rows),
        #"question_columns" :      serializers.serialize("python", all_columns),
        "rules":                  serializers.serialize("python", all_rules),
        #"translation_survey" :    serializers.serialize("python", survey_translations),
        "translation_questions" : serializers.serialize("python", all_transl_questions),
        "translation_column" :    serializers.serialize("python", all_transl_columns),
        "translation_row" :       serializers.serialize("python", all_transl_rows),
        "translation_option":     serializers.serialize("python", all_transl_options),
        "subject_options":        serializers.serialize("python", subject_options),
        "object_options":         serializers.serialize("python", object_options),
        #TODO: details of all rules
    }

    return vanilajson.dumps(serialize_this,indent=2)


def _normalize_fkey_definitions(import_entities_definition):
    normalized_entity_definitions = []
    for ed in import_entities_definition:
        normalized_fkeys = []
        for fk in ed.fkeys:
            if isinstance(fk,basestring):
                normalized_fkeys.append(FKeyDef(fk,fk))
            else:
                normalized_fkeys.append(fk)
        #not suported for many to many relations, could be easily added if needed
        normalized_ed = EntityDef(ed.json_key, normalized_fkeys, ed.m2ms)
        normalized_entity_definitions.append(normalized_ed)
    return normalized_entity_definitions


def _save_serialized_survey(input_survey_object, keys_save):
    input_survey_object['fields']['shortname'] = _change_shortname_if_exists(input_survey_object['fields']['shortname'])
    new_survey = models.Survey(**input_survey_object['fields'])
    new_survey.save()
    key = ModelKey(model="pollster.survey", pk=input_survey_object['pk'])
    keys_save[key] = new_survey.pk
    #specialPrint(keys_save)
    return keys_save


def _change_shortname_if_exists(survey_shortname):
    all_survey_shornames = [survey.shortname for survey in models.Survey.objects.all()]
    if survey_shortname not in all_survey_shornames:
        return survey_shortname
    #TODO: replace instead of append if the survey shortname looks like it already has a time in its name
    ts_string = datetime.datetime.now().strftime('%Y%m%d%H%M%S')
    return survey_shortname + "_" + ts_string


def _prepare_fkey_fields(serialized_instance, fkey_defs, keys_save):
    for key_def in fkey_defs:
        #specialPrint(serialized_instance["fields"])
        lookup_key = ModelKey("pollster." + key_def.model, serialized_instance["fields"][key_def.field_name])
        if lookup_key in keys_save:
            value = keys_save[lookup_key]
        else:
            value = serialized_instance["fields"][key_def.field_name]
        new_key = key_def.field_name + "_id"
        serialized_instance["fields"][new_key] = value
        del serialized_instance["fields"][key_def.field_name]
    return serialized_instance


def _prepare_m2m_fields(serialized_instance, m2m_defs, keys_save):
    """
    we move the important data from the 'fields', up to the serialized instance root
    This way, all the fields in fields can be passed to the model constructor as kwargs
    and the many to many relationships are inserted after the instance is saved,
    which is actually a requirement imposed by django.
    """
    serialized_instance['m2m_fields'] = {}
    for m2m_def in m2m_defs:

        translated_relative_modelkeys = []

        for other_entity_id in serialized_instance['fields'][m2m_def.field_name]:
            lookup_key = ModelKey("pollster." + m2m_def.model, other_entity_id)
            if lookup_key in keys_save:
                #in this case we have created this object during the import, use the id of the created instance
                #(i.e. relative to this import)
                model_key_to_insert = ModelKey("pollster." + m2m_def.model, keys_save[lookup_key])
                translated_relative_modelkeys.append(model_key_to_insert)
            else:
                #nothing we have created durint this import, reference something that exists on the database
                #(i.e. absolute reference to id on the database)
                translated_relative_modelkeys.append(lookup_key)

        serialized_instance['m2m_fields'][m2m_def.field_name] = translated_relative_modelkeys
        del serialized_instance['fields'][m2m_def.field_name]
    return serialized_instance



def _save_m2m_relationships(instance, serialized_instance, entity_definition):
    for m2mdef in entity_definition.m2ms:
        attr = getattr(instance, m2mdef.field_name)
        full_model_name = "pollster." + m2mdef.model
        TargetModelClass = get_model(*full_model_name.split('.',1))
        models_instances_to_add = []
        #TODO: this only needs the ids, change the code above to pass the ids only instead of ModelKey tuples
        for model_key_to_insert in serialized_instance["m2m_fields"][m2mdef.field_name]:
            models_instances_to_add.append(TargetModelClass.objects.get(pk=model_key_to_insert.pk))
        attr.add(*models_instances_to_add)


def _save_model_from_serialized_data(serialized_instance, entity_definition, keys_save):
    ModelClass = get_model(*serialized_instance["model"].split('.',1) )
    #specialPrint(ModelClass)
    #specialPrint("####" + str(serialized_instance))
    serialized_instance = _prepare_m2m_fields(serialized_instance, entity_definition.m2ms, keys_save)
    serialized_instance = _prepare_fkey_fields(serialized_instance, entity_definition.fkeys, keys_save)
    new_instance = ModelClass(**serialized_instance["fields"])
    new_instance.save()
    _save_m2m_relationships(new_instance, serialized_instance, entity_definition)
    new_instance.save()
    key = ModelKey(serialized_instance['model'], serialized_instance['pk'])
    #specialPrint(key)
    keys_save[key] = new_instance.id
    return keys_save


def _flaten(list2d):
    return list(itertools.chain.from_iterable(list2d))


def specialPrint(msg):
    print >> sys.stderr,msg
