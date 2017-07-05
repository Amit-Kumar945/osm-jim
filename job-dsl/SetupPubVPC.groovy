job('SetupPubVPC' ) {
    description("I'll setup a Public VPC")
    parameters {
            stringParam('aws_region', 'us-east-1')
            stringParam('vpc_cidr', '17.0.0.0/16')
            stringParam('public_subnet_aza_cidr', '17.0.1.0/24')
            stringParam('vpc_name' , 'techprimo')
            stringParam('zone_name', 'techprimo.com')
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
            choiceParam('Environment', ['create', 'destroy'])
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


        'cd terraform/PubVPC\n' +
        'source executor.sh\n' +
        'validateInputs\n' +
        '#destroySetup ${AWS_ACCESS_KEY_ID} ${AWS_SECRET_ACCESS_KEY}\n'


        )
        }
        }
