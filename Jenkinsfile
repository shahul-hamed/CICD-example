pipeline {
    agent { label 'built-in' }
    stages {

        stage ('TEST BUILD AND DEPLOYMENT') {
            steps
            {
                script
                {
                  //get comments programmatically
                    env.GIT_COMMIT_MSG = sh (script: 'git log -1 --pretty=%B ${GIT_COMMIT}', returnStdout: true).trim()
                    //by default testing will be done
                    dir('weather_rx_stream_sink') {
                        testCodeQuality()
                    }
                    if (env.GIT_COMMIT_MSG == 'BUILD IOS') {
                    dir('weather_rx_stream_sink') { buildiOS() }
                    } else if (env.GIT_COMMIT_MSG == 'BUILD ANDROID'){
                    dir('weather_rx_stream_sink') { buildAndroid() }
                    } else if (env.GIT_COMMIT_MSG == 'DEPLOY IOS') {
                    dir('weather_rx_stream_sink') { buildiOS() }
                    dir('weather_rx_stream_sink/ios') { distributeiOS() }
                    } else if (env.GIT_COMMIT_MSG == 'DEPLOY ANDROID') {
                    dir('weather_rx_stream_sink') { buildAndroid() }
                    dir('weather_rx_stream_sink/android') { distriButeAndroid() }
                    } else if (env.GIT_COMMIT_MSG == 'DEPLOY BOTH') {
                    dir('weather_rx_stream_sink') { buildiOS() }
                    dir('weather_rx_stream_sink/ios') { distributeiOS() }
                    dir('weather_rx_stream_sink') { buildAndroid() }
                    dir('weather_rx_stream_sink/android') { distriButeAndroid() }
                    }
                }
            }
        }
    }
}

//if commit message does not includes BUILD IOS'/'BUILD ANDROID'/'DEPLOY IOS'/'DEPLOY ANDROID'/'DEPLOY BOTH'
void testCodeQuality() {

    echo "TESTING STARTED"
    sh "flutter test --coverage"
    sh "genhtml coverage/lcov.info -o coverage/"
    publishHTML (target : [allowMissing: false,
    alwaysLinkToLastBuild: true,
    keepAll: true,
    reportDir: 'coverage',
    reportFiles: 'index.html',
    reportName: 'My Reports',
    reportTitles: 'The Report'])
    echo "TESTING END"
    }

void buildiOS() {
    echo "BUILDING IOS  STARTED"
    sh "flutter build ios"
    echo "BUILDING IOS  END"
}

void distributeiOS() {
    echo "FASTLANE  STARTED"
    sh 'fastlane beta'
    echo "FASTLANE  END"
}

void buildAndroid() {
    echo "BUILDING APK  STARTED"
    sh "flutter build apk"
    echo "BUILDING APK  END"
}

void distriButeAndroid() {
    echo "FASTLANE  STARTED"
    //use gradle if fastlane not supported (headless linux)
    //sh './gradlew clean build'
    //sh './gradlew assembleRelease appDistributionUploadRelease'

  //for mac (tested on mac not sure on window)
    sh 'fastlane beta'
    echo "FASTLANE  END"
}