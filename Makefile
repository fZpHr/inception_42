all:
	@sudo mkdir -p /home/hbelle/data/mysql
	@sudo mkdir -p /home/hbelle/data/wordpress
	@sudo docker compose -f ./srcs/docker-compose.yml up -d
	@make check-dir
check-dir:
	@count=0; \
	while [ $$count -lt 30 ]; do \
		if [ -d "/home/hbelle/data/wordpress/wp-content" ]; then \
			echo "Directory exists. Exiting loop."; \
			break; \
		else \
			echo "Directory does not exist. Waiting..."; \
			sleep 1; \
			count=$$((count+1)); \
		fi; \
	done; \
	if [ $$count -eq 30 ]; then \
		echo "Directory still does not exist after 30 seconds. Running make all."; \
		make down; \
		make all; \
	fi

down:
	@sudo docker compose -f ./srcs/docker-compose.yml down
	@sudo rm -rf /home/hbelle/data/mysql
	@sudo rm -rf /home/hbelle/data/wordpress
	@sudo docker volume rm srcs_portainer_data
	@sudo docker volume rm srcs_web
	@sudo docker volume rm srcs_database
	@sudo docker rmi $$(docker images -a -q) -f

stop:
	@sudo docker compose -f ./srcs/docker-compose.yml stop

re:
	@make down
	@make all