build:
	docker build -t osm/jim .

run:
	docker rm -f awsmanager || true
	docker run --name awsmanager --privileged -d --rm -v ${PWD}:/root/terraform -e AWS_ACCESS_KEY_ID=$(AWS_ACCESS_KEY_ID) -e AWS_SECRET_ACCESS_KEY=$(AWS_SECRET_ACCESS_KEY) osm/jim  /bin/bash

setup-PubVPC:
	docker run --rm -v ${PWD}:/root/terraform -e AWS_ACCESS_KEY_ID=$(AWS_ACCESS_KEY_ID) -e AWS_SECRET_ACCESS_KEY=$(AWS_SECRET_ACCESS_KEY) osm/jim bash -c "cd terraform/PubVPC;terraform get; terraform plan -var aws_region=$(REGION) -var route53_zone_name=$(ROUTE_53_ZONE_NAME) -var vpc_cidr=$(VPC_CIDR) -var vpc_name=$(VPC_NAME)"
	docker run --rm -v ${PWD}:/root/terraform -e AWS_ACCESS_KEY_ID=$(AWS_ACCESS_KEY_ID) -e AWS_SECRET_ACCESS_KEY=$(AWS_SECRET_ACCESS_KEY) osm/jim bash -c "cd terraform/PubVPC;terraform apply -var aws_region=$(REGION) -var route53_zone_name=$(ROUTE_53_ZONE_NAME) -var vpc_cidr=$(VPC_CIDR) -var vpc_name=$(VPC_NAME)"

destroy-PubVPC:
	docker run --rm -v ${PWD}:/root/terraform -e AWS_ACCESS_KEY_ID=$(AWS_ACCESS_KEY_ID) -e AWS_SECRET_ACCESS_KEY=$(AWS_SECRET_ACCESS_KEY) osm/jim bash -c "cd terraform/PubVPC;terraform destroy -f -var aws_region=$(REGION) -var route53_zone_name=$(ROUTE_53_ZONE_NAME) -var vpc_cidr=$(VPC_CIDR) -var vpc_name=$(VPC_NAME)"
