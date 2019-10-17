# Overview
Design approach for a multi-tenant SAAS application in AWS. This is based on terraform : 0.11.13 (need upgrade to 12)

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

AWS has guidelines on attaining Tenant isolation and they have formulated it in below categories.

* Model #1 – Tenant Isolation at the AWS Account Layer
* Model #2 – Tenant Isolation at the Amazon VPC Layer
* Model #3 – Tenant Isolation at Amazon VPC Subnet Layer
* Model #4 – Tenant Isolation at the Container Layer
* Model #5 – Tenant Isolation at the Application Layer

Link for reference document: https://d0.awsstatic.com/whitepapers/saas-solutions-on-aws-final.pdf

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

### AWS proposed design

![Design](./images/design.png?raw=true "Title")</br>


# Deliverables

### Network Diagram/ Design


### Configuration management

### Terraform Scripts
