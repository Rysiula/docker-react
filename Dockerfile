FROM node:alpine as builder

WORKDIR /app
COPY package.json .
RUN npm install

COPY . .
#RUN apk add --update redis
#ENV  PATH="/usr/local/bin:${PATH}"
#ENTRYPOINT ["npm", "run",  "start"]

RUN npm run build

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
