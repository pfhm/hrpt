-- app accounts
BEGIN;
SELECT setval(pg_get_serial_sequence('"accounts_user_profile"','id'), coalesce(max("id"), 1), max("id") IS NOT null) FROM "accounts_user_profile";
COMMIT;

-- app journal
BEGIN;
SELECT setval(pg_get_serial_sequence('"journal_categorytranslation"','id'), coalesce(max("id"), 1), max("id") IS NOT null) FROM "journal_categorytranslation";
SELECT setval(pg_get_serial_sequence('"journal_category"','id'), coalesce(max("id"), 1), max("id") IS NOT null) FROM "journal_category";
SELECT setval(pg_get_serial_sequence('"journal_entrytranslation"','id'), coalesce(max("id"), 1), max("id") IS NOT null) FROM "journal_entrytranslation";
SELECT setval(pg_get_serial_sequence('"journal_entry"','id'), coalesce(max("id"), 1), max("id") IS NOT null) FROM "journal_entry";
SELECT setval(pg_get_serial_sequence('"journal_latestentryplugin_category"','id'), coalesce(max("id"), 1), max("id") IS NOT null) FROM "journal_latestentryplugin_category";
COMMIT;

-- app partnersites
BEGIN;
SELECT setval(pg_get_serial_sequence('"partnersites_sitesettings"','id'), coalesce(max("id"), 1), max("id") IS NOT null) FROM "partnersites_sitesettings";
COMMIT;

-- app pollster
BEGIN;
SELECT setval(pg_get_serial_sequence('"pollster_survey"','id'), coalesce(max("id"), 1), max("id") IS NOT null) FROM "pollster_survey";
SELECT setval(pg_get_serial_sequence('"pollster_ruletype"','id'), coalesce(max("id"), 1), max("id") IS NOT null) FROM "pollster_ruletype";
SELECT setval(pg_get_serial_sequence('"pollster_questiondatatype"','id'), coalesce(max("id"), 1), max("id") IS NOT null) FROM "pollster_questiondatatype";
SELECT setval(pg_get_serial_sequence('"pollster_virtualoptiontype"','id'), coalesce(max("id"), 1), max("id") IS NOT null) FROM "pollster_virtualoptiontype";
SELECT setval(pg_get_serial_sequence('"pollster_question"','id'), coalesce(max("id"), 1), max("id") IS NOT null) FROM "pollster_question";
SELECT setval(pg_get_serial_sequence('"pollster_questionrow"','id'), coalesce(max("id"), 1), max("id") IS NOT null) FROM "pollster_questionrow";
SELECT setval(pg_get_serial_sequence('"pollster_questioncolumn"','id'), coalesce(max("id"), 1), max("id") IS NOT null) FROM "pollster_questioncolumn";
SELECT setval(pg_get_serial_sequence('"pollster_option"','id'), coalesce(max("id"), 1), max("id") IS NOT null) FROM "pollster_option";
SELECT setval(pg_get_serial_sequence('"pollster_rule_object_options"','id'), coalesce(max("id"), 1), max("id") IS NOT null) FROM "pollster_rule_object_options";
SELECT setval(pg_get_serial_sequence('"pollster_rule_subject_options"','id'), coalesce(max("id"), 1), max("id") IS NOT null) FROM "pollster_rule_subject_options";
SELECT setval(pg_get_serial_sequence('"pollster_rule"','id'), coalesce(max("id"), 1), max("id") IS NOT null) FROM "pollster_rule";
SELECT setval(pg_get_serial_sequence('"pollster_translationsurvey"','id'), coalesce(max("id"), 1), max("id") IS NOT null) FROM "pollster_translationsurvey";
SELECT setval(pg_get_serial_sequence('"pollster_translationquestion"','id'), coalesce(max("id"), 1), max("id") IS NOT null) FROM "pollster_translationquestion";
SELECT setval(pg_get_serial_sequence('"pollster_translationquestionrow"','id'), coalesce(max("id"), 1), max("id") IS NOT null) FROM "pollster_translationquestionrow";
SELECT setval(pg_get_serial_sequence('"pollster_translationquestioncolumn"','id'), coalesce(max("id"), 1), max("id") IS NOT null) FROM "pollster_translationquestioncolumn";
SELECT setval(pg_get_serial_sequence('"pollster_translationoption"','id'), coalesce(max("id"), 1), max("id") IS NOT null) FROM "pollster_translationoption";
SELECT setval(pg_get_serial_sequence('"pollster_charttype"','id'), coalesce(max("id"), 1), max("id") IS NOT null) FROM "pollster_charttype";
SELECT setval(pg_get_serial_sequence('"pollster_chart"','id'), coalesce(max("id"), 1), max("id") IS NOT null) FROM "pollster_chart";
COMMIT;

