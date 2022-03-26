# Terraform AWS 3-tier infrastructure

### Requirements:

* AWS account
* AWS Access & Secret Key

Run the below steps to create infrastructure.

* git clone https://github.com/pradeepre/kpmg-tech.git
* terraform init
* terraform plan
* terraform apply. Please provide the Access Key and Secret Key in order to create the infrastructure.


## Outcome

* Below resources should be created successfully at the end of "terraform apply"

  * Network
    * VPC
    * Route
    * Subnet
    * Routing Table
    * Internet Gateway
  * Application Load Balancer
  * Instances
    * EC2 instances
    * RDS instance
  * Security
    * Security Groups

The endpoint should get captured, which upon on loading to browser should point to the web application.