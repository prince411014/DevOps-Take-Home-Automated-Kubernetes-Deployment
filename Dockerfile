# Stage 1: build
FROM node:18-alpine AS build
WORKDIR /app
COPY app/package.json app/package-lock.json* ./
RUN npm ci --only=production
COPY app ./

# Stage 2: runtime
FROM node:18-alpine
WORKDIR /app
COPY --from=build /app /app
ENV NODE_ENV=production
EXPOSE 3000
CMD [ "node", "app.js" ]
