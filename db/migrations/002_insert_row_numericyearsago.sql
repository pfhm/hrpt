-- Inserts a new rule for derived values to be used on the surveys

INSERT INTO pollster_virtualoptiontype(
            id, title, question_data_type_id, js_class)
    VALUES (8, 'Years Ago', 3, 'wok.pollster.virtualoptions.NumericYearsAgo');
