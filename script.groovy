def buildApp() {
    echo 'building the application...'
}

def testApp() {
    echo 'testing the application...'
}

def deployApp(version) {
    echo 'Deploying the application...'
    echo "deploying version ${version}"
}

return this
