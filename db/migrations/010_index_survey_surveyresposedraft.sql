-- EvS Added index to improve performance.
BEGIN;
CREATE INDEX "survey_surveyresposedraft_global_id" ON "survey_surveyresposedraft" ("global_id");
COMMIT;
