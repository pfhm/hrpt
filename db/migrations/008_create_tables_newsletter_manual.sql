-- These are the tables that were necessairy to add when I implemented manual sending of mass emails.
-- The previous newsletter was an unmanageable mess, but it was required to be left untouched.

BEGIN;

CREATE TABLE "reminder_manualnewsletter" (
    "id" serial NOT NULL PRIMARY KEY,
    "timestamp" timestamp with time zone NOT NULL,
    "sender_email" varchar(75) NOT NULL,
    "sender_name" varchar(255) NOT NULL,
    "subject" varchar(255) NOT NULL,
    "message" text NOT NULL,
    "template_id" integer NOT NULL REFERENCES "reminder_newslettertemplate" ("id") DEFERRABLE INITIALLY DEFERRED
)
;
CREATE TABLE "reminder_failedemail" (
    "id" serial NOT NULL PRIMARY KEY,
    "timestamp" timestamp with time zone NOT NULL,
    "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED,
    "manual_newsletter_id" integer NOT NULL REFERENCES "reminder_manualnewsletter" ("id") DEFERRABLE INITIALLY DEFERRED,
    "message" varchar(255) NOT NULL,
    "traceback" text NOT NULL
)
;
CREATE TABLE "reminder_queuedemail" (
    "id" serial NOT NULL PRIMARY KEY,
    "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED,
    "manual_newsletter_id" integer NOT NULL REFERENCES "reminder_manualnewsletter" ("id") DEFERRABLE INITIALLY DEFERRED,
    "created" timestamp with time zone NOT NULL
)
;
CREATE TABLE "reminder_sentemail" (
    "id" serial NOT NULL PRIMARY KEY,
    "user_id" integer NOT NULL REFERENCES "auth_user" ("id") DEFERRABLE INITIALLY DEFERRED,
    "manual_newsletter_id" integer NOT NULL REFERENCES "reminder_manualnewsletter" ("id") DEFERRABLE INITIALLY DEFERRED,
    "queued" timestamp with time zone NOT NULL,
    "sent" timestamp with time zone NOT NULL
)
;
COMMIT;
