# হালকা ওজনের Node.js বেস ইমেজ
FROM node:20-alpine

# বিল্ড আর্গুমেন্ট হিসেবে গিট হাশ রিসিভ করা
ARG COMMIT_HASH=unknown
ENV COMMIT_HASH=$COMMIT_HASH

# কন্টেইনারের ভেতরের ওয়ার্কিং ফোল্ডার
WORKDIR /usr/src/app

# প্যাকেজ ফাইল কপি এবং ডিপেন্ডেন্সি ইনস্টল
COPY package*.json ./
RUN npm install --production

# প্রজেক্টের বাকি সব ফাইল কপি করা
COPY . .

# কন্টেইনারের পোর্ট এক্সপোজ করা
EXPOSE 80

# অ্যাপ স্টার্ট করার কমান্ড
CMD ["npm", "start"]