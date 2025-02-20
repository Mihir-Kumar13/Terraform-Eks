# Terraform-Eks


##  Prerequisites  
Ensure you have:  
- Basic Networking
- Knowledge of AWS   
- - An **AWS account** with necessary permissions

---



---

##  Step 1: Launch an EC2 Instance  

First, launch an EC2 instance that will act as the **Terraform & Jenkins server**:  

1. Go to **AWS Console** → **EC2** → **Launch Instance**  
2. Choose **Ubuntu 22.04** or **Amazon Linux 2**  
3. Select an **instance type** (t2.medium or better)  
4. Configure security group:  
   - Allow **port 22** (SSH) for access  
   - Allow **port 8080** for Jenkins  
5. Attach an **IAM role** with EC2 and EKS permissions  
6. Create & attach an **SSH key pair**  
7. Launch the instance & connect via SSH:  
   ```sh
   ssh -i your-key.pem ubuntu@your-ec2-public-ip
   ```

---

## ⚙️ Step 2: Install Terraform & Jenkins  

Use the **installer.sh** script to install Terraform and Jenkins:  

1. Upload the script to the EC2 instance:  
   ```sh
   scp -i your-key.pem installer.sh ubuntu@your-ec2-public-ip:~/
   ```
2. SSH into the instance:  
   ```sh
   ssh -i your-key.pem ubuntu@your-ec2-public-ip
   ```
3. Run the installer script:  
   ```sh
   chmod +x installer.sh
   ./installer.sh
   ```

### ** What this script does:**  
✔ Installs Terraform  
✔ Installs & configures Jenkins  
✔ Starts Jenkins service  

Once installed, access Jenkins at:  
```
http://your-ec2-public-ip:8080
```
Copy the **Jenkins admin password** from:  
```sh
sudo cat /var/lib/jenkins/secrets/initialAdminPassword
```
Then, follow the Jenkins setup wizard.

---

## ☸️ Step 3: Deploy the EKS Cluster with Terraform  

1. Clone the project:  
   ```sh
   git clone https://github.com/your-repo/eks-terraform.git
   cd eks-terraform
   ```
2. Initialize Terraform:  
   ```sh
   terraform init
   ```
3. Review the execution plan:  
   ```sh
   terraform plan
   ```
4. Apply the configuration:  
   ```sh
   terraform apply -auto-approve
   ```

---

##  Step 4: Verify the EKS Cluster  

After Terraform applies the changes, verify your cluster:  

1. Install `kubectl` (if not installed):  
   ```sh
   sudo apt install -y kubectl
   ```
2. Update kubeconfig:  
   ```sh
   aws eks update-kubeconfig --region us-east-1 --name my-eks-cluster
   ```
3. Check if the cluster is running:  
   ```sh
   kubectl get nodes
   ```

---

##  Cleanup  

To destroy the EKS cluster when done:  
```sh
terraform destroy -auto-approve
```
To terminate the EC2 instance, go to **AWS Console** → **EC2** → **Terminate Instance**.

---

##  Resources Used  

- **Terraform AWS EKS Module**  
- **AWS VPC, Subnets, IAM Roles**  
- **EC2 for Jenkins & Terraform**  
- **Kubernetes for Cluster Management**  

---

##  Notes  

- Make sure to use **supported Kubernetes versions** (e.g., 1.27).  
- If Terraform shows errors, check the **AWS region, IAM roles, and CIDR blocks**.  
- Keep your **AWS credentials secure** when setting up Terraform.  

---

```

---

