FROM ruby:3.0

RUN apt-get update
RUN curl -sL https://deb.nodesource.com/setup_17.x | bash -
RUN apt-get install -y nodejs

Add . /app
WORKDIR /app

run gem install rails
run gem install bundler 
run gem update
RUN gem update bundler

# create rails app if it does not exist (create-app.sh)
COPY create-app.sh /usr/local/bin/create-app.sh
RUN chmod +x /usr/local/bin/create-app.sh

ENTRYPOINT ["/usr/local/bin/create-app.sh"]
