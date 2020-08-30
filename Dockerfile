# Use an existing docker image as base
FROM node:alpine AS builder

WORKDIR /usr/app

# Download and install dependencies
COPY ./package.json ./
RUN npm install

COPY ./ ./

# Starting image container instructions
CMD ["npm", "run", "build"]

FROM nginx
COPY --from=builder /usr/app/build /usr/share/nginx/html

