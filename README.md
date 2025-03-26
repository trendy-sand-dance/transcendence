<div align=center>

# transcendence
This repo will setup and run the services making up the transcendence project.
</div>


# TODO / Reading list
- https://docs.docker.com/reference/compose-file/interpolation/
- https://docs.docker.com/reference/compose-file/include/


## About
It currently only contains one `docker-compose.yml` file which pulls down the latest images.
For local building local images you can set the paths `set-env.sh` so docker can build them.

In the future we can run integration tests in this repo as well.

## Table of contents

- ⚡️[Running](#features)
  - [Dev usage](#dev-usage)
- ⚙️ [Repo configuration](#repo-configuration)
  - [Rebases instead of merge](#use-rebases-instead-of-merges)
  - [Commit to main with PRs](#only-commit-on-main-using-prs)
- 🛠️ [Issues](#issues)
  - [Docker unauthenticated](#docker-unauthenticated)
  - [Package not building](#package-not-building)

## ⚡️ Running

### Dev usage
Setup the paths to the locally cloned repos in a file called `set-env.sh`.
> [!NOTE]
> This file does not exist because it will be personal for everyone's use case, you can use `set-env.sh.example` as a starting point to create your own.

Before you run any `docker compose` commands make sure to `source` the file first, this will load all the environment variables into **your** environment.
```
source set-env.sh
```
After that you can go ahead and hit em' the following command.
```
cat docker-compose.yml | envsubst | docker compose -f /dev/stdin build
```
```
cat docker-compose.yml | envsubst | docker compose -f /dev/stdin up
```


## ⚙️  Repo configuration
After you've created a repo based on this template you should setup the branch rules.
#### Use rebases instead of merges
1. In your repo go to `Settings -> General`, scroll down to `Pull Requests` and disable `Allow merge commits`.
2. In `Allow squash merging` set the `Default commit message` to `Pull request title`.

#### Only commit on main using PRs
1. Go to `Settings -> Rules -> Rulesets` and create a `New ruleset -> New branch ruleset` give it a name like "protect main"
2. The the `Enforcement status` to `Active`.
3. Scroll down to `Targets` `Add target -> Include default branch`.
4. Scroll further down to `Rules` and enable `Require a pull request before merging`.
5. Expand the `Additional settings` the set `Allowed merge methods` to **Squash** and **Rebase**.


## 🛠️ Issues

### Docker unauthenticated
```
docker: unauthorized: unauthorized
```
Not sure why this happens, all of your packages are `publicly` available. I fixed it by logging out of any github docker repos using.
```
docker logout ghcr.io
```

#### Package not building
This is because after you fork github automagically disables any actions, in order to enable them just go to the `Actions` tab in the repo's homepage.

