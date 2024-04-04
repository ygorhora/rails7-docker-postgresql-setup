SHELL := /bin/bash # Use bash syntax
	
setup_rails: clean build
	docker compose up setup --remove-orphans
	$(MAKE) rails_build

build:
	docker compose build --no-cache

db_up:
	docker compose -f ./project/docker-compose.yml up db

db_down:
	docker compose -f ./project/docker-compose.yml down db || true
	
db_clean: db_down
	rm -rf ./data

rails_build:
	docker compose -f ./project/docker-compose.yml build --no-cache app

rails_up:
	docker compose -f ./project/docker-compose.yml up app

rails_down:
	docker compose -f ./project/docker-compose.yml down app || true

rails_clean: rails_down
	rm -rf ./project

clean: db_clean rails_clean

project_down: rails_down db_down