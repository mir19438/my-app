FROM node:20-alpine

ARG COMMIT_HASH=unknown
# So that the app can read process.env.GIT_COMMIT_HASH.
ENV GIT_COMMIT_HASH=$COMMIT_HASH

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm install --production

COPY . .

EXPOSE 80
CMD ["npm", "start"]