--app reminder
BEGIN;
SELECT setval(pg_get_serial_sequence('"reminder_userreminderinfo"','id'), coalesce(max("id"), 1), max("id") IS NOT null) FROM "reminder_userreminderinfo";
SELECT setval(pg_get_serial_sequence('"reminder_remindersettings"','id'), coalesce(max("id"), 1), max("id") IS NOT null) FROM "reminder_remindersettings";
SELECT setval(pg_get_serial_sequence('"reminder_newslettertemplatetranslation"','id'), coalesce(max("id"), 1), max("id") IS NOT null) FROM "reminder_newslettertemplatetranslation";
SELECT setval(pg_get_serial_sequence('"reminder_newslettertemplate"','id'), coalesce(max("id"), 1), max("id") IS NOT null) FROM "reminder_newslettertemplate";
SELECT setval(pg_get_serial_sequence('"reminder_newslettertranslation"','id'), coalesce(max("id"), 1), max("id") IS NOT null) FROM "reminder_newslettertranslation";
SELECT setval(pg_get_serial_sequence('"reminder_newsletter"','id'), coalesce(max("id"), 1), max("id") IS NOT null) FROM "reminder_newsletter";
SELECT setval(pg_get_serial_sequence('"reminder_remindererror"','id'), coalesce(max("id"), 1), max("id") IS NOT null) FROM "reminder_remindererror";
SELECT setval(pg_get_serial_sequence('"reminder_manualnewsletter"','id'), coalesce(max("id"), 1), max("id") IS NOT null) FROM "reminder_manualnewsletter";
SELECT setval(pg_get_serial_sequence('"reminder_failedemail"','id'), coalesce(max("id"), 1), max("id") IS NOT null) FROM "reminder_failedemail";
SELECT setval(pg_get_serial_sequence('"reminder_queuedemail"','id'), coalesce(max("id"), 1), max("id") IS NOT null) FROM "reminder_queuedemail";
SELECT setval(pg_get_serial_sequence('"reminder_sentemail"','id'), coalesce(max("id"), 1), max("id") IS NOT null) FROM "reminder_sentemail";
COMMIT;

-- app survey
BEGIN;
SELECT setval(pg_get_serial_sequence('"survey_surveyidcode"','id'), coalesce(max("id"), 1), max("id") IS NOT null) FROM "survey_surveyidcode";
SELECT setval(pg_get_serial_sequence('"survey_surveyuser"','id'), coalesce(max("id"), 1), max("id") IS NOT null) FROM "survey_surveyuser";
SELECT setval(pg_get_serial_sequence('"survey_survey"','id'), coalesce(max("id"), 1), max("id") IS NOT null) FROM "survey_survey";
SELECT setval(pg_get_serial_sequence('"survey_participation"','id'), coalesce(max("id"), 1), max("id") IS NOT null) FROM "survey_participation";
SELECT setval(pg_get_serial_sequence('"survey_responsesendqueue"','id'), coalesce(max("id"), 1), max("id") IS NOT null) FROM "survey_responsesendqueue";
SELECT setval(pg_get_serial_sequence('"survey_profilesendqueue"','id'), coalesce(max("id"), 1), max("id") IS NOT null) FROM "survey_profilesendqueue";
SELECT setval(pg_get_serial_sequence('"survey_localresponse"','id'), coalesce(max("id"), 1), max("id") IS NOT null) FROM "survey_localresponse";
SELECT setval(pg_get_serial_sequence('"survey_profile"','id'), coalesce(max("id"), 1), max("id") IS NOT null) FROM "survey_profile";
SELECT setval(pg_get_serial_sequence('"survey_lastresponse"','id'), coalesce(max("id"), 1), max("id") IS NOT null) FROM "survey_lastresponse";
SELECT setval(pg_get_serial_sequence('"survey_localprofile"','id'), coalesce(max("id"), 1), max("id") IS NOT null) FROM "survey_localprofile";
SELECT setval(pg_get_serial_sequence('"survey_localflusurvey"','id'), coalesce(max("id"), 1), max("id") IS NOT null) FROM "survey_localflusurvey";
SELECT setval(pg_get_serial_sequence('"survey_surveyresposedraft"','id'), coalesce(max("id"), 1), max("id") IS NOT null) FROM "survey_surveyresposedraft";
COMMIT;
