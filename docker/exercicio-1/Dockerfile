FROM node:22-alpine

WORKDIR /app

# Dependencies first: this layer stays cached until package*.json changes
COPY package*.json ./
RUN npm ci --omit=dev

COPY src ./src

USER node
EXPOSE 3000
CMD ["node", "src/index.js"]
