# build phase

FROM node:alpine
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

# run phase
FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html

# default of this container will start nginx on its own; no need for RUN
