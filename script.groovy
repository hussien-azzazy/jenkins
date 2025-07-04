def buildApp() {
    echo "building the application..."
     sh './gradlew build'  // Use Gradle's wrapper to build the project
} 
def testApp() {
    echo "Testing the application..."

} 

def buildImage() {
    echo "building the docker image..."
    withCredentials([usernamePassword(credentialsId: 'docker-hub-repo', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
        sh 'docker build -t hussienazzazy/java-gradle-app:latest .' // Docker build command
        sh "echo $PASS | docker login -u $USER --password-stdin" // Docker login with credentials
        sh 'docker push hussienazzazy/java-gradle-app:latest' // Push Docker image to Docker Hub
    }
} 

def deployApp() {
    echo 'deploying the application...'
} 

return this