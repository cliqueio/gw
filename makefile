up:
	docker-compose up --build -d

stop:
	docker-compose stop

restart:
	docker-compose stop
	docker-compose up --build -d

build:
	docker-compose build

down:
	docker-compose down

migrate_up:
	docker exec -it $$(docker ps | grep server_ | awk '{{ print $$1 }}') sh -c "migrate -source file:/abac/pkg/storage/postgres/migrations -database \$$POSTGRES_URL up"

migrate_down:
	docker exec -it $$(docker ps | grep server_ | awk '{{ print $$1 }}') sh -c "migrate -source file:/abac/pkg/storage/postgres/migrations -database \$$POSTGRES_URL down"
