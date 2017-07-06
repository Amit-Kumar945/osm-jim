build:
	docker build -t osm/jim .

run:
	docker rm -f awsmanager || true
	docker run --name awsmanager --privileged -d --rm -v ${PWD}:/root/terraform -e AWS_ACCESS_KEY_ID=$(AWS_ACCESS_KEY_ID) -e AWS_SECRET_ACCESS_KEY=$(AWS_SECRET_ACCESS_KEY) osm/jim  /bin/bash

setup-PubVPC:
	docker run --rm -v ~/.ssh/id_rsa.pub:/root/.ssh/id_rsa.pub -v ${PWD}:/root/terraform -e AWS_ACCESS_KEY_ID=$(AWS_ACCESS_KEY_ID) -e AWS_SECRET_ACCESS_KEY=$(AWS_SECRET_ACCESS_KEY) osm/jim bash -c "cd terraform/PubVPC;source executor.sh;provisionInfraViaTerraform"

destroy-PubVPC:
	docker run --rm -v ~/.ssh/id_rsa.pub:/root/.ssh/id_rsa.pub -v ${PWD}:/root/terraform -e AWS_ACCESS_KEY_ID=$(AWS_ACCESS_KEY_ID) -e AWS_SECRET_ACCESS_KEY=$(AWS_SECRET_ACCESS_KEY) osm/jim bash -c "cd terraform/PubVPC;source executor.sh;deProvisionInfraViaTerraform"

setup-HAPubVPC:
	docker run --rm -v ~/.ssh/id_rsa.pub:/root/.ssh/id_rsa.pub -v ${PWD}:/root/terraform -e AWS_ACCESS_KEY_ID=$(AWS_ACCESS_KEY_ID) -e AWS_SECRET_ACCESS_KEY=$(AWS_SECRET_ACCESS_KEY) osm/jim bash -c "cd terraform/HAPubVPC;source executor.sh;provisionInfraViaTerraform"

destroy-HAPubVPC:
	docker run --rm -v ~/.ssh/id_rsa.pub:/root/.ssh/id_rsa.pub -v ${PWD}:/root/terraform -e AWS_ACCESS_KEY_ID=$(AWS_ACCESS_KEY_ID) -e AWS_SECRET_ACCESS_KEY=$(AWS_SECRET_ACCESS_KEY) osm/jim bash -c "cd terraform/HAPubVPC;source executor.sh;deProvisionInfraViaTerraform"

create-server:
	docker run --rm -v ~/.ssh/id_rsa:/root/.ssh/id_rsa -v ${PWD}:/root/terraform -e AWS_ACCESS_KEY_ID=$(AWS_ACCESS_KEY_ID) -e AWS_SECRET_ACCESS_KEY=$(AWS_SECRET_ACCESS_KEY) osm/jim bash -c "cd terraform/ServerProvisioner;./serverSetup.sh"
