LOGIN = $(USER)

all: up

up:
	mkdir -p /home/$(LOGIN)/data/mariadb
	mkdir -p /home/$(LOGIN)/data/wordpress
# Creation of persistent volumes

	docker compose -f ./srcs/docker-compose.yml up -d
# Foreground launch with docker-compose file

down:
	printf "Containers down\n"
	docker compose -f ./srcs/docker-compose.yml down -v
# Containers down

clean: down
	printf "Delete /home/$(LOGIN)/data\n"
	sudo rm -rf /home/$(LOGIN)/data
# Suppression of persistent volumes

fclean: clean
	printf "Delete containers images\n"
	docker system prune -af --volumes
# Docker full cleaning

re: fclean up

.PHONY: all up down clean fclean re

ifndef VERBOSE
.SILENT:
endif

# TLS Certificate : openssl s_client -connect localhost:443 -tls1_2
# > docker exec -it mariadb bash
# > mysql -utobourge -p1234
# > SHOW DATABASES;
# > USE wordpress
# > SHOW TABLES;