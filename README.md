# 🌍 **AWS Terraform Workshop for Beginners**🚀  

A beginner-friendly guide to setting up AWS infrastructure using **Terraform**! Learn how to **automate** and **manage** cloud resources with ease.  

---

## 📌 **What You'll Learn**  

✅ **Deploy AWS Resources** using Terraform  
✅ **Manage Infrastructure as Code (IaC)**  
✅ **Use Remote State Storage** with S3 + DynamoDB  
✅ **Create VPC, Subnets, and EC2 Instances**
✅ **Configure Security Groups and Networking**
✅ **Apply Best Practices** for Terraform Code Structure

---

## 🏗️ **Project Structure (What's Inside?)**  

```tree
AWS-Terraform-Workshop/
│── scripts/          # Shell scripts for user data and setup
│   └── user_data.sh  # Bootstrap script for EC2 instances
│── main.tf           # Main Terraform configuration (VPC, EC2, networking)
│── variables.tf      # Input values for easy customization
│── outputs.tf        # Output values of deployed resources
│── backend.tf        # Remote state setup (S3 + DynamoDB)
│── backend-variables.tf # Variables for backend configuration
│── provider.tf       # AWS provider configuration
│── terraform.tfvars.example # Example variable values
│── README.md         # This guide! 📖
```

---

## 🚀 **Getting Started (Step-by-Step)**  

### **1️⃣ Install Required Tools**  

🔹 [Download Terraform](https://developer.hashicorp.com/terraform/downloads) (v1.0.0 or newer)
🔹 Install **AWS CLI** and set up credentials using:  

```sh
aws configure
```

🔹 Create an **S3 bucket & DynamoDB table** for storing Terraform state:

```sh
# Create S3 bucket
aws s3 mb s3://your-terraform-state-bucket --region us-east-1

# Create DynamoDB table (with 'LockID' as partition key)
aws dynamodb create-table \
    --table-name your-terraform-lock-table \
    --attribute-definitions AttributeName=LockID,AttributeType=S \
    --key-schema AttributeName=LockID,KeyType=HASH \
    --billing-mode PAY_PER_REQUEST \
    --region us-east-1
```

---

### **2️⃣ Clone the Project & Configure Variables**  

```sh
git clone https://github.com/NotHarshhaa/AWS-Terraform-Workshop.git
cd AWS-Terraform-Workshop

# Create a tfvars file with your specific values
cp terraform.tfvars.example terraform.tfvars
# Edit the terraform.tfvars file with your preferred editor
```

---

### **3️⃣ Initialize Terraform with Backend Configuration**  

```sh
# Basic initialization
terraform init

# Or with custom backend configuration
terraform init \
  -backend-config="bucket=your-terraform-state-bucket" \
  -backend-config="dynamodb_table=your-terraform-lock-table" \
  -backend-config="region=us-east-1"
```

👉 This sets up Terraform by downloading necessary plugins and configuring remote state.

---

### **4️⃣ Plan & Apply Changes**  

```sh
# Preview changes
terraform plan -out=tfplan

# Apply the saved plan
terraform apply tfplan

# Or directly apply (will prompt for confirmation)
terraform apply
```

⚡ This will create a complete infrastructure including:
- VPC with proper CIDR blocks
- Public subnet with internet connectivity
- Security groups with configurable ports
- EC2 instance with Apache web server

---

### **5️⃣ Test the Deployment & View Outputs**

```sh
# View all the output values
terraform output

# Get a specific output value (e.g., web server URL)
terraform output web_url

# SSH to your instance
terraform output ssh_connection_string
# Then modify the command with the actual path to your key file
```

### **6️⃣ Destroy Infrastructure (When Finished)**  

```sh
# Preview what will be destroyed
terraform plan -destroy

# Destroy all resources
terraform destroy
```

⛔ This will **delete** all deployed AWS resources.

---

## 📝 **Best Practices for Beginners**  

🔹 **Always use Remote State** – Store Terraform state in S3 to prevent conflicts.  
🔹 **Use Variables and Outputs** – Parameterize your code for flexibility.
🔹 **Separate User Data Scripts** – Keep bootstrap scripts in separate files.
🔹 **Apply Proper Tagging** – Tag resources consistently for better management.
🔹 **Use Dynamic Blocks** – For repeatable resource configurations.
🔹 **Check Plan Before Applying** – Always run `terraform plan` first!  
🔹 **Security First** – Restrict security group rules to minimum required access.

---

## 🤝 **Contributing**  

🔹 Found something to improve? Open a **pull request**!  
🔹 Have questions? Feel free to **open an issue**!  
🔹 Want to extend? Add more resources like RDS, S3, or Lambda!

---

## 📜 **License**  

📝 This project is licensed under **MIT License** – Free to use and modify!  

## 📚 **Additional Resources**

🔹 [Terraform Documentation](https://developer.hashicorp.com/terraform/docs)
🔹 [AWS Provider Documentation](https://registry.terraform.io/providers/hashicorp/aws/latest/docs)
🔹 [Terraform Best Practices](https://www.terraform-best-practices.com/)

🚀 **Happy Terraforming!** 🌍

---


