job('ServerProvisioner' ) {
description("I'll setup a Public VPC")
parameters {
        stringParam('REGION', 'us-east-1')
        stringParam('SUBNET_ID', 'subnet-e7e8f582')
	stringParam('SERVER_NAME')
	stringParam('KEY_NAME')
	stringParam('SG_ID', 'sg-b48414c5')
	choiceParam('INSTANCE_TYPE', ['t2.micro', 't2.medium'])
	stringParam('VPC_ZONE_ID', 'Z3O4QAA955WU8G')
	password {
     	name('AWS_ACCESS_KEY_ID')
      	defaultValue('AWS_ACCESS_KEY_ID')
    	}
	password {
        name('AWS_SECRET_ACCESS_KEY')
        defaultValue('AWS_SECRET_ACCESS_KEY')
        }
    }
	label('master')

scm {
   git {
      remote {
          
          url('https://github.com/ot-osm/osm-jim.git')
      }
      branch('*/master')
      
  }
} 

steps {
shell(

'#!/bin/bash\n'  +
'echo "I\'ll set up a VPC ${vpc_name} with CIDR ${vpc_cidr} having domain as ${zone_name} in ${aws_region} region"\n' +
'cd terraform/ServerProvisioner\n' +
'source executor.sh\n' +
'validateInputs'

)
}
}
