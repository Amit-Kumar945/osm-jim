job('SetupHAPubVPC' ) {
description("I'll setup a Public VPC")   
parameters {
        stringParam('aws_region', 'us-west-2')
        stringParam('vpc_cidr', '17.0.0.0/16')
        stringParam('vpc_name', 'pub-vpc')
        stringParam('zone_name')
        stringParam('subnet_a_cidr', '17.0.0.0/16')
        stringParam('subnet_b_cidr', '17.0.0.0/16')
        password {
        name('AWS_ACCESS_KEY_ID')
        defaultValue('AWS_ACCESS_KEY_ID')
        description('Aws credentilas')
        }
        password {
        name('AWS_SECRET_ACCESS_KEY')
        defaultValue('AWS_SECRET_ACCESS_KEY')
        description('Aws credentilas')
        }
    }

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

    'echo "I will set up a VPC ${vpc_name} with CIDR ${vpc_cidr} having domain as ${zone_name} in ${aws_region} region"\n' +


    'cd terraform/HAPubVPC\n' +
    'source executor.sh\n' +
    'validateInputs\n' +
    '#createSetup ${AWS_ACCESS_KEY_ID} ${AWS_SECRET_ACCESS_KEY}\n'  +
     'destroySetup ${AWS_ACCESS_KEY_ID} ${AWS_SECRET_ACCESS_KEY}\n'
 

    )
    }
    }
