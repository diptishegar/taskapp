TaskApp 


Terraform file structure : 
infra/
  terraform/
    provider.tf
    variables.tf
    main.tf
    outputs.tf

Ansible file structure :
infra/ansible/
  inventory.ini
  group_vars/all.yml
  db.yml
  app.yml
  files/taskapp-start.sh


App EC2-A:

Java/Maven/Node/AWS CLI ready
Backend service running via systemd
Frontend built & synced to S3
Jenkins installed (in Docker) with backend + frontend pipelines auto-created

Learnings :
Debugged backend setup until it was actually running 🖤.
Learned how systemd, environment variables, and wrapper scripts interact.
Clean separation of app server (EC2-A) + DB server (EC2-B).
Found the sweet balance between working demo (hardcoded password) and resume-ready best practice (SSM extension).