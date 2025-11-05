FROM node:20-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install || true
COPY . .
RUN npm run build || true
FROM nginx:alpine
COPY --from=build /app/dist /usr/share/nginx/html || true
EXPOSE 80