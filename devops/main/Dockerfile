FROM node:14.17

WORKDIR /home/node/app/
USER root
RUN chown node:node /home/node -R
ADD --chown=node:node package.json package.json
USER node
RUN yarn --network-timeout 6000000
RUN yarn build
ADD --chown=node:node . .

FROM nginx:1.16
COPY --from=0 /home/node/app/dist /etc/nginx/www/
COPY nginx.conf /etc/nginx/nginx.conf
CMD /bin/bash -c "exec nginx -g 'daemon off;'"