pipeline {
    agent any

    environment {
        SONAR_SCANNER_OPTS = "-Dsonar.projectKey=FonSureTech -Dsonar.projectName=FonSureTech -Dsonar.projectVersion=1.0 -Dsonar.sources=. -Dsonar.language=js -Dsonar.sourceEncoding=UTF-8"
        EC2_IP = "56.228.36.204"
        EC2_KEY = "${WORKSPACE}/FinSureTech.pem"
        SNYK_TOKEN = credentials('SNYK_TOKEN_ID') // Replace with actual Jenkins credential ID
    }

    stages {

        stage('SonarQube Analysis') {
            steps {
                withSonarQubeEnv('SonarQubeServer') {
                    bat '''
                        sonar-scanner $SONAR_SCANNER_OPTS
                    '''
                }
            }
        }

        stage('Snyk SCA + Monitor') {
            steps {
                bat '''
                    export PATH=$PATH:/usr/local/bin:/opt/homebrew/bin
                    echo "Authenticating Snyk..."
                    snyk auth $SNYK_TOKEN

                    echo "Running Snyk test with fail on vulnerabilities..."
                    snyk test --severity-threshold=low

                    echo "Sending project snapshot to Snyk for continuous monitoring..."
                    snyk monitor --project-name=finsuretech
                '''
            }
        }

        stage('Build Docker Image') {
            steps {
                bat '''
                    echo "Building Docker image..."
                    docker build -t finsuretech-app .
                '''
            }
        }

        stage('Trivy Scan') {
            steps {
                bat '''
                    echo "Scanning Docker image with Trivy..."
                    trivy image --exit-code 0 --severity CRITICAL,HIGH finsuretech-app
                '''
            }
        }

        stage('Deploy to EC2') {
            steps {
                bat '''
                    echo "Deploying to EC2..."

                    ssh -o StrictHostKeyChecking=no -i "$EC2_KEY" ec2-user@$EC2_IP << 'EOF'
                      set -e
                      mkdir -p ~/finsuretech-app
                      cd ~/finsuretech-app

                      if [ ! -d ".git" ]; then
                        git clone https://github.com/rajatkamboj06/finsuretech-app.git .
                      else
                        git pull origin master
                      fi

                      docker stop finsuretech-staging || true
                      docker rm finsuretech-staging || true

                      docker build -t finsuretech-app .
                      docker run -d -p 3001:3001 --name finsuretech-staging finsuretech-app
                    EOF
                '''
            }
        }

        stage('Run ZAP Scan') {
            steps {
                bat '''
                    echo "Running ZAP scan on EC2..."

                    ssh -o StrictHostKeyChecking=no -i "$EC2_KEY" ec2-user@$EC2_IP "
                      cd ~/finsuretech-app &&
                      docker run --rm -v \$(pwd):/zap/wrk/:rw -t ghcr.io/zaproxy/zaproxy:stable \\
                      zap-baseline.py -t http://$EC2_IP:3001 -g gen.conf -r zap-report.html || true
                    "
                '''
            }
        }

        stage('Copy ZAP Report') {
            steps {
                bat '''
                    echo "Copying ZAP report from EC2 to Jenkins..."

                    scp -o StrictHostKeyChecking=no -i "$EC2_KEY" ec2-user@$EC2_IP:/home/ec2-user/finsuretech-app/zap-report.html .

                    if [ -f "zap-report.html" ]; then
                      echo "ZAP report copied successfully."
                    else
                      echo "ZAP report NOT found. Copy failed!"
                      exit 1
                    fi
                '''
            }
        }

        stage('Publish ZAP HTML Report') {
            steps {
                publishHTML(target: [
                    allowMissing: false,
                    alwaysLinkToLastBuild: true,
                    keepAll: true,
                    reportDir: '.',
                    reportFiles: 'zap-report.html',
                    reportName: 'ZAP Scan Report'
                ])
            }
        }
    }
}
