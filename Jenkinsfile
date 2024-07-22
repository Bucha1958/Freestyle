pipeline {
    agent any
    parameters {
        choice(name: 'VERSION', choices: ['1.1.0', '1.2.0', '1.3.0'], description: '')
        booleanParam(name: 'executeTests', defaultValue: true, description: '')
    }

    stages {
        stage("Load Groovy Script") {
            steps {
                script {
                    // Use the main workspace context to load the script
                    gv = load "script.groovy"
                }
            }
        }

        stage("build") {
            steps {
                script {
                    gv.buildApp()
                }
            }
        }

        stage("test") {
            when {
                expression {
                    params.executeTests
                }
            }
            steps {
                script {
                    gv.testApp()
                }
            }
        }

        stage("deploy") {
            input {
                message "Select the environment to deploy to"
                ok "done"
                parameters {
                    choice(name: 'ONE', choices: ['dev','staging', 'prod'], description: '')
                    choice(name: 'TWO', choices: ['dev','staging', 'prod'], description: '')
                }
            }
            steps {
                script {
                    gv.deployApp(params.VERSION)
                    echo "deploying to ${ONE}"
                    echo "deploying to ${TWO}"
                }
            }
        }
    }
}
