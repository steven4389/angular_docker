FROM node:latest as node
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build --prod --verbose

FROM nginx:alpine
COPY --from=node /app/dist/angulardocker /usr/share/nginx/html
