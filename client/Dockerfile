#Stage 1
FROM node:14.18.3-alpine as build

RUN mkdir -p /app/frontend/client/

WORKDIR /app/frontend/client/

COPY ./package.json /app/frontend/client/

RUN npm install

COPY . /app/frontend/client/

RUN npm run build

#Stage 2
FROM nginx:latest

COPY nginx.conf /etc/nginx/conf.d/default.conf

COPY --from=build /app/frontend/client/dist/client/ /usr/share/nginx/html

EXPOSE 80
