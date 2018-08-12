FROM node:8

# Install dependencies
RUN apt-get update && \
apt-get -yq install libatk1.0-0 libgtk2.0-0 libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 libasound2 xauth xvfb

# Cleanup
RUN rm -rf /var/lib/apt/lists/* && apt-get purge --auto-remove && rm -rf /src/*.deb

# It's a good idea to use dumb-init to help prevent zombie chrome processes.
ADD https://github.com/Yelp/dumb-init/releases/download/v1.2.0/dumb-init_1.2.0_amd64 /usr/local/bin/dumb-init
RUN chmod +x /usr/local/bin/dumb-init

# Cd into /app
WORKDIR /app

# Copy package.json into app folder
COPY package.json /app

# Install dependencies
RUN npm install 

COPY . /app

ENTRYPOINT ["dumb-init", "--"]

# Start script on Xvfb
CMD xvfb-run node app/index.js