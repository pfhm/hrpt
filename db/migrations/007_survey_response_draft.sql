-- creates a table to hold temporairy survey responses
-- this is so the data persists on the forms in case the user leaves his computer


CREATE SEQUENCE survey_surveyresposedraft_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE survey_surveyresposedraft_id_seq
  OWNER TO epiwork;

CREATE TABLE survey_surveyresposedraft
(
  id integer NOT NULL DEFAULT nextval('survey_surveyresposedraft_id_seq'::regclass),
  global_id character varying,
  survey_id integer,
  form_data text,
  "timestamp" integer,
  CONSTRAINT survey_surveyresponsedraft_pk PRIMARY KEY (id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE survey_surveyresposedraft
  OWNER TO epiwork;
