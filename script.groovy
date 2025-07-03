def buildJar() {
    echo "building the application..."
    sh 'mvn install'
} 

def buildImage() {
    echo "building the docker image..."
    withCredentials([usernamePassword(credentialsId: 'docker-hub-repo', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
        sh 'docker build -t hussienazzazy/java-maven-app:latest .'
        sh "echo $PASS | docker login -u $USER --password-stdin"
        sh 'docker push hussienazzazy/java-maven-app:latest'
    }
} 

def deployApp() {
    echo 'deploying the application...'
} 

return this