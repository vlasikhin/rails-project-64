setup:
		yarn install
		bin/setup

start:
		bin/rails s -p 3001 -b "0.0.0.0"

console:
		bin/rails console

test:
		bin/rails test

.PHONY: test

lint:
		bundle exec rubocop

# ci
install:
		gem install slim_lint
		bin/setup
		bin/rails assets:precompile
		bin/rails db:seed

check: test lint
