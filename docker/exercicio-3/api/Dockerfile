FROM node:22-alpine AS base
WORKDIR /app
COPY package*.json ./
# ponytail: no devDependencies (node --watch replaces nodemon) — move `npm ci` into the dev stage if one is added
RUN npm ci --omit=dev

# dev: code is bind-mounted by docker-compose.dev.yml, node restarts on change
FROM base AS dev
ENV NODE_ENV=development
COPY src ./src
CMD ["node", "--watch", "src/index.js"]

# prod: code baked into the image, no volumes, non-root user
FROM base AS prod
ENV NODE_ENV=production
COPY src ./src
USER node
EXPOSE 3000
CMD ["node", "src/index.js"]
