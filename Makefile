

all: volume
	docker-compose up --build -d

volume:
	docker volume create --driver local \
	--opt type=none \
	--opt device=/tmp/webroot \
	--opt o=bind webroot
