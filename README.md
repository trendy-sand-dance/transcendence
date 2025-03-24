<div align=center>

# transcendence
This repo will setup and run the services making up the transcendence project.
</div>

> [!WARNING]
> This repo is not ready for use yet, I still need to add the actual mekanism to swap out the images.

## About
It currently only contains one `docker-compose.yml` file which pulls down the latest images.
For local building local images you can set the paths `set-env.sh` so docker can build them.

In the future we can run integration tests in this repo as well.

## Dev usage
Setup the paths to the locally cloned repos in a file called `set-env.sh`.
> [!NOTE]
> This file does not exist because it will be personal for everyone's use case, you can use `set-env.sh.example` as a starting point to create your own.

Before you run any `docker compose` commands make sure to `source` the file first, this will load all the environment variables into **your** environment.
```
source set-env.sh
```

After that you can go ahead and hit em' with the classic.
```
docker compose build
```
```
docker compose up
```

T.B.A



## Repo configuration
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

#### Fix package not building
This is because after you fork github automagically disables any actions, in order to enable them just goto the `Actions` tab in the repo's homepage.

