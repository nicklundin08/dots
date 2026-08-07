-- liquibase formatted sql
-- changeset nick_lundin:3
CREATE TABLE app_roles (
  id serial primary key,
  display_name text,
  created_at timestamptz not null default now(),
  updated_at timestamptz,
  deleted_at timestamptz
);

CREATE UNIQUE INDEX app_roles_ux_name on app_roles (display_name);

CREATE TABLE app_user_roles (
  id serial primary key,
  app_user_id bigint REFERENCES app_users (id),
  app_role_id bigint REFERENCES app_roles (id),
  created_at timestamptz not null default now(),
  updated_at timestamptz,
  deleted_at timestamptz
);

CREATE UNIQUE INDEX app_user_roles_ux_user_id_role_id ON app_user_roles (app_user_id, app_role_id);

--rollback drop table app_roles;
--rollback drop table app_user_roles;
