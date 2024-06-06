CREATE_V = sh srcs/requirements/tools/init.sh
RM_V = sh srcs/requirements/tools/rm.sh

all: build up

build:
	@echo "Building images..."
	@$(CREATE_V)
	@sudo docker compose -f ./srcs/docker-compose.yml build

up:
	@echo "Creating containers..."
	@$(CREATE_V)
	@sudo docker compose -f ./srcs/docker-compose.yml build
	sudo docker compose -f ./srcs/docker-compose.yml up -d

down:
	@echo "Removing containers..."
	@sudo docker compose -f ./srcs/docker-compose.yml down
	@sudo docker compose -f ./srcs/docker-compose.yml down -v

clean : down
	sudo docker stop $$(sudo docker ps -qa); \
	sudo docker rm $$(sudo docker ps -qa); \
	sudo docker rmi -f $$(sudo docker images -qa); \
	sudo docker volume rm $$(sudo docker volume ls -q); \
	sudo docker network rm $$(sudo docker network ls -q) || true

fclean: clean
	@$(RM_V)
	@sudo docker system prune -a -f
	@echo "Full cleaning..."
	
re: fclean all

.PHONY: clean fclean re up down build all