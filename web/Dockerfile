FROM node:lts-alpine

WORKDIR /usr/src/app

# Copia package.json para instalar dependências
COPY package*.json ./

RUN npm install --production

# Copia o restante (inclui server.js e public)
COPY . .

ENV NODE_ENV=production
EXPOSE 8080

# Usa o script "start" (server.js) definido no package.json
CMD ["npm", "start"]