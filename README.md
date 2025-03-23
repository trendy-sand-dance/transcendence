<div align=center>

# transcendence
This repo will setup and run the services making up the transcendence project.
</div>

## About
It currently only contains one `docker_compose.yml` file which pulls down all the latest images.
In the future we can run integration tests in this repo aswell.



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

