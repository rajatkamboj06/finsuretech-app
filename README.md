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
   


---

## 💻 FinSureTech Frontend

A lightweight financial dashboard simulation using **HTML, CSS, and JavaScript**.

---

## 🔐 Security Integrations

- **SonarQube (SAST):** Identifies code bugs and vulnerabilities statically.
  
- **Snyk (SCA):** Scans `package.json` for vulnerable NPM dependencies.

- **Trivy:** Scans Docker images for known CVEs and misconfigurations.
  
- **OWASP ZAP (DAST):** Scans live app for runtime security issues.

---

## 📊 Monitoring & Alerts

- **Prometheus:** Collects metrics from Node.js app.
- **Grafana:** Visualizes performance metrics (CPU, memory, requests).
- **Alertmanager:** Sends alerts via future Slack/email integration.
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
