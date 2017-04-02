build:
	docker build -t gorilonmax/docker-for-nodejs-developers:1.0.0 -t gorilonmax/docker-for-nodejs-developers:latest .

rebuild: stop rm delete build
delete:
	docker rmi gorilonmax/docker-for-nodejs-developers:latest

run:
	docker run -d -p 8081-8099:8081-8099 -p 8000-8002:8000-8002 --name development \
	--dns=8.8.8.8 \
	-v C:\Users\albmendo\Workspace:/Workspace \
	-v C:\Users\albmendo\.ssh:/home/developer/.ssh \
	-e GIT_PROMPT_ONLY_IN_REPO=1 \
	-e TERM=xterm-256color \
	gorilonmax/docker-for-nodejs-developers \
	redis-server

reload: stop rm run

stop:
	docker stop development

rm:
	docker rm development

terminal:
	docker exec -it development /bin/bash

logs:
	docker logs development