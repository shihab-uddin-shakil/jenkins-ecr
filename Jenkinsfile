pipeline {
  agent any
  stages {
    stage ('Build') {
      steps {
        sh 'printenv'
        echo 'hello'
        
      }
    }
    stage ('Publish ECR') {
      steps {
        withEnv (["AWS_ACCESS_KEY_ID=${env.AWS_ACCESS_KEY_ID}", "AWS_SECRET_ACCESS_KEY=${env.AWS_SECRET_ACCESS_KEY}", "AWS_DEFAULT_REGION=${env.AWS_DEFAULT_REGION}"]) {
          sh 'docker login -u AWS -p $(aws ecr-public get-login-password --region us-east-1) public.ecr.aws/f7a3k3e4'
          sh 'docker build -t deepchain .'
          sh 'docker tag deepchain:latest public.ecr.aws/f7a3k3e4/deepchain:""$BUILD_ID""'
          sh 'docker push public.ecr.aws/f7a3k3e4/deepchain:""$BUILD_ID""'
        }
      }
    }
  }
}
