# stage 1
FROM node:latest as node
MAINTAINER TheSpiritMan
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod

# stage 2
FROM ubuntu/nginx
COPY --from=node /app/dist/simplilearn-dev-ops-project1-angular /var/www/html
