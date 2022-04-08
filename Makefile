first-time-setup:
	terraform -chdir=./terraform init
	go mod init github.com/ralbear/go_localstack
	go mod vendor

start:
	docker-compose -f ./development/docker-compose.yml up -d

stop:
	docker-compose -f ./development/docker-compose.yml stop

build:
	CGO_ENABLED=0 GOARCH=amd64 GOOS=linux go build -ldflags "-s -w" -o ./bin/main ./app/main.go
	rm -f ./bin/terraformFunction.zip
	zip -r -j ./bin/terraformFunction.zip ./bin/main
	rm ./bin/main

terraform-plan:
	terraform -chdir=./terraform plan

terraform-apply:
	terraform -chdir=./terraform apply -auto-approve

terraform-destroy:
	terraform -chdir=./terraform destroy

build-and-deploy:
	$(MAKE) build
	$(MAKE) terraform-apply
