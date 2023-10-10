#!/bin/bash

echo "cloning repo: paradise-frontend-opensource"
git clone https://github.com/tiltysola/paradise-frontend-opensource.git

echo "cloning repo: paradise-backend-opensource"
git clone https://github.com/tiltysola/paradise-backend-opensource.git

echo "building repo: paradise-frontend-opensource"
cd paradise-frontend-opensource
if [ ! -d "./node_modules" ]; then
  npm i --registry=https://registry.npmmirror.com
fi
npm run build
cd ../

echo "building repo: paradise-backend-opensource"
cd paradise-backend-opensource
if [ ! -d "./node_modules" ]; then
  npm i --registry=https://registry.npmmirror.com
fi
npm run build
cd ../

echo "copy assets: paradise-backend-opensource"
cp -r ./paradise-backend-opensource/public ./public

echo "copy build assets: paradise-frontend-opensource"
cp ./paradise-frontend-opensource/dist/index.css ./public/index.css
cp ./paradise-frontend-opensource/dist/index.js ./public/index.js

echo "link modules: paradise-backend-opensource"
ln -s ./paradise-backend-opensource/node_modules ./node_modules

cp ./paradise-backend-opensource/.env.example ./.env

echo "please configure .env file, then: npm run serve"
