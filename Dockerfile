FROM node:lts-alpine3.12 as builder

WORKDIR /app

COPY package.json .

RUN yarn install

COPY . .

RUN yarn run build

FROM nginx

EXPOSE 80

COPY --from=builder /app/build /usr/share/nginx/html
