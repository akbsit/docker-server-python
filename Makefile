start:
	ansible-playbook --vault-id password ansible/playbooks/init.yml -i ansible/hosts.yml
	docker-compose up -d --remove-orphans

stop:
	docker-compose stop

restart:
	make stop
	make start

rebuild:
	make stop
	ansible-playbook --vault-id password ansible/playbooks/init.yml -i ansible/hosts.yml
	docker-compose up -d --force-recreate --build
