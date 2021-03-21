FROM node:alpine as 0

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
COPY --from=0 /app/build /usr/share/nginx/html
