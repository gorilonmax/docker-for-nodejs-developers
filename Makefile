build:
	docker build -t gorilonmax/docker-for-nodejs-developers:1.0.0 \
	gorilonmax/docker-for-nodejs-developers:latest .
delete:

run:
	docker run gorilonmax/docker-for-nodejs-developers
stop:
	docker stop gorilonmax/docker-for-nodejs-developers
terminal:
	docker exec -i -t /bin/bash
