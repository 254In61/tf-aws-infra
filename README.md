# Overview
- A small project to build infra on AWS for my lab.

# Objective
- Build a VPC
- Build subnets on the VPC
- Build security groups.
- Build 4 ec2 instances

# How to Build Infra

1. Have your own main.tf and vars-dev.tfvars defined.

2. Set the env variables
   export AWS_ACCESS_KEY_ID=your_access_key_id
   export AWS_SECRET_ACCESS_KEY=your_secret_access_key
   export AWS_DEFAULT_REGION=your_region

   $ source ~/secrets/aws-infra-env-vars

3. $ terraform init

4. $ terraform plan -var-file vars-dev.tfvars 

5. $ terraform apply -var-file vars-dev.tfvars


# How to Destroy
$ terraform destroy -var-file vars-dev.tfvars
