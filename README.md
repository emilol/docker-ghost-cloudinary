## Ghost Dockerfile

### Base Docker Image

* [ghost:3.1.1-alpine](https://registry.hub.docker.com/_/ghost/)

### Installation

#### Building yourself

```bash
git clone https://github.com/emilol/docker-ghost-cloudinary.git
cd docker-ghost-cloudinary
docker build -t emilol/ghost-cloudinary .
```

#### From DockerHub

```bash
docker pull emilol/ghost-cloudinary
```

### Usage

    docker run -d -p 80:2368 emilol/ghost-cloudinary

#### Customizing Ghost

    docker run -d -p 80:2368 -e [ENVIRONMENT_VARIABLES] -v <override-dir>:/var/lib/ghost/content emilol/ghost-cloudinary

A complete running command line could be:

```sh
> cd ./docker-ghost-cloudinary
> export CLOUDINARY_CLOUD_NAME='your cloud name'
> export CLOUDINARY_API_KEY='your api key'
> export CLOUDINARY_API_SECRET='your api secret'
> docker-compose up -d
```