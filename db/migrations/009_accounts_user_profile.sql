-- EvS. These are the tables that were necessary for the updated registration procedure.
-- In this table year of brith and activationcode (idcode) are temporarily stored.
-- They can only be entered in the final location when the account has been activated and after first login.
-- The values could be deleted after that (not implemented as yet 2016-08-24).

BEGIN;
CREATE TABLE "accounts_user_profile" (
    "id" serial NOT NULL PRIMARY KEY,
    "user_id" integer NOT NULL UNIQUE REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED,
    "yearofbirth" integer NOT NULL,
    "idcode" varchar(10) NOT NULL
)
;
COMMIT;
