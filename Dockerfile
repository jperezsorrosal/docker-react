# First phase, build
FROM node:alpine

WORKDIR '/app'
COPY package*.json ./
RUN npm install 

COPY ./ ./ 

CMD ["npm", "run", "build"]

# Second phase, run
FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/nginx/html

# the default command from nginx will execute
# so we do not need to specify CMD
