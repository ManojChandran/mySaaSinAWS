# Overview
This repository is an Terraform HCL scripts to create a standard Mutli Tenant SAAS application in AWS. Design follows the guidelines presented by Tod Golding ins AWS reinvent 2018 (ARC418-R1), References are provided at the end of this document.

Currently we have completed
* S3 hosting
* Cloudfront distribution
* VPC
* Internet gateway
* Subnet Public and Private, with logic to check availability zone and create subnet as per requirement
* RDS Instance created ( Workin on the security group to complete its installation)

# Goals
Key goals for the design, is to provide
* Stand alone design for customers to deploy in their own independent environment.
* Ability for customer to share an environment
* Ability to independently upgrade application and infrastructure for a customer or a set of customers.

# SAAS
A method of software delivery and licensing in which software is accessed online via a subscription, rather than bought and installed on individual computers.

Designing SAAS infrastructure means, we are going to create a multi-tenant architecture. Each tenant will have different privilege, access and data isolation.

Key steps and consideration in designing are:

* Tenant onboarding
* Tenant Isolation
* Metering, Metrics and Analysis
* Management & monitoring
* Billing and tiering
* Deployment & agility

### Tenant onboarding
Tenant onboarding is key part in the Multi tenant SAAS application. Find the reference picture for AWS SAAS application Tenant on-boarding. API gateway with Cognito

![Onboarding Approach](./images/Auth.png?raw=true "Title")

### Tenant Isolation

AWS has guidelines on attaining Tenant isolation and they have formulated it in below categories.Link for reference document provided at end of this document.

* Model #1 – Tenant Isolation at the AWS Account Layer
* Model #2 – Tenant Isolation at the Amazon VPC Layer
* Model #3 – Tenant Isolation at Amazon VPC Subnet Layer
* Model #4 – Tenant Isolation at the Container Layer
* Model #5 – Tenant Isolation at the Application Layer

Our approach is to divide the tenants in to multiple tier and use a VPC layer Isolation.

### Tenant Tier

We assume current tenant fall in three categories as mentioned below.

* Tenant1 - Open Source (Single Region, Multi AZ, No data isolation)
* Tenant2 - Standrad Tier (Single region, Single AZ, Isolated database )
* Tenant3 - Professional Tier (Single region, Multi AZ, Isolated Multi AZ database)
* Tenant4 - Premium Tier (Multi region)

![Design](./images/TenantIsolation.png?raw=true "Title")</br>

### Metering, Metrics and Analysis

### Management & monitoring

### Billing

### Deployment & agility

# Proposed solution
All the components have been created individual Terraform Modules. Assuming Tenant category and applying mapping, we can control the resources creation and allocation.

```hcl
variable "tenantTier" {
  description = "tenantTier: Tenant1 or Tenant2 or Tenant3 or Tenant4"
}
```
note : This is a rough outline of solution, we are going to follow AWS proposed Mutli-tenant solutions.
I will be adding more resources and it will be a continuous improvements towards a good solution.

# Deliverables

### Network Diagram/ Design

![Design](./images/Network_diagram.png?raw=true "Title")</br>

### Configuration management

Link for cloning the solution (https://github.com/ManojChandran/mySaaSinAWS.git)

# Terraform reference

Link 1 : https://oouve.com/</br>
Link 2 : https://www.terraform.io/docs/providers/aws/index.html</br>
Link 3 : https://www.terraform.io/docs/providers/aws/r/s3_bucket.html</br>
Link 4 : https://gist.github.com/nagelflorian/67060ffaf0e8c6016fa1050b6a4e767a</br>
Link 5 : https://d0.awsstatic.com/whitepapers/saas-solutions-on-aws-final.pdf</br>
Link 6 : https://www.youtube.com/watch?v=mwQ5lipGTBI&t=781s (Title: AWS re:Invent 2018: [REPEAT 1] Deconstructing SaaS: Deep Dive into Building Multi-Tenant Solutions on AWS (ARC418-R1)</br>
