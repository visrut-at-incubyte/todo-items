#!/bin/bash

# Start Docker Compose in detached mode
docker-compose up -d

stdbuf -oL docker-compose logs -f app

# Run the tests
docker-compose exec app bundle exec rspec

# Capture the exit code of the tests
TEST_EXIT_CODE=$?

# Shutdown Docker Compose
docker-compose down

# Exit with the test's exit code
exit $TEST_EXIT_CODE