FROM node:18 alpine AS build
WORKDIR /app
COPY package*.json ./
npm install
COPY . .

FROM node:18-slim
WORKDIR /app
COPY --from=build /app /app
EXPOSE 5000
CMD['node','index.js']
