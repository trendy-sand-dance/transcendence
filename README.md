<div align=center>

# Transcendence / Club Pong


A Habbo Hotel-inspired isometric world, where players can hangout, chat, and play pong in realtime against each other.
This repo will setup and run the services making up the transcendence project ([database-service](https://github.com/trendy-sand-dance/database), [frontend-service](https://github.com/trendy-sand-dance/frontend), [gameserver-service](https://github.com/trendy-sand-dance/gameserver), [usermanagement-service](https://github.com/trendy-sand-dance/user-management)).
</div>

> [!WARNING]
> This project is still in early development


## About
It currently only contains one `docker-compose.yml` file which pulls down the latest images.
For local building local images you can set the paths `set-env.sh` so docker can build them.

In the future we can run integration tests in this repo as well.
> [!NOTE]
> For now you'll need to manually edit the `docker-compose.yml` file to uncomment the `extends` and `build` block if you wanna build locally, as well as add the paths in the set-env script

## Table of contents

- ⚡️[Running](#features)
  - [.env file](#env-file)
  - [Dev usage](#dev-usage)
- ⚙️ [Repo configuration](#repo-configuration)
  - [Rebases instead of merge](#use-rebases-instead-of-merges)
  - [Commit to main with PRs](#only-commit-on-main-using-prs)
- 🛠️ [Issues](#issues)
  - [Docker unauthenticated](#docker-unauthenticated)
  - [Package not building](#package-not-building)

## ⚡️ Running

### .env file
After cloning the repo rename the `.env.example` -> `.env` and set its values accordingly, docker compose will need them.

#### Setup google OAuth2
1. go to this [link](https://console.cloud.google.com/auth/clients/751565822954-789ipckp9r3erbl966a6n8rbjp34mdcv.apps.googleusercontent.com?inv=1&invt=Ab0Q-w&project=clubpong) in google and login with the `ftclubpong` account, the credentials are stored in our notion page.
2. Get the hostname of your machine by running `hostname` command - you can also run `hostname | xclip -selection c` to copy it directly to your clipboard.
3. Under `Authorized JavaScript origins` set the hostname to the hostname of your local computer.
4. Same thing for Under `Authorized redirect URIs` set the hostname to the hostname of your local computer.
5. In `Additional information` grab the `Client ID` and `Client Secret` and put those in the .env file
6. Save that shit and be done.





### Dev usage
Setup the paths to the locally cloned repos in a file called `set-env.sh`.

Before you run any `docker compose` commands make sure to `source` the file first, this will load all the environment variables into **your** environment.
```
source set-env.sh
```

After that you can go ahead and hit em' the following command.
> [!NOTE]
> 🤓 - **Quick tip**: Arguments specified square brackets are ***optional***.

```
docker compose build [CONTAINER_NAME]
```
If you wanna forcefully rebuild the container(s) you can run.
```
docker compose build --no-cache [CONTAINER_NAME]
```
Actually run the container(s)
```
docker compose up [CONTAINER_NAME]
```
Cleaning up the volumes without having to rebuild the entire image
```
docker compose down --volumes
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

