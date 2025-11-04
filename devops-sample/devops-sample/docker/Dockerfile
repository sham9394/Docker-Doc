# build stage
FROM node:18-alpine AS build
WORKDIR /app
COPY ../app/package.json ./package.json
RUN npm install --production

# final stage
FROM node:18-alpine
WORKDIR /app
COPY --from=build /app/node_modules ./node_modules
COPY ../app/app.js ./app.js
ENV PORT=3000
EXPOSE 3000
CMD ["node", "app.js"]
