pipeline {
    agent any
    environment {
      PATH = "C:/flutter/bin;c:\\Windows\\System32;C:/Ruby32-x64/bin;C:/Strawberry/perl/site/bin;C:/Strawberry/perl/bin;C:/ProgramData/chocolatey;C:/ProgramData/chocolatey/lib/lcov/tools;C:/Program Files/Java/jdk-17.0.3.1"
      BUILD_NUMBER = "3"
      LC_ALL = 'en_US.UTF-8'
      GOOGLE_APPLICATION_CREDENTIALS="C:/shahul/CICD-example/seasonal-android-firebase.json"
    }
    stages {
        stage('GIT PULL') {
              steps {
                git branch: 'dev', url: 'https://github.com/shahul-hamed/CICD-example.git'
              }

        }
        stage('Setup') {
            steps {
                print "${env.PATH}"
                print "${env.LC_ALL}"
            }
        }

        stage('Install and plugin dependencies') {
            steps {
                bat "flutter doctor"
                bat "flutter analyze"

            }
        }
        stage('Flutter test with coverage') {
            steps {
                bat 'flutter test --coverage'
                print "flutter widget test completed"

            }
        }
        stage('Flutter build apk') {
            steps {
                bat "flutter clean"
                bat "flutter pub get"
                dir('C:\\shahul\\CICD-example') {
                  bat 'flutter build apk --release "C:/shahul/CICD-example/lib/main.dart"'
                 }

                print "flutter apk build ready"
            }
        }
        stage('App distribution using gradle') {
            steps {
                 dir('C:\\shahul\\CICD-example\\android') {
                   bat "./gradlew assembleRelease appDistributionUploadRelease"
                 }

            }


        }
    }
}