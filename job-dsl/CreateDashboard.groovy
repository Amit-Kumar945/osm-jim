job('ansible-command') {
        parameters {
     	extendedChoiceParameterDefinition {
          name('Deployment_Group' )
          type('Single Select' )
          propertyFile('/var/lib/jenkins/inventory.Properties')
          propertyKey('key')
          defaultValue('targets')
          defaultPropertyFile('')
          value('')
          defaultPropertyKey('') 
          quoteValue(false)
          visibleItemCount(5) 
       	  description('')
          multiSelectDelimiter('')
          bindFieldName('')
          svnPath(false)
          svnUrl('')
          svnUserName('')
          svnPassword('')
          projectName('')
          roleBasedFilter(false)
        }
          stringParam('Command')
}
  
   label('{{LABEL}}')

steps {
    shell(

    'name=$Command\n'  +
    
'ansible ${Deployment_Group} -a  "$name"\n' 

)
}
}
