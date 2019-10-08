FROM node:10

# Instala nossas dependencias
RUN apt-get update && \
    apt-get install -qq -y --no-install-recommends \
    yarn \
    build-essential \
    libpq-dev \
    imagemagick \
    git-all \
    nano

# Seta nosso path
ENV INSTALL_PATH /modulo2

# Cria nosso diretório
RUN mkdir -p $INSTALL_PATH

# Seta nosso path como o diretório principal
WORKDIR $INSTALL_PATH

COPY package*.json ./

RUN yarn install --check-files

COPY . ./

EXPOSE 3000

CMD ["yarn", "npm", "start"]