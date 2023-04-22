FROM ruby:3.1.2-alpine3.14

# Install dependencies

RUN apk add --update \
    build-base \
    mariadb-dev \
    sqlite-dev \
    nodejs \
    tzdata \
    && rm -rf /var/cache/apk/*
    

# Set an environment variable where the Rails app is installed to inside of Docker image

RUN gem install bundler

WORKDIR /app

COPY . /app
COPY Gemfile Gemfile.lock ./


RUN bundle install

# Expose port 3000 to the Docker host, so we can access it from the outside.

EXPOSE 3000
CMD rm -f tmp/pids/server.pid & rails s -b '0.0.0.0'



# run docker build --tag rails-with-docker .
# run docker images
# run docker run -p 3000:3000 rails-with-docker

# for volume mapping

# run docker run -p 3000:3000 -v railswithdockerv:/app rails-with-docker


To get the container id 

# run docker ps

To interact with the shell

# run docker exec -it <container id> sh