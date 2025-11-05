FROM ruby:3.2
WORKDIR /app
COPY Gemfile* ./
RUN bundle install || true
COPY . .
EXPOSE 3000
CMD ["rails","server","-b","0.0.0.0"]