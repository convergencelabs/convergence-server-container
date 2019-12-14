nodePod { label ->
  def containerName = "convergence-server"

  runInNode(label) {
    container('node') {
      stage('Prepare Build') {
        sh './scripts/prepare.sh'
      }
    }
    
    container('docker') {
      stage('Build') {
        dir("build") {
          dockerBuild(containerName)
        }
      }

      stage('Push') {
        dockerPush(containerName, ["latest", env.GIT_COMMIT])
      }
    }
  }
}
