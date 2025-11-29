-- liquibase formatted sql
-- changeset nick_lundin:2
CREATE TABLE app_users (
  id serial primary key,
  uuid uuid,
  version bigint not null default 0,
  created_at timestamptz not null,
  updated_at timestamptz,
  deleted_at timestamptz
);

CREATE UNIQUE INDEX user_uuid_ux on app_users (uuid);

CREATE TABLE app_user_email_addresses (
  id serial primary key,
  app_user_id bigint REFERENCES app_users (id),
  email_address text,
  is_primary boolean,
  verified_at timestamptz,
  created_at timestamptz not null,
  updated_at timestamptz,
  deleted_at timestamptz
);

CREATE UNIQUE INDEX app_user_emails_email_address_ix ON app_user_email_addresses (lower(email_address));

CREATE UNIQUE INDEX app_user_emails_user_id_and_primary ON app_user_email_addresses (app_user_id)
where
  is_primary = TRUE;

--rollback drop table user_emails;
--rollback drop table users;
