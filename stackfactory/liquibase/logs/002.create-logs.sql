-- liquibase formatted sql
-- changeset nick_lundin:2
CREATE TABLE logs (
  id serial primary key,
  message text not null,
  mdc text not null,
  timestamp bigint not null,
  log_level text not null
);

--rollback drop table logs;
