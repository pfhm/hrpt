-- Add table to save activation keys of users that confirm their accounts.
-- This was previously ignored. and keys were lost. In fact, they ARE lost for
-- users that confirmed prior to this.

CREATE TABLE accounts_usedactivationkeys
(
  id serial NOT NULL,
  user_id integer NOT NULL,
  activation_key character varying(40) NOT NULL,
  CONSTRAINT accounts_usedactivationkeys_pkey PRIMARY KEY (id),
  CONSTRAINT accounts_usedactivationkeys_user_id_fkey FOREIGN KEY (user_id)
      REFERENCES auth_user (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION DEFERRABLE INITIALLY DEFERRED,
  CONSTRAINT accounts_usedactivationkeys_user_id_key UNIQUE (user_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE accounts_usedactivationkeys
  OWNER TO epiwork;


CREATE INDEX used_activation_key_idx
  ON accounts_usedactivationkeys
  USING btree
  (activation_key COLLATE pg_catalog."default");

