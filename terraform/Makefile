build:
	docker build -t osm/jim .

run:
	docker rm -f awsmanager || true
	docker run --name awsmanager --privileged -d --rm -v ${PWD}:/root/terraform -e AWS_ACCESS_KEY_ID=$(AWS_ACCESS_KEY_ID) -e AWS_SECRET_ACCESS_KEY=$(AWS_SECRET_ACCESS_KEY) osm/jim  /bin/bash

setup-PubVPC:
	docker run --rm -v ~/.ssh/id_rsa.pub:/root/.ssh/id_rsa.pub -v ${PWD}:/root/terraform -e AWS_ACCESS_KEY_ID=$(AWS_ACCESS_KEY_ID) -e AWS_SECRET_ACCESS_KEY=$(AWS_SECRET_ACCESS_KEY) osm/jim bash -c "cd terraform/PubVPC;terraform get; terraform plan  -var-file=\"data.tfvars\""
	docker run --rm -v ~/.ssh/id_rsa.pub:/root/.ssh/id_rsa.pub -v ${PWD}:/root/terraform -e AWS_ACCESS_KEY_ID=$(AWS_ACCESS_KEY_ID) -e AWS_SECRET_ACCESS_KEY=$(AWS_SECRET_ACCESS_KEY) osm/jim bash -c "cd terraform/PubVPC;terraform apply -var-file=\"data.tfvars\""

destroy-PubVPC:
	docker run --rm -v ~/.ssh/id_rsa.pub:/root/.ssh/id_rsa.pub -v ${PWD}:/root/terraform -e AWS_ACCESS_KEY_ID=$(AWS_ACCESS_KEY_ID) -e AWS_SECRET_ACCESS_KEY=$(AWS_SECRET_ACCESS_KEY) osm/jim bash -c "cd terraform/PubVPC;terraform destroy -force -var-file=\"data.tfvars\""

setup-HAPubVPC:
	docker run --rm -v ~/.ssh/id_rsa.pub:/root/.ssh/id_rsa.pub -v ${PWD}:/root/terraform -e AWS_ACCESS_KEY_ID=$(AWS_ACCESS_KEY_ID) -e AWS_SECRET_ACCESS_KEY=$(AWS_SECRET_ACCESS_KEY) osm/jim bash -c "cd terraform/HAPubVPC;terraform get; terraform plan -var-file=\"data.tfvars\""
	docker run --rm -v ~/.ssh/id_rsa.pub:/root/.ssh/id_rsa.pub -v ${PWD}:/root/terraform -e AWS_ACCESS_KEY_ID=$(AWS_ACCESS_KEY_ID) -e AWS_SECRET_ACCESS_KEY=$(AWS_SECRET_ACCESS_KEY) osm/jim bash -c "cd terraform/HAPubVPC;terraform apply -var-file=\"data.tfvars\""

destroy-HAPubVPC:
	docker run --rm -v ${PWD}:/root/terraform -e AWS_ACCESS_KEY_ID=$(AWS_ACCESS_KEY_ID) -e AWS_SECRET_ACCESS_KEY=$(AWS_SECRET_ACCESS_KEY) osm/jim bash -c "cd terraform/HAPubVPC;terraform destroy -f -var aws_region=$(REGION) -var route53_zone_name=$(ROUTE_53_ZONE_NAME) -var vpc_cidr=$(VPC_CIDR) -var public_subnet_aza_cidr=$(PUB_SN_A_CIDR) -var public_subnet_azb_cidr=$(PUB_SN_B_CIDR) -var vpc_name=$(VPC_NAME)"

create-server:
	docker run --rm -v ${PWD}:/root/terraform -e AWS_ACCESS_KEY_ID=$(AWS_ACCESS_KEY_ID) -e AWS_SECRET_ACCESS_KEY=$(AWS_SECRET_ACCESS_KEY) osm/jim bash -c "cd terraform/ServerProvisioner;rm -rf .terraform;terraform get;terraform plan -var-file=\"data.tfvars\""
	docker run --rm -v ${PWD}:/root/terraform -e AWS_ACCESS_KEY_ID=$(AWS_ACCESS_KEY_ID) -e AWS_SECRET_ACCESS_KEY=$(AWS_SECRET_ACCESS_KEY) osm/jim bash -c "cd terraform/ServerProvisioner;terraform apply -var-file=\"data.tfvars\""
