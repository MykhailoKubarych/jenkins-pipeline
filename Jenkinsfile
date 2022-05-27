pipeline {
    agent any

    stages {
        stage("build") {
            steps {
                echo 'building the application...'
            }
        }

        stage("test") {
            steps {
                sh "docker-compose -f docker-compose-base.yml build lens.build"
                sh "docker-compose -f docker-compose-base.yml run lens.build"
            }
        }

        stage("deploy") {
            steps {
                echo 'deploying the application...'
            }
        }

        stage('Git Checkout') {
            steps {
                    git branch: 'master', credentialsId: 'jenkins-pipeline' url: 'https://github.com/MykhailoKubarych/jenkins-pipeline.git'
                }
            }
        }
        
        stage('Nuget restore') {
            steps {
                dotnetRestore 'dotnet restore ${workspace}\\Sample\\Sample.sln'
                echo('Nuget pacjages restored.')
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