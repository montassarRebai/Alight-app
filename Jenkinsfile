pipeline {
    agent any
    
  tools {nodejs "NodeJS"} 

    stages {
        
      
        
      
        
        stage('Install NodeJs Local Envirement ') {
             steps{
                script{
                    sh " npm install"
                }
            }
        } 
        
        
        stage('Build NodeJs app') {
             steps{
               script {
              def remote = [:]
              remote.name = 'master'
              remote.host = '192.168.1.160'
              remote.user = 'root'
              remote.password = 'monta'
              remote.allowAnyHosts = true
    
              sshCommand remote:remote, command: 'ansible-playbook /home/master/Desktop/alight/ansible/build.yaml -i /home/master/Desktop/alight/ansible/inventory/hosts '
             
           
          
        }
            }
        } 
        
              stage('Build Docker Image') {
                  
               
             steps{
              script {
              def remote = [:]
              remote.name = 'master'
              remote.host = '192.168.1.160'
              remote.user = 'root'
              remote.password = 'monta'
              remote.allowAnyHosts = true
    
           
             
              sshCommand remote:remote, command: ' ansible-playbook /home/master/Desktop/alight/ansible/docker.yaml -i /home/master/Desktop/alight/ansible/inventory/hosts '
          
        }
            }
        } 
        
        
        
                stage('Deploy artifact to nexus private repo') {
            steps {
             script {
              def remote = [:]
              remote.name = 'master'
              remote.host = '192.168.1.160'
              remote.user = 'root'
              remote.password = 'monta'
              remote.allowAnyHosts = true
              sshCommand remote:remote, command: 'cd /home/master/Desktop/alight/ ; sh dep-nexus.sh'
          
        }
    }
     }
        
        
        
        
        
                
                stage('Sonar quality analysis') {
            steps {
             script {
              def remote = [:]
              remote.name = 'master'
              remote.host = '192.168.1.160'
              remote.user = 'root'
              remote.password = 'monta'
              remote.allowAnyHosts = true
              sshCommand remote:remote, command: ' source /etc/profile.d/sonar-scanner.sh'
              sshCommand remote:remote, command: 'cd /home/master/Desktop/alight/ ; sh sonar.sh'
          
        }
    }
     }
        
        
        
        
        
        
        
          stage('Push Docker Image To dockerhub') {
                  
               
             steps{
              script {
              def remote = [:]
              remote.name = 'master'
              remote.host = '192.168.1.160'
              remote.user = 'root'
              remote.password = 'monta'
              remote.allowAnyHosts = true
    
           
             
              sshCommand remote:remote, command: ' ansible-playbook /home/master/Desktop/alight/ansible/docker-hub.yaml -i /home/master/Desktop/alight/ansible/inventory/hosts '
          
        }
            }
        }
        
        
        
    
        
        
        
         stage('Prepare KubeConfig ') {
             steps{
                    
                withKubeConfig([credentialsId: 'jenkins', serverUrl: 'https://192.168.1.160:6443']) 
                {
                
                sh 'pwd'     
               
                }
                 }
       }
      
     
     
     
        stage('Deploy Alight app in k8s Cluster ') {
            steps {
             script {
              def remote = [:]
              remote.name = 'master'
              remote.host = '192.168.1.160'
              remote.user = 'root'
              remote.password = 'monta'
              remote.allowAnyHosts = true
              sshCommand remote:remote, command: ' ansible-playbook /home/master/Desktop/alight/ansible/kubernetes-deploy.yaml -i /home/master/Desktop/alight/ansible/inventory/hosts '
              sshCommand remote:remote, command: ' kubectl get pods -n alight -o wide '
        }
    }
}



        stage(' Alight app svc ') {
            steps {
             script {
              def remote = [:]
              remote.name = 'master'
              remote.host = '192.168.1.160'
              remote.user = 'root'
              remote.password = 'monta'
              remote.allowAnyHosts = true
             
              sshCommand remote:remote, command: ' kubectl get pods -n alight -o wide  '
        }
    }
}



   
  }
     
        
    }
