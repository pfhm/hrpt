-- This specific sequence was out of sync after an install.
-- Possibly others have the same problem, so it might be a good idea tu run a
-- script that fixes them all.

SELECT SETVAL('pollster_translationoption_id_seq', (SELECT MAX(id) + 1  FROM pollster_translationoption));
