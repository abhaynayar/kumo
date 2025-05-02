# AWS Cloud-Practitioner

### Learning-Resources:
- AWS Skill-Builder Essentials.

### ***EC2***:

- Intro:
    - ***Multi-tenancy***: Sharing underlying hardware between virtual machines.
        - When you spin up an EC2 instance, it’s not an entire physical machine, it’s a VM in a physical machine among others, managed by a hypervisor.
        - The hypervisor is responsible for coordinating this multitenancy. And it is managed by AWS.
    - EC2 instances are resize-able.
    - You only pay for running instances, not stopped or terminated instances.
- EC2 Instance Families:
    - General Purpose.
    - Compute Optimized. (Batch-Processing).
    - Storage Optimized. (High RW to local-storage).
    - Memory Optimized. (Large-Dataset in-Memory).
    - Accelerated Computing.
- EC2 Purchase Options:
    - On-Demand.  (Costliest, for unpredictable workloads). Linux/second, Windows/hour.
    - Savings Plan.  (Fixed dollar-amount/hour for 1/3 years). EC2/Fargate/Lambda.
    - Reserved Instances.  (1/3 year commitments with discounts).  Standard/Convertible/Scheduled.
    - Spot Instances.  (Cheapest, bidding, 2-minute notice).  Stateless workloads. Batch processing, big data analytics, containerized applications, CI/CD pipelines.
    - Dedicated Hosts.  (Physical-Server).  On-Demand/Reserved.  (1/3 years).  Compliance.
- EC2 Scaling:
    - Vertical: Re-Size, Horizontal: Adding new instances.
    - EC2 Auto Scaling: (Horizontal): Add/Remove instances in response to changing needs.
        - Dynamic: respond to changing demand.
        - Predictive: schedule based on predictions.
        - Both can be used together.
    - The **minimum capacity** is the number of Amazon EC2 instances that launch immediately after you have created the Auto Scaling group.
    - If you do not specify the **desired capacity** of Amazon EC2 instances in an Auto Scaling group, the desired capacity defaults to your minimum capacity.
    - Configure the Auto Scaling group to scale out in response to increased demand, but only to a **maximum capacity** of four Amazon EC2 instances.
- Elastic Load Balancing:
    - It is a **regional construct**. It runs on a region-level.
    - It is a **single URL** that the front-end, then the ELB directs the traffic to the back-end.
- Messaging & Queueing:
    - If applications communicate directly → tightly coupled architecture.
    - Loosely coupled → single failure won’t cascade into multiple failures.
        - We create a message queue.
        - Amazon SQS/SNS. (Queue/Notification).
    - SNS:
        - Pub-Sub model.
        - Create an SNS topic.
- AWS Lambda:
    - Serverless compute option. Managed environment.
    - Upload code to Lambda Function. Configure a trigger.
- Other:
    - Amazon ECS. (Elastic Container Service).
    - Amazon EKS. (Elastic Kubernetes Service).
    - **Container** (Docker) is a package for your code.
        - Package up your application/code, dependencies, configs.
        - These containers run on top of EC2 instances (host) in isolation.
        - Many containers together is a **cluster**.
        - The process is called container orchestration.
    - AWS Fargate: platform for ECS or EKS.



###  Global Infrastructure & Reliability:

- Regions:
    - Build close to business demands.
    - Inside each region - multiple data-centers.
    - Inter-region high-speed fibre-network connections.
    - Each region is isolated from every other region.
    - No data goes out of one region without explicit permission.
    - You can choose which region you want.
    - Factors used in choosing a region:
        1. Compliance.
        2. Proximity.
        3. Feature-availability.
        4. Pricing.
- Availability-Zones: (AZ):
    - AZ = Single/Group of Data-Centres within a region.
    - A region consists of 3 or more availability-zones.
    - 10s of miles = single-digit millisecond latency.
    - Best practice: run across at-least 2 AZs in a region.
    - ELB: regional-construct: runs across mutliple AZs.
    - Example: Region: us-west-1, AZs: us-west-1a, us-west-1b, us-west-1c.
- Edge-Locations:
    - **Amazon-CloudFront** = CDNs.
    - Edge-Locations have Cloudfront, Route53 (DNS).
    - AWS Outposts: (O&O by AWS). In your building.
- How to provision AWS resources?:
    - Through APIs.
    - Services that send requests to AWS APIs:
        - AWS Management Console. (Browser-Based).
        - AWS Command Line Interface. (CLI).
        - AWS Software Development Kits. (SDK).
    - Other-Tools.
        - **AWS-Elastic-Beanstalk**:
            - Give it application-code & desired-configurations.
        - **AWS-CloudFormation**:
            - Infrastructure as Code.
            - CloudFormation Template.
            - **AWS-CDK** = CloudFormation + Programming-Languages + Reusability.



## Networking:

- Amazon Virtual Private Cloud (VPC):
    - Logically-isolated section of AWS-cloud. In a virtual-network that you define.
    - Public/private (subnets) IP-range. Subnets: group resources together.
    - In order to allow public-traffic to flow into your VPC, you need to have an **Internet-Gateway (IGW)**.
    - For private-traffic, use instead a private-gateway. **Virtual Private Gateway**:  VPN-connection between a private-network, and your VPC.
    - For a dedicated private-connection with low-latency, **AWS Direct-Connect**: From your data-centre to AWS.
- Subnets & Network ACLs:
    - 