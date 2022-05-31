FROM node:14.17

WORKDIR /home/node/app/

USER root
RUN chown node:node /home/node -R
ADD --chown=node:node package.json package.json

USER node
RUN yarn
ADD --chown=node:node . .
RUN yarn build

FROM nginx:1.17
COPY --from=0 /home/node/app/build /etc/nginx/www/
COPY nginx.conf /etc/nginx/nginx.conf
CMD /bin/bash -c "exec nginx -g 'daemon off;'"