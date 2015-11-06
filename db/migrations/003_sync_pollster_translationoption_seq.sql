SELECT SETVAL('pollster_translationoption_id_seq', (SELECT MAX(id) + 1  FROM pollster_translationoption));
