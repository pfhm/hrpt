-- adds a btree index to the registration_registrationprofile activation_key
-- this is because the clicks on the activation link were too slow.

CREATE INDEX activation_key_idx
  ON registration_registrationprofile
  USING btree
  (activation_key COLLATE pg_catalog."default");
