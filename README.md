## Ghost Dockerfile

### Base Docker Image

* [ghost:3.1.1-alpine](https://registry.hub.docker.com/_/ghost/)


### Installation

#### Building yourself

```bash
git clone https://github.com/emilol/docker-ghost-cloudinary.git
cd docker-ghost-cloudinary
docker build -t emilol/docker-ghost-cloudinary .
```

#### From DockerHub

```bash
docker pull emilol/docker-ghost-cloudinary
```

### Usage

    docker run -d -p 80:2368 emilol/docker-ghost-cloudinary

#### Customizing Ghost

    docker run -d -p 80:2368 -e [ENVIRONMENT_VARIABLES] -v <override-dir>:/var/lib/ghost/content emilol/docker-ghost-cloudinary

A complete running command line could be:

```ps1
docker run -d -p 2368:2368 -v /opt/data:/var/lib/ghost/content emilol/docker-ghost-cloudinary`
 bash -c "su-exec node ghost config storage.cloudinary-store.cloud_name '$env:CLOUDINARY_CLOUD_NAME';
    su-exec node ghost config storage.cloudinary-store.api_key '$env:CLOUDINARY_API_KEY';
    su-exec node ghost config storage.cloudinary-store.api_secret '$env:CLOUDINARY_API_SECRET';
    node current/index.js"
```