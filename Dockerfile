# First phase, build
FROM node:alpine as builder

WORKDIR '/app'
COPY package.json .
RUN npm install 

COPY . . 

CMD ["npm", "run", "build"]

# Second phase, run
FROM nginx

COPY --from=builder /app/build /usr/share/nginx/html

# the default command from nginx will execute
# so we do not need to specify CMD
