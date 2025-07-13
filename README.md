# FinSureTech: DevSecOps Pipeline for a Secure Financial Web Application

### 🏫 Internship Project | UPES | Xebia
Mentor: **Utkarsh Agarwal** (Xebia) 
Team Members: Rajat Kamboj, Raghav Kamboj, Aayush Mishra, Pulkit Kumar, Ansh Saxena, Kushagra Singh

---

## 📌 Problem Statement

FinSureTech, a fintech startup, must comply with strict security and regulatory requirements. Its existing CI/CD pipeline lacks integrated security checks, leading to late vulnerability detection and delayed releases. This project builds a **DevSecOps pipeline** that embeds security into every stage of the software development lifecycle.

---

## 🎯 Objective

To create a **fully automated, secure CI/CD pipeline** for a Node.js financial application deployed on AWS EC2. The pipeline integrates:

- SAST, SCA, DAST & Image Scanning  
- Auto Deployment  
- Real-Time Monitoring & AI-based Anomaly Detection  

---

## 🧰 Tech Stack

| Tool         | Purpose                                |
|--------------|----------------------------------------|
| GitHub       | Version Control                        |
| Jenkins      | CI/CD Automation                       |
| SonarQube    | Static Code Analysis (SAST)            |
| Snyk         | Dependency Scanning (SCA)              |
| Docker       | Containerization                       |
| Trivy        | Docker Image Vulnerability Scanning    |
| AWS EC2      | App Hosting (Staging & Production)     |
| OWASP ZAP    | Dynamic App Security Testing (DAST)    |
| Terraform    | Infrastructure Provisioning            |
| Prometheus   | Real-Time Metrics Collection           |
| Grafana      | Monitoring & AI-Based Alerts           |

---
## WrokFlow
- <img width="1168" height="758" alt="WorkFlow" src="https://github.com/user-attachments/assets/fb8cb456-755d-44c6-b962-694631621249" />

## 🔄 Pipeline Flow

1. **Code Push to GitHub** triggers the Jenkins pipeline via webhook.
2. **Jenkins Pipeline:**
   - Run **SonarQube** for SAST.
   - Run **Snyk** for SCA.
   - **Build Docker image** and scan with **Trivy**.
   - Deploy to **Staging EC2** using Docker.
   - Run **OWASP ZAP** for DAST testing.
   - Deploy to **Production EC2** after passing all tests.
3. **Monitoring** via Prometheus and Grafana.
4. **Smart Alerts & AI-based Anomaly Detection** trigger alerts or Jenkins jobs.
- <img width="2878" height="1548" alt="Jenkins" src="https://github.com/user-attachments/assets/1e9f5086-c080-4854-9d28-fbcdc32c95c6" />
   


---

## 💻 FinSureTech Frontend

A lightweight financial dashboard simulation using **HTML, CSS, and JavaScript**.
- <img width="481" height="226" alt="Frontend" src="https://github.com/user-attachments/assets/4862054f-772e-4d1d-b1e1-f36880d74e45" />


---

## 🔐 Security Integrations

- **SonarQube (SAST):** Identifies code bugs and vulnerabilities statically.
- <img width="507" height="255" alt="SonarQube" src="https://github.com/user-attachments/assets/5b9862d5-d169-41dd-9626-d3b9649b92f3" />

- **Snyk (SCA):** Scans `package.json` for vulnerable NPM dependencies.
- <img width="510" height="275" alt="Snyk" src="https://github.com/user-attachments/assets/63e9d27f-e2ba-49ee-bc9a-3b3303324311" />

- **Trivy:** Scans Docker images for known CVEs and misconfigurations.
- <img width="500" height="341" alt="Trivy 1" src="https://github.com/user-attachments/assets/9d08c37e-54cb-462e-ac26-803890f91174" />
- <img width="490" height="338" alt="trivy 2" src="https://github.com/user-attachments/assets/91f9c572-70b1-4b31-8ad8-30b9e18cc8e1" />
- <img width="487" height="55" alt="trviy 3" src="https://github.com/user-attachments/assets/003b8892-c897-4744-ae34-c3b1e2cb18ef" />

- **OWASP ZAP (DAST):** Scans live app for runtime security issues.
- <img width="517" height="290" alt="ZAP scan" src="https://github.com/user-attachments/assets/4149ec80-f058-4465-a31e-db9ad0a059b6" />
- <img width="452" height="126" alt="ZAP Jenkins" src="https://github.com/user-attachments/assets/166555c8-23ca-42aa-8543-62ae81162c14" />

---
## Deployment on EC2: Staging / Production EC2 via Docker:
- Amazon EC2 (Elastic Compute Cloud) provides virtual servers (instances) to host applications.
- In FinSureTech, two EC2 environments are used:
  Staging EC2 – for testing and validation.
  Production EC2 – for live, user-facing deployment.
- Hosted at: http://56.228.36.204:3001
- <img width="511" height="266" alt="AWS-EC2" src="https://github.com/user-attachments/assets/ec4076fb-5fa1-4c66-ab33-5dc0fef9c0bf" />
- <img width="1576" height="519" alt="Deploy-EC2" src="https://github.com/user-attachments/assets/fb94ad4c-4437-45fe-96c4-b914b16c3455" />
---

## 📊 Monitoring & Alerts

- **Prometheus:** Collects metrics from Node.js app.
-  <img width="498" height="524" alt="promethous-metrics" src="https://github.com/user-attachments/assets/9d4990e3-9486-4536-9572-50335504b382" />

- **Grafana:** Visualizes performance metrics (CPU, memory, requests).
-  <img width="506" height="273" alt="grafana-dashboard" src="https://github.com/user-attachments/assets/24bf62da-32c9-4d4e-9d00-76b2222ab0d2" />

- **Alertmanager:** Sends alerts via future Slack/email integration.
- <img width="511" height="187" alt="Altermanager" src="https://github.com/user-attachments/assets/d38f9ce5-f2a8-4f5d-8ad4-db46824f7236" />

- **AI-based Anomaly Detection:** Learns normal trends and flags anomalies early.

---

## 🔍 URLs (Sample/Staging)

- 🌐 **Frontend App**: [http://56.228.36.204:3001](http://56.228.36.204:3001)
- 📈 **Prometheus**: `http://localhost:9090`
- 📊 **Grafana**: `http://localhost:3000`
- ⚙️ **Jenkins**: `http://localhost:8080`
- 🛡 **ZAP Reports**: `http://localhost:8080/job/finsuretech/ZAP_20Scan_20Report/`
- 📈 **Metrics Endpoint**: `http://56.228.36.204:3001/metrics`

---

## 📦 Terraform (Infra as Code)

Infrastructure is provisioned using **Terraform** scripts for consistent and secure environment setup on AWS.

---

## 🚀 Future Enhancements

- ✅ **Slack/Email Alerts via Alertmanager**
- ✅ **Trigger Jenkins Jobs on Anomaly Detection**
- ✅ **Database Monitoring (MySQL/PostgreSQL Exporters)**
- ✅ **Auto-Scaling with AWS EC2 or EKS**
- ✅ **ML-Based Trend Prediction in Grafana**

---

## 🧠 Innovation Highlight

> **AI-Based Anomaly Detection using Grafana ML Plugin**

Identifies unusual behaviors like:
- CPU/Memory spikes before thresholds are hit
- Sudden traffic surges
- Zero-day anomaly patterns

This reduces false positives and enables **proactive failure prevention**.

---

## 📂 Project Structure
