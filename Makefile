build:
	docker build -t gorilonmax/docker-for-nodejs-developers:1.0.0 -t gorilonmax/docker-for-nodejs-developers:latest .

rebuild: stop rm delete build

delete:
	docker rmi gorilonmax/docker-for-nodejs-developers:latest

run:
	docker run -d -p 8081-8099:8081-8099 -p 8000-8002:8000-8002 --name development \
	--dns=10.16.1.20 \
	--dns=8.8.8.8 \
	-v "$(HOME)/Workspace":/Workspace \
	-v "$(HOME)/.ssh":/home/ubuntu/.ssh \
	-v C:\usr\local\etc\config:/usr/local/etc/config \
	-e GIT_PROMPT_ONLY_IN_REPO=0 \
	-e TERM=xterm-256color \
	-u ubuntu \
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
