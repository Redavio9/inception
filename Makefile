name = inception
all:
	@printf "Launch configuration ${name}...\n"
	# @bash srcs/requirements/wordpress/tools/make_dir.sh
	@docker-compose -f ./docker-compose.yml up -d

build:
	@printf "Building configuration ${name}...\n"
	# @bash srcs/requirements/wordpress/tools/make_dir.sh
	@docker-compose -f ./docker-compose.yml -d --build

down:
	@printf "Stopping configuration ${name}...\n"
	@docker-compose -f ./docker-compose.yml down

re:
	@printf "Rebuild configuration ${name}...\n"
	@docker-compose -f ./docker-compose.yml -d --build

clean: down
	@printf "Cleaning configuration ${name}...\n"
	@docker system prune -a
	@sudo rm -rf ~/data/wordpress/*
	@sudo rm -rf ~/data/mariadb/*

# Осторожно! Fclean удаляет все образы Docker которые есть на машине!
fclean:
	@printf "Total clean of all configurations docker\n"
	@docker stop $$(docker ps -qa)
	@docker system prune --all --force --volumes
	@docker network prune --force
	@docker volume prune --force
	@sudo rm -rf ~/data/wordpress/*
	@sudo rm -rf ~/data/mariadb/*

.PHONY	: all build down re clean fclean