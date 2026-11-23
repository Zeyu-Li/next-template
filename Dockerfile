FROM node:24-alpine AS base
WORKDIR /app

# Cypress is only needed for local e2e tests, so skip its binary download
ENV CYPRESS_INSTALL_BINARY=0

# copy dependencies and install
COPY package.json yarn.lock ./

RUN yarn install --frozen-lockfile

COPY . .


FROM base AS dev
EXPOSE 3000
RUN yarn build
CMD ["yarn", "run", "start"]

# use below for static prod build (requires `output: 'export'` in next.config.js)
# FROM base as int

# RUN yarn build

# FROM nginx:latest as prod

# EXPOSE 80

# COPY nginx.conf /etc/nginx/nginx.conf
# COPY --from=int /app/out/ /var/www/
