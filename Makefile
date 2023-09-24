up:
	@docker-compose -f srcs/docker-compose.yml up --build

down:
	@docker-compose -f srcs/docker-compose.yml down

re: down up

clean:
	@rm -rf /home/ebouabba/data/mariadb/*
	@rm -rf /home/ebouabba/data/wordpress/*

fclean:
	@rm -rf srcs/requirements/volumes/mariadb/*
	@rm -rf srcs/requirements/volumes/wordpress/*
	@docker system prune --all  -f
	@docker stop $(docker ps -qa); docker rm $(docker ps -qa); docker rmi -f $(docker images -qa); docker volume rm $(docker volume ls -q); docker network rm $(docker network ls -q) 2>/dev/null 

.PHONY: up down clean fclean
