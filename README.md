# 🏗️ AWS 3-Tier Architecture with Terraform (HCP)
This project implements a complete 3-Tier Architecture on AWS, using Terraform, managed and deployed through the HashiCorp Cloud Platform (HCP). This setup separates infrastructure into:

Web Tier (Public)

Application Tier (Private)

Database Tier (Private)

🔧 Tools & Services Used
Terraform (Infrastructure as Code)

HashiCorp Cloud Platform (HCP) (Terraform Cloud)

Amazon VPC

Auto Scaling Groups

Elastic Load Balancers (ELB)

EC2 Instances

S3 Buckets

IAM Roles

Route Tables, Internet Gateway, NAT Gateway

Security Groups

Key Pairs

🧠 Architecture Overview

This architecture follows best practices for AWS networking and isolation:

1. Web Tier
Two EC2 instances in public subnets across two AZs

Connected to an Application Load Balancer

Accessible from the internet via an Internet Gateway

2. Application Tier
EC2 instances in private subnets

Hosted behind a private Application Load Balancer

Instances scale automatically with an Auto Scaling Group

Only accessible from the Web Tier

3. Database Tier
Private subnets only

No internet access (secured)

Intended for RDS (MySQL/PostgreSQL) or other managed database services

Access restricted to the Application Tier

📁 Repository Structure
File / Folder	Description
vpc.tf	VPC creation, CIDR blocks, subnets
subnet.tf	Public and private subnets in multiple AZs
rtb.tf	Route tables and route associations
igw.tf	Internet Gateway for public access
nat.tf	NAT Gateway for outbound access from private subnets
sg.tf	Security groups for all 3 tiers
keyPair.tf	Key pair creation for EC2
appasg.tf	Auto Scaling Group for Application tier
webasg.tf	Auto Scaling Group for Web tier
applb.tf	Application Load Balancer resources
db.tf	Database subnet group (useful for RDS)
iam.tf	IAM roles for EC2 and services
s3.tf	S3 bucket resources
provider.tf	Terraform AWS provider configuration
output.tf	Outputs such as Load Balancer DNS
apache.sh	User-data script for EC2 (Apache setup)
🚀 Getting Started
1. Set up your HCP Terraform workspace
Link this repo to your HCP Terraform Workspace.

Set AWS credentials in the workspace variables:

AWS_ACCESS_KEY_ID

AWS_SECRET_ACCESS_KEY

2. Initialize Terraform
bash
Copy
Edit
terraform init
3. Plan your infrastructure
bash
Copy
Edit
terraform plan
4. Apply to create resources
bash
Copy
Edit
terraform apply
Note: If you're using HCP, most of this is done via the UI or CLI integration.

🔒 .gitignore Notes
To avoid pushing large or sensitive files, ensure the following are in .gitignore:

gitignore
Copy
Edit
.terraform/
*.tfstate
*.tfstate.backup
.terraform.lock.hcl
*.log
*.pem
🧪 Testing & Validation
Ensure all tiers are deployed successfully.

Validate public access to the Web Tier Load Balancer.

Verify internal-only access between App and DB tiers.

📸 Demo / Screenshot
![image](https://github.com/user-attachments/assets/6d76f9b0-0361-4a2a-9b0c-158c63cd0f7f)


