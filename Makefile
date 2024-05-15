all:
	@sudo docker compose -f ./srcs/docker-compose.yml up -d ; \
	( while [ ! -d "srcs/web/wp-content/plugins/" ]; do sleep 1; done ; \
	sudo cp -rf srcs/requirements/redis/tools/redis-cache srcs/web/wp-content/plugins/ )
	sudo chmod -R 777 srcs/web/wp-content
down:
	@sudo docker compose -f ./srcs/docker-compose.yml down
	@sudo rm -rf ./srcs/database
	@sudo rm -rf ./srcs/web

stop:
	@sudo docker compose -f ./srcs/docker-compose.yml stop