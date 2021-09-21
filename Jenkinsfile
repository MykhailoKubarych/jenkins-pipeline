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
                echo 'testing the applications...'
            }
        }

        stage("deploy") {
            steps {
                echo 'deploying the application...'
            }
        }

        stage ('Clean workspace') {
            steps {
                cleanWs()
                echo('cleaned...')
            }  
        }

        stage ('Git Checkout') {
            steps {
                    git branch: 'master', credentialsId: 'jenkins-pipeline' url: 'https://github.com/MykhailoKubarych/jenkins-pipeline'
                }
            }
        }
        
        stage ('Nuget restore') {
            steps {
                dotnetRestore 'dotnet restore ${workspace}\\Sample\\Sample.sln'
                ecko('Nuget pacjages restored.')
            }
        }

        sstage ('Build api') {
            steps {
                dotnetBuild 'dotnet restore ${workspace}\\jenkins-pipeline\\Sample\\Sample.Web\\Sample.Web.csproj'
                echo('Api built')
            }
        }
    }
}