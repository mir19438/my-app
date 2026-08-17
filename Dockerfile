FROM node:20-alpine

ARG COMMIT_HASH=unknown
# অ্যাপ যেন process.env.GIT_COMMIT_HASH পড়তে পারে
ENV GIT_COMMIT_HASH=$COMMIT_HASH

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install --production

COPY . .

EXPOSE 80
CMD ["npm", "start"]