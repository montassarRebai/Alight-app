export PATH="$PATH:/opt/sonar-scanner/bin"
source /etc/profile.d/sonar-scanner.sh
sleep 1
sonar-scanner \
  -Dsonar.projectKey=Alight-app \
  -Dsonar.sources=. \
  -Dsonar.host.url=http://10.109.123.241:9000 \
  -Dsonar.login=eb77eb9716e792a4ebef4390ab26ba0cc7847999
