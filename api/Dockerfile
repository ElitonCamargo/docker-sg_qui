FROM node:lts-alpine

WORKDIR /usr/src/app

# Copia apenas package.json e package-lock para instalar dependências primeiro (cache)
COPY package*.json ./

# Instala dependências (use npm ci se for CI)
RUN npm install --production

# Copia o restante do código
COPY . .

ENV NODE_ENV=production
EXPOSE 3000

# Ajuste o comando se seu package.json usar outro script (ex: "start")
CMD ["npm", "start"]