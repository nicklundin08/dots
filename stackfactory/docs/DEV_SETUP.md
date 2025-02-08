# DEV_SETUP

### (If not already installed) Install nix and dev env

- https://nixos.org/download/
- https://direnv.net/

```
// NOTE: you must be in a git repo with the flake file tracked for this to work! Make sure to run git init...

direnv allow

direnv reload
```

### Env vars
```
source ./envs/local.env
```

### Build scripts

All top level build scripts are built on top of [Taskfile](https://taskfile.dev/)


To view the available tasks run something the following command

```
task --list-all

```
The default task can be executed like this

```
task default

OR

task
```

To print more information about the task you can run

```
task default --summary
```
