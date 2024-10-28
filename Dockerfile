FROM ruby:3.3.5-bullseye

LABEL Name=fernandopazcavalcantegithub Version=0.0.1

EXPOSE 4000

RUN bundle config --global frozen 1

WORKDIR /app
COPY . /app

COPY Gemfile Gemfile.lock ./

RUN bundle lock --add-platform ruby
RUN bundle lock --add-platform x86_64-linux

RUN bundle install

CMD ["bundle", "exec",  "jekyll", "serve"]
