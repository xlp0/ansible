BACKUPANDRESTORE_DIR=/var/www/html/extensions/BackupAndRestore

build:
	docker buildx build -t pkc/ansible . --load
	docker save pkc/ansible:latest | gzip > dockerizedansible.tar.gz

shutdown:
	docker-compose down --volumes

removeAllImages: backupNow
	docker-compose down --volumes
	docker rmi -f $(shell docker images -q)

backupNow:
	docker ps
	
run_ansible:
	docker-compose up -d

connect:	run_ansible
	docker exec -it ansible /bin/bash
