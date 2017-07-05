job('LaunchAWSManager' ) {
description("I'll launch AWS terraform container from where we can spin up aws infra")
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

'cd terraform\n'  +

'make build\n'

)
}
}
