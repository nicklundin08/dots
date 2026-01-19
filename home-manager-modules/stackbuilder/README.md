# Stackbuilder

Stackbuilder is a set of scripts + templates that allow you to build up a web development stack quickly without having to re-hash best practices

Most of these parts a web-development specific but some of them apply more broadly to software development.

The scripts themselves are not that customizable. The intent is to provide a default structure with sane defaults (without having to clone an existing template repo) and customize from there as needed


:warning: This is not intended to be a fully fledged project to clone


### Sample usage


```
stackbuilder.add_git .

stackbuilder.add_docs .

stackbuilder.add_nix .

stackbuilder.add_docker .

stackbuilder.add_openapi .

stackbuilder.add_liquibase .

stackbuilder.add_java_backend .

stackbuilder.add_angular_frontend .
```
