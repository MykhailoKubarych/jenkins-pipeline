pipeline {
    agent any

    stages {
        stage("build") {
            steps {
                echo 'building the application...'
            }
        }

        stage("docker version") {
            steps {
                sh "docker version"

                sh "docker build -t deleted -f Dockerfile ."
                sh "docker run --rm deleted
            }
        }

        // stage("test") {
        //     steps {
        //         sh "docker-compose -f docker-compose-base.yml build lens.build"
        //         sh "docker-compose -f docker-compose-base.yml run lens.build"
        //     }
        // }

        stage("deploy") {
            steps {
                echo 'deploying the application...'
            }
        }

        stage ('Build api') {
            steps {
                dotnetBuild 'dotnet restore ${workspace}\\jenkins-pipeline\\Sample\\Sample.Web\\Sample.Web.csproj'
                echo('Api built')
            }
        }


        stage('Clean workspace') {
            steps {
                echo('start cleaning')
                cleanWs()
                echo('cleaned...')
            }  
        }
    }
}

def runShell(commandString) {
    try {
        sh commandString
    } catch (Exception ex) {
        echo "Error: ${ex}";
    }
}