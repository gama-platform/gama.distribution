# gama.distribution

This repository aims to host & distribute Gama to the many distributions of Linux.
At every release, the latest version of Gama will be exposed in the following formats:

- Apt
- Docker
- Flatpak

> [!IMPORTANT]
> It's worth noting that alpha versions are not distributed through this repository. Every new alpha version is completely replacing the new one.
> 
> Alpha packages are by definition unstable and thus not recommended for normal use.


## Install gama from the repository

### Apt

First add the repository to your system:
```bash
sudo -i
apt update
apt install ca-certificates
echo "deb [trusted=yes] https://distribution.gama-platform.org/ppa/ppa ./" | sudo tee -a /etc/apt/sources.list
```

Then install Gama:
```bash
# Install Gama
sudo apt update
sudo apt install gama-platform
```

## Setup the repo

If you are not a maintainer, you can skip this section.

### Host the repository

- Go to your CloudFlare dashboard
- Click on `Workers & Pages`, then `Pages` and `Connect to git`
- Select the repository
- Set framework as `Jekyll`
- Set build command as `jekyll build && cat __site/_headers.d/* > _site/_headers` to use headers
- Set the following secrets: 
    - `BOT_GH_EMAIL` (the email of the bot account)
    - `BOT_GH_NAME` (the name of the bot account)
    - `DOCKER_HUB_USERNAME` (the username of the dockerhub account)
    - `DOCKER_HUB_PASSWORD` (the password of the dockerhub account)

### Structure of the repository

- `__site`: contains what will be in the root of the website (such as the `_header` file)
- `ppa`: contains the files for the apt repository
- `docker`: contains the dockerfiles for each version of gama
- `<distribution>/scripts`: scripts used in `<distribution>` workflow
- `<distribution>/templates`: templates used in `<distribution>` workflow
