Resume description for the project :

Deployed Spring Boot + Angular on AWS (S3 static hosting, EC2 backend via systemd, MariaDB on EC2) with IAM-secured access and least-privilege SGs.

Implemented secrets management using AWS SSM Parameter Store and Session Manager (SSH-less ops).

Built CI with GitHub Actions to auto-build FE/BE, deploy to EC2 (systemd) and sync to S3; added CloudWatch alarms + SNS for proactive alerts.

Automated nightly DB backups to S3 with lifecycle retention; documented infra-as-code plan using Terraform + Ansible.

-----------------------------------------------------------------------------
cat /etc/systemd/system/taskapp.service

[Unit]
Description=TaskApp Spring Boot Service
Wants=network-online.target
After=network-online.target

[Service]
User=ec2-user
WorkingDirectory=/opt/taskapp/backend

# QUOTE values that contain spaces or special chars
Environment="JAVA_OPTS=-Xms128m -Xmx512m"
Environment=SPRING_DATASOURCE_URL=jdbc:mysql://172.31.22.128:3306/taskdb
Environment=SPRING_DATASOURCE_USERNAME=taskuser
Environment="SPRING_DATASOURCE_PASSWORD=123benhart#$"

ExecStart=/usr/bin/java $JAVA_OPTS -jar /opt/taskapp/backend/app.jar

Restart=always
RestartSec=5
LimitNOFILE=65536
TimeoutStopSec=20

[Install]
WantedBy=multi-user.target

-----------------------------------------------------------------------------

[ec2-user@ip-172-31-16-189 resources]$ cat application.properties 
spring.application.name=TasksApp
server.port=3030


## MYSQL AWS DB CONNECTION
spring.datasource.url=jdbc:mysql://tasks.clg68caiw8y9.us-east-2.rds.amazonaws.com:3306/taskdb
spring.datasource.username=admin
spring.datasource.password=den123ABC12
spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver
spring.jpa.hibernate.ddl-auto=update

## MYSQL LOCAL CONNECTION
#spring.datasource.url=jdbc:mysql://localhost:3306/tasks
#spring.datasource.username=root
#spring.datasource.password=12345678
#spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver
#spring.jpa.hibernate.ddl-auto=update

### POSTGRESQL LOCAL CONNECTION
#spring.datasource.url=jdbc:postgresql://localhost:5432/tasks
#spring.datasource.username=your_username
#spring.datasource.password=your_password
#spring.datasource.driver-class-name=org.postgresql.Driver
#spring.jpa.properties.hibernate.dialect=org.hibernate.dialect.PostgreSQLDialect
#spring.jpa.hibernate.ddl-auto=update


java -jar app.jar \
  --spring.datasource.url=jdbc:mysql://172.31.22.128:3306/taskdb \
  --spring.datasource.username=taskuser \
  --spring.datasource.password='123benhart#$' \
  --spring.jpa.hibernate.ddl-auto=update

-----------------------------------------------------------------------------


mysql -h 172.31.20.220 -u taskuser -p -e "SHOW DATABASES;"


  nc -vz 172.31.22.128 3306

 EC2-A : 52.23.192.195
 EC2-B : 3.91.190.210 (database), private : 172.31.22.128


 Bucket endpoint : http://taskapp-frontend-dips.s3-website-us-east-1.amazonaws.com

 Frontend file edit with backend IP addr : vi frontend-angular/src/app/service/api.service.ts


 Ping from ansible to Ec2 instance : 
 ansible -i inventory.ini all -m ping --key-file taskapp-key.pem


java -jar app.jar \
  --spring.datasource.url=jdbc:mysql://172.31.20.220:3306/taskdb \
  --spring.datasource.username=taskuser \
  --spring.datasource.password=YourStrongPassword \