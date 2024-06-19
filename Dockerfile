# Use an official Ruby runtime as a parent image
FROM ruby:3.3.1

# Set the working directory in the container
WORKDIR /usr/src/app

# Install dependencies
COPY Gemfile* ./
RUN bundle install

# Copy the rest of the application code
COPY . .

# Set the environment to development
ENV RACK_ENV=development

# Command to run RSpec tests
CMD ["bundle", "exec", "rspec"]
