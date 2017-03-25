build:
	docker build -t gorilonmax/docker-for-nodejs-developers:1.0.0 \
	gorilonmax/docker-for-nodejs-developers:latest .
delete:

run:
	docker run
	docker run -P --name development -v /webapp gorilonmax/docker-for-nodejs-developers python app.py
stop:
	docker stop development
terminal:
	docker exec -i -t /bin/bash
