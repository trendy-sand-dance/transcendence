SHELL	:= /bin/bash

up: 
	source set-env.sh && docker compose up

clean:
	@docker stop $$(docker ps -qa) || true
	@docker rm $$(docker ps -qa) || true

deepclean:
	@docker system prune -a
	@docker volume prune -a
