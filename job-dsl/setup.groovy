listView("Infra Manager") {
    jobs {
        names('LaunchAWSManager', 'ServerProvisioner', 'SetupHAPubVPC', 'SetupPubVPC')
    }
         columns {
                status()
                weather()
                name()
                lastSuccess()
                lastFailure()
            }
}
