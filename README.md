# Overview
Design approach for a multi-tenant SAAS application in AWS.  

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
Authentication and Authorization

### Tenant Tier

* tenant1 - Standrad Tier
* tenant2 - Professional Tier
* tenant3 - Premium Tier

### Tenant Isolation

* Model #1 – Tenant Isolation at the AWS Account Layer
* Model #2 – Tenant Isolation at the Amazon VPC Layer
* Model #3 – Tenant Isolation at Amazon VPC Subnet Layer
* Model #4 – Tenant Isolation at the Container Layer
* Model #5 – Tenant Isolation at the Application Layer

### Metering, Metrics and Analysis

### Management & monitoring

### Billing

### Deployment & agility

# Deliverables

### Network Diagram/ Design

### Configuration management

### Terraform Scripts
