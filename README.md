# Terraform_ASG-ALB
Using Terraform to automate creation of VPC, Auto Scaling Group and Application Load Balancer with ACM SSL certificate for a high available website

## Description 

[Terraform](https://www.terraform.io/intro/) is an infrastructure as a code (IAAC) tool created by [HashiCorp](https://www.hashicorp.com/) which can be used for managing infrastructure with various technologies like Amazon AWS, Microsoft Azure, Google Cloud, and vSphere etc. 

In this project I have used Terraform for creating a [VPC](https://aws.amazon.com/vpc/) with private and public Subnets and Network Gateway's for the VPC. We will be making 1 VPC with 6 Subnets: 3 Private and 3 Public, 1 NAT Gateways, 1 Internet Gateway, and 2 Route Tables. I have also created a [Application Load Balancer](https://docs.aws.amazon.com/elasticloadbalancing/latest/application/introduction.html) with SSL certificate from [Amazon Certificate Manager](https://aws.amazon.com/certificate-manager/) and an [Auto Scaling Group](https://aws.amazon.com/autoscaling) using a sample [Launch Configuration](https://docs.aws.amazon.com/autoscaling/ec2/userguide/LaunchConfiguration.html) to host a highly available sample website on AWS infrastructure. All of the resources will be inside the custom VPC we have created. All these resource creation can be automated with desired values and you can use this whenever you need to create a similar setup.

## Architecture Image

![](https://i.ibb.co/cXkCH1H/VPC-ALB-ASG.jpg)

### Features

- Easy to customise with terraform.tfvars file. All variables can be modified quickly.
- VPC is added with 3 public subnets and 3 private subnets in different availability zones and can use to expand the infrastructure easily. 
- Project name is appended to the resources that are creating which will make easier to identify the resources.

### Prerequisites 
- Create an IAM user on your AWS console that have access to create the required resources.
- Import/Add SSL certificate on Amazon Certificate Manager to use for ALB.

### How to use?

##### To install Terraform

```sh
wget https://releases.hashicorp.com/terraform/0.15.3/terraform_0.15.3_linux_amd64.zip
unzip terraform*.zip
mv -f terraform /usr/bin/
```

##### To execute this terraform code

```sh
yum install git unzip -y
git clone https://github.com/MarkAntonyGit/Terraform_ASG-ALB.git
cd Terraform_ASG-ALB
vim terraform.tfvars - Make Necessary Changes.
terraform init
terraform validate
terraform plan
terraform apply
```

> sample screenshots

-tfvars file

![](https://i.ibb.co/4pjp73h/git4.jpg)

-Resources Created 

![](https://i.ibb.co/80yY55S/git1.jpg)

-Sample Website Screenshots 

![](https://i.ibb.co/HHz8GBR/git3.jpg)
![](https://i.ibb.co/sChP1L6/git2.jpg)

