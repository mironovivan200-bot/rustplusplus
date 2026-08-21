FROM node:18
RUN apt-get update && apt-get install -y graphicsmagick && apt-get clean
WORKDIR /app
COPY package.json /app/package.json
COPY package-lock.json /app/package-lock.json
RUN npm install
COPY . /app
RUN npm run build && \
    tar -c --exclude='./dist' --exclude='./node_modules' --exclude='./.git' \
           --exclude='*.ts' --exclude='*.js' -f - . | tar -x -f - -C dist
CMD ["node", "dist/index.js"]
