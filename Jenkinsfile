nodePod { label ->
  def containerName = "convergence-server"

  runInNode(label) {
    container('docker') {
      stage('Prepare Build') {
        sh './scripts/prepare.sh'
      }

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
