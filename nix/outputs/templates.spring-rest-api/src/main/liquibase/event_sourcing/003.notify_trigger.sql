-- liquibase formatted sql
-- changeset nick_lundin:3 splitStatements:false
CREATE OR REPLACE FUNCTION CHANNEL_EVENT_NOTIFY_FCT ()
    RETURNS TRIGGER
    AS $BODY$
DECLARE
    aggregate_type text;
BEGIN
    SELECT
        a.AGGREGATE_TYPE INTO aggregate_type
    FROM
        ES_AGGREGATE a
    WHERE
        a.ID = NEW.AGGREGATE_ID;
    PERFORM
        pg_notify('channel_event_notify', aggregate_type);
    RETURN NEW;
END;
$BODY$
LANGUAGE PLPGSQL;

CREATE OR REPLACE TRIGGER CHANNEL_EVENT_NOTIFY_TRG
    AFTER INSERT ON ES_EVENT
    FOR EACH ROW
    EXECUTE PROCEDURE CHANNEL_EVENT_NOTIFY_FCT ();
