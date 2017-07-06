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
	docker run --rm -v ~/.ssh/id_rsa.pub:/root/.ssh/id_rsa.pub -v ${PWD}:/root/terraform -e AWS_ACCESS_KEY_ID=$(AWS_ACCESS_KEY_ID) -e AWS_SECRET_ACCESS_KEY=$(AWS_SECRET_ACCESS_KEY) osm/jim bash -c "cd terraform/HAPubVPC;source executor.sh;provisionInfraViaTerraform"
	#docker run --rm -v ~/.ssh/id_rsa.pub:/root/.ssh/id_rsa.pub -v ${PWD}:/root/terraform -e AWS_ACCESS_KEY_ID=$(AWS_ACCESS_KEY_ID) -e AWS_SECRET_ACCESS_KEY=$(AWS_SECRET_ACCESS_KEY) osm/jim bash -c "cd terraform/HAPubVPC;terraform apply -var-file=\"data.tfvars\""

destroy-HAPubVPC:
	docker run --rm -v ~/.ssh/id_rsa.pub:/root/.ssh/id_rsa.pub -v ${PWD}:/root/terraform -e AWS_ACCESS_KEY_ID=$(AWS_ACCESS_KEY_ID) -e AWS_SECRET_ACCESS_KEY=$(AWS_SECRET_ACCESS_KEY) osm/jim bash -c "cd terraform/HAPubVPC;source executor.sh;deProvisionInfraViaTerraform"

create-server:
	docker run --rm -v ~/.ssh/id_rsa:/root/.ssh/id_rsa -v ${PWD}:/root/terraform -e AWS_ACCESS_KEY_ID=$(AWS_ACCESS_KEY_ID) -e AWS_SECRET_ACCESS_KEY=$(AWS_SECRET_ACCESS_KEY) osm/jim bash -c "cd terraform/ServerProvisioner;./serverSetup.sh"
