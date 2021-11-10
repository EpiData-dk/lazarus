@Library('epidata.pipeline') _

env.FPC_VERSION='3.2.0'
env.LAZARUS_VERSION='2.0.10'

standardPipeline() {
    node {
        stage("Source Checkout") {
            checkout scm
            sh "chmod +x scripts/*.sh"
            sh "scripts/setup_lazarus.sh"
        }

        stage("Linux-64") {
            epidocker.run "mvn compile -Plinux64"
        }

        stage("Win-64") {
            epidocker.run "mvn compile -Pwin64"
        }

        stage("Mac-64") {
            epidocker.run "mvn compile -Pdarwin64"
        }

        stage("Package & Deploy") {
            sh "mvn versions:set -DnewVersion=${LAZARUS_VERSION}.${BUILD_ID} -f deploy.pom.xml"
            sh "mvn deploy -f deploy.pom.xml"
            sh "scripts/remove_lazarus.sh"
        }
    }
}