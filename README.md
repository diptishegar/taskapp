# 🚀 TaskApp CI/CD Pipeline (Spring Boot + Angular + AWS)

A **DevOps end-to-end project** showcasing the deployment of a full-stack web application  
(Spring Boot backend + Angular frontend + MySQL database) using **AWS, Terraform, Ansible, and GitHub Actions**.

This project demonstrates modern DevOps practices including **Infrastructure-as-Code, CI/CD automation using GithubActions, and cloud-native deployment**.

---

## 📌 Overview
- **Frontend (Angular)** → Deployed to AWS **S3 (static website hosting)**  
- **Backend (Spring Boot)** → Deployed on **EC2** instance with **systemd service**  
- **Database (MySQL)** → Hosted on a dedicated **EC2 instance**  
- **CI/CD** → Implemented with **GitHub Actions** to automate build, test, and deploy  
- **IaC & Configuration** → Infrastructure provisioned with **Terraform**, configured using **Ansible**

---

**⚙️ Tech Stack**
Cloud: AWS (EC2, S3, IAM, Security Groups)
CI/CD: GitHub Actions
IaC: Terraform
Configuration Management: Ansible
Backend: Spring Boot (Java)
Frontend: Angular
Database: MySQL

**✨ Features**
Infrastructure provisioned via Terraform
Automated EC2 configuration using Ansible
Backend deployed as a managed service (systemd)
Frontend hosted on AWS S3 static website
GitHub Actions pipelines with:
Backend (Maven build → JAR → Deploy to EC2)
Frontend (npm build → Deploy to S3)

**🔧 Setup Instructions**
**1. Infrastructure**
Provision AWS resources using Terraform:
terraform init
terraform apply

**2. Configuration**
Configure EC2 instances with Ansible:
ansible-playbook -i inventory.ini app.yml
ansible-playbook -i inventory.ini db.yml

**3. CI/CD Pipelines**
Frontend workflow (frontend.yml): builds Angular and uploads to S3
Backend workflow (backend.yml): packages Spring Boot JAR, deploys to EC2, restarts service

**▶️ Usage**
Access frontend via AWS S3 website endpoint
Register a new user
Login with credentials
Create and view tasks

**🚀 Future Improvements**
Monitoring → Add Prometheus & Grafana for system and application metrics
Containerization → Use Docker to package backend and database for portability
Orchestration → Extend to Kubernetes for production-grade scaling
Security → Add HTTPS with AWS Certificate Manager and stricter Security Group rules
