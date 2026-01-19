-- liquibase formatted sql
-- changeset nick_lundin:2
CREATE TABLE pets (
  id serial primary key,
  first_name text not null,
  tag text
);

CREATE INDEX pets_tags_ix on pets (tag);

--rollback drop table pets;
