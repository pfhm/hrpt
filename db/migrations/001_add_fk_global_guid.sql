-- this ads a foreign key constraint to the idcodes table.

ALTER TABLE survey_surveyidcode
  ADD CONSTRAINT global_id_fk FOREIGN KEY (surveyuser_global_id) REFERENCES survey_surveyuser (global_id)
   ON UPDATE NO ACTION ON DELETE CASCADE;
