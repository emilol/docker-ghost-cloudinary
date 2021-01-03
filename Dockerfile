#Build step for Ghost Plugins
FROM node:10-alpine as plugin-builder

WORKDIR /builder
RUN npm install cloudinary-store --production --loglevel=error && \
  mv node_modules/cloudinary-store ./cloudinary-store && \
  cd cloudinary-store && \ 
  npm install --production --loglevel=error

#Create the Docker Ghost Blog
FROM ghost:3.1.1-alpine

#Install Cloudinary Store into the internal modules
COPY --from=plugin-builder --chown=node /builder/cloudinary-store $GHOST_INSTALL/current/core/server/adapters/storage/cloudinary-store
COPY --from=plugin-builder --chown=node /builder/cloudinary-store $GHOST_INSTALL/current/content/adapters/storage/cloudinary-store