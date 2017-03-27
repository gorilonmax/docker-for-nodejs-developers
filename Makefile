build:
	docker build -t gorilonmax/docker-for-nodejs-developers:1.0.0 -t gorilonmax/docker-for-nodejs-developers:latest .

delete:
	docker rmi gorilonmax/docker-for-nodejs-developers:latest

run:
	docker run -d -t -P --name development \
	--dns=8.8.8.8 \
	-v "C:\Users\Alberto Mendoza\Workspace":/Workspace \
	gorilonmax/docker-for-nodejs-developers tail -f /etc/dummy

stop:
	docker stop development

rm:
	docker rm development

terminal:
	docker exec -i -t development /bin/bash
