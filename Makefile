all:
	@sudo docker compose -f ./srcs/docker-compose.yml up -d

down:
	@sudo docker compose -f ./srcs/docker-compose.yml down
	@sudo rm -rf ./srcs/database
	@sudo rm -rf ./srcs/web


stop:
	@sudo docker compose -f ./srcs/docker-compose.yml stop

