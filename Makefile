all: down
	docker-compose up --build -d

down:
	docker-compose down -t 2

volume:
	docker volume create --driver local \
	--opt type=none \
	--opt device=/tmp/webroot \
	--opt o=bind webroot

dockerhub-list-limits:
	TOKEN=$(curl --user 'morfield:r6rUY6hvMj6WB5YaFT9HSLaeRF6' "https://auth.docker.io/token?service=registry.docker.io&scope=repository:ratelimitpreview/test:pull" | jq -r .token)
	curl --head -H "Authorization: Bearer $TOKEN" https://registry-1.docker.io/v2/ratelimitpreview/test/manifests/latest

# log in to inrease download limits
docker-login:
	docker login
machine-shell-start:
	$(docker-machine env default)

machine-shell-stop:
	eval "$(docker-machine env -u)"

AA = $(shell docker-machine env default)
