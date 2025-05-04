# AWS Cloud-Practitioner
## Learning-Resource(s):
- AWS Skill-Builder Essentials.

## ***EC2***:
- Intro:
    - ***Multi-tenancy***: Sharing underlying hardware between virtual machines.
        - When you spin up an EC2 instance, it’s not an entire physical machine, it’s a VM in a physical machine among others, managed by a hypervisor.
        - The hypervisor is responsible for coordinating this multitenancy. And it is managed by AWS.
    - EC2 instances are resize-able.
    - You only pay for running instances, not stopped or terminated instances.
- EC2 Instance-Families:
    - General Purpose.
    - Compute Optimized. (Batch-Processing).
    - Storage Optimized. (High RW to local-storage).
    - Memory Optimized. (Large-Dataset in-Memory).
    - Accelerated Computing.
- EC2 Purchase-Options:
    - On-Demand. (Costliest, for unpredictable workloads). Linux/second, Windows/hour.
    - Savings-Plan. (Fixed dollar-amount/hour for 1/3-years). EC2/Fargate/Lambda.
    - Reserved-Instances. (1/3-year commitments with discounts). Standard/Convertible/Scheduled.
    - Dedicated-Hosts. (Physical-Server).  On-Demand/Reserved. (1/3-years).  Compliance.
    - Spot-Instances. (Cheapest, bidding, 2-minute notice). Stateless workloads. Batch processing, big data analytics, containerized applications, CI/CD pipelines.
- EC2-Scaling:
    - Vertical: Re-Size, Horizontal: Adding new instances.
    - EC2 Auto Scaling: (Horizontal): Add/Remove instances in response to changing needs.
        - Dynamic: respond to changing demand.
        - Predictive: schedule based on predictions.
        - Both can be used together.
    - The **minimum capacity** is the number of Amazon EC2 instances that launch immediately after you have created the Auto Scaling group.
    - If you do not specify the **desired capacity** of Amazon EC2 instances in an Auto Scaling group, the desired capacity defaults to your minimum capacity.
    - Configure the Auto Scaling group to scale out in response to increased demand, but only to a **maximum capacity** of four Amazon EC2 instances.
- Elastic Load-Balancing:
    - It is a **regional construct**. It runs on a region-level.
    - It is a **single URL** that the front-end, then the ELB directs the traffic to the back-end.
- Messaging & Queueing:
    - If applications communicate directly → tightly coupled architecture.
    - Loosely coupled → single failure won’t cascade into multiple failures.
        - We create a message queue.
        - Amazon SQS/SNS. (Queue/Notification).
    - SQS:
        - Amazon SQS is a message queuing service. Using Amazon SQS, an application developer can send, store, and receive messages between software components at any volume size, without losing messages or requiring other services to be available.
        - In Amazon SQS, an application sends messages into a queue. A user or service retrieves a message from the queue, processes it, and then deletes it from the queue.
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

##  Global Infrastructure & Reliability:

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
- How to provision AWS-resources?:
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
    - ig it's a region-level construct, not AZ-level?
    - Logically-isolated section of AWS-cloud. In a virtual-network that you define.
    - Public/private (subnets) IP-range. Subnets: group resources together.
    - In order to allow public-traffic to flow into your VPC, you need to have an **Internet-Gateway (IGW)**.
    - For private-traffic, use instead a private-gateway. **Virtual Private Gateway**:  VPN-connection between a private-network, and your VPC.
    - For a dedicated private-connection with low-latency, **AWS Direct-Connect**: From your data-centre to AWS.
- Subnets & Network ACLs:
    - The only reason to use subnets within the VPC is to access control to the gateways. Public subnets have access to the internet-gateway, private subnets, do not.
    - Every packet that attempts to cross over the subnet boundary gets checked over by the **network access control list (acl)** - does the packet have permissions to *leave and/or enter the subnet* based on  who it was sent from and how it was trying to communicate. By default, network ACLs allow all inboug/outbound traffic.
    - But that is for whole subnets. Instead, to solve **instance-level access** we have **security-groups**. Every EC2 instance when it's launched, automatically comes with its EC2 instance. By default- all ports, IPs are blocked.
    - **Security-group is stateful v. network-acl is stateless**.
    - **Security-groups by default allow ALL return-traffic**.
- Global-Networking:
    - Amazon-Route-53 (DNS web-service) Routing-Policies:
        - Latency
        - Geolocation
        - Geoproximity
        - Weighted round-robin
    - You can also buy domain-names from Route-53. Connect user requests to infrastructure in AWS and outside of AWS.
    - You can use Cloud-Front to cache serve static assets near your customers in edge-locations.

## Storage & Databases:
- Instance-Stores & Amazon-EBS:
    - Block-Level-Storage:  stores files..  as blocks on disk..  so not all overwritten..  updates just the pieces that changed..
    - **Instance store volumes**..  local-storage directly attached to the host that your EC2 instances is attached on top of..  but if you stop EC2..  all data to the instance store volume will be deleted..  because if you start instance again it might start on another host where the volume does not exist..  since **EC2 instances are virtual-machines**..  don't write important data to these drives..   only epehermal stuff..
    - Instead use **Elastic-Block-Storage**:  virtual-volumes, can attach to your EC2 instances..  not tied to host..  set size, type, config then attach to your EC2 instance.. take regular **snap-shots** (incremental-backups)..  **solid-state by default,  but hdd options**..  **up to 16TiB**..
    - Block-storage (EBS) is preferred over object-storage (S3) when say you wanna make edits to a big video file..  cause in block-storage only parts of the file need to be changed, in object-storage we need to re-upload the whole new edited video-file..
- Amazon S3:
    - **Data is stored as objects**.
    - **Objects are stored in buckets**.
    - **Maximum object size is 5 TB!!**
    - Can also version objects to prevent from accidental-deletion.
    - S3 Lifecycle management/policies:  Move data automatically between tiers..
    - Classes/Tiers: (**durability = probability of remaining intact after 1 year**):
        - S3 Standard -> 11 9s durability -> 99.99999999% of durability..  multiple copies reside across 3 locations..
        - S3 static-website hosting..  
        - S3 Standard-Infrequent Access..  less frequently but rapid when needed..  to store backups/disaster-recovery.. In the Amazon S3 Intelligent-Tiering storage class, Amazon S3 monitors object access patterns. If an object has not been accessed for 30 consecutive days, Amazon S3 automatically moves it to the infrequent access tier, Amazon S3 Standard-IA. If an object is accessed in the infrequent access tier, Amazon S3 automatically moves it to the frequent access tier, Amazon S3 Standard.
        - S3 Glacier-Flexible Retrieval.. compliance.. glacier vault-policy..  controls like: write once read many (WORM),  ..
        - ***TODO***:   AND MORE..
        - S3-Glacier Deep-Archive:  Objects stored in the Amazon S3 Glacier Flexible Retrieval storage class can be retrieved within a few minutes to a few hours. By comparison, objects that are stored in the Amazon S3 Glacier Deep Archive storage class can be retrieved within 12 hours.
        - Amazon S3 Intelligent-Tiering monitors access patterns of objects and automatically moves them between the Amazon S3 Standard and Amazon S3 Standard-IA storage classes. It is not designed for archival data.
- Amazon-EFS: (Elastic File-System):
    - Businesses usually have shared filesystems across their applications..
    - Multiple instances can access the data in EFS at the same time..
    - EBS:
        - Attached to EC2..  - **Availability-Zone-level resource**..
        - Need to be in same AZ to attach to EC2 instance..
        - EBS Volumes do not automatically scale..
    - EFS:
        - It is not a blank hard-drive but a linux ..
        - Regional-resource..
        - Automatically-scales..
- Amazon-RDS: (Relational Database-Service):
    - Automated-patching, backups, redundancy, failover, disaster-recovery..
    - Amazon-Aurora:
        - MySQL..
        - PostgreSQL..
        - 1/10th the cost of commercial-databases..
        - Data replication across facilities..
        - Up to 15 replicas..
        - Continuous backup to S3..
        - Point-in-time recovery..
- **Amazon Dynamo-DB**:
    - **Serverless-Database**..
    - Tables -> Items, Attributes..
    - Manages underlying storage/scaling..
    - Stores redundantly..  across AZs..  mirrors data across multiple-drives
    - **1 ms response-time**..
    - Does not use SQL..  No-SQL..  great for data-sets where there is some variation from item to item..  like your client-side JSON-blob collections..
- RDS v. Dynamo-DB:
    - RDS:  ownership of data, schema, network..
    - DDB:  key-value,  massive-throughput,  PB-size,  granular-API-access..
- **Amazon-Redshift**:
    - Instead of right-now..  **what DID happen?**
    - Volume of data over time..  is huge..
    - So we need **data-warehouses**..  where you are looking at historical-analytics as opposed to operational-analysis..
    - Redshift = data-warehousing as a service..
    - Redshift nodes in multiple-petabytes is common..
    - Redshift-Spectrum..  run SQL query across exa-bytes of unstructured-data..
- AWS-DMS: (Database-Migration-Sevice):
    - Source remains operational during migration..
    - Source & Target don't need to be of same type..
- Additional-DB-Services:
    - Amazon-DocumentDB:  like-MongoDB..
    - Amazon-Neptune:  Graph-DB for social-network, rec-sys, fraud-detection..
    - Amazon-Managed-Blockchain..
    - Amazon-QLDB:  Quantum-Ledger:  Immutable, no entry can ever be removed..
    - Database-accelerators..  
        - Amazon-ElastiCache..  **memcache-d**  &  **redis**..
        - Amazon DynamoDB Accelerator..  Amazon DAX..

## Security:

- Shared-Responsibility Model:
    -  AWS: of the cloud..  ie..  physical, network, hypervisor..
    -  Customer: in the cloud..  ie..  operating-system, application, data..
- User-Permissions & Access:
    - AWS root account user.. owner of AWS account..  access & control anything..
    - As soon as you create an account pls turn on MFA..
    - Still, you don't wanna use root-user for everything..
    - **AWS-IAM**:  for granular access instead..
        - Create IAM users- by default no permissions..
        - Add access by principle of least-privilege..
        - Attach policy to an IAM user.. - IAM policy (json doc) -> what API calls (action) can a user can/can't (effect) make.. on a (resource)..
        - Organize them into IAM groups.. attach a policy to a group (all users get access)
    - **IAM-Roles**:
        - Associated permissions
        - allow or deny
        - assumed for temp amounts of time
        - no username or password
        - access to temporary permissions
        - can apply them to: resources, users, external IDs, applications, other services..
        - when applied, everything previous to that role is abandoned..
        - you can federate users into the account (corp account)
- AWS-Organizations: (Central location to manage multiple AWS-accounts):
    - Centralized-management..
    - Consolidated-billing..
    - Hierarchical groupings of accounts..
    - AWS service & API actions access-control..
        - Service-Control-Policies (SCPs) - applied to individual-member-account, or an org-unit (OU)
- Compliance:
    - Examples: EU -> GDPR, US-healtcare -> HIPAA
    - Region -> compliance.. -> do not replicate-data..
    - AWS-Compliance.. & - AWS-Artifact: compliance-reports done by third-parties.. Review, accept, and manage agreements with AWS..
- DDoS:
    - UDP-Flood..  reflection.. fake return-address..  ie..  victim-server..
    - HTTP-level..  slow-lorris..  pretends to have a terribly-slow connection..
    - udp-flood- Solution- security-groups.. 
    - slow-lorris-  solution- elastic-load-balancer..
    - **AWS-Shield** with **AWS-WAF**: ML, new-threats, ..
- additional-services:
    - aws-kms: create crypto keys.. - encryption at rest/transit..
    - amazon-inspector: automated security-assessments against your infrastructure..
        - network config reachability piece..
        - amazon-agent..
        - security assessment service..
    - **amazon-guard-duty**:
        - AWS-GuardDuty identifies threats by continually monitoring the network activity and account behavior within an AWS environment.
        - takes in as input: cloud-trail, vpc flow logs, dns logs..
        - known ip-address, anomaly-detection, machine-learning..
    - advanced-shield, security-hub..

## Monitoring & Analytics:
-  **Amazon-CloudWatch**:  (near-real-time):
    - Amazon CloudWatch is a service that provides data for monitoring applications, optimizing resource utilization, and responding to system-wide performance changes.
    - CloudWatch-Alarm:
        - Threshold for metric when breached -> alarmed..
        - Integrated with SNS (can send SMSes)
    - **Dash-Board**: Auto-Refresh..
    - Reduce MTTR & TCO..
-  **AWS-CloudTrail**:
    - AWS-API-auditing-tool..
    - every request gets logged in the cloud-trail-engine
    - who, when, where, what was the response..
    - root can change- how do you convince auditor it wasn't changed?- cloud-trail..  vault-lock..
-  **AWS-Trusted-Advisor**:
    - automatically evaluates your resources against 5 pillars..
    - cost, perf, security, fault-tolerance, service-limits..

## Pricing & Support:
-  AWS Free-Tier:
    - types: - always-free.. 12 months-free.. trials..
    - services free-tier examples..:
        - lambda- 1 mil free invocations per month..
        - s3- free for 12 months for up to 5gb of storage..
        - sage-maker, dynamo-db, sns, cognito..
- AWS-Pricing-Calculator:  https://calculator.aws/#/
- Billing-Dashboard: search in aws-console.. can consolidate..
- **AWS-Budgets**: cost or usage when breached..  get notified.. 
- **AWS-Cost-Explorer**: since pay for what you use..  
- AWS-Marketplace.. catalog..  3rd-party-software.. one-click-deployment.. pay as you go..
- AWS-Support-Plans..
    - Basic-Support.. free..  24x7 customer service, docs, whitepapers, aws trusted-advisor, aws personal-health dashboard..
    - dev-support: basic + email customer support (24h resp time, 12 hour if impaired)
    - biz-support: basic+dev, full-set trusted-advisor checks, phone-access to cloud-support engineers.. (4h hour if impaired, 1 hr if down)
    - enterprise on-ramp: prev. + 30 min resp. time + access to a pool of TAMs.
    - enterprise: prev. + 15-minute resp time for biz crit work-loads.. designated TAM
    - tam: well-architected-framweowkr: op ex, sec, reliability, perf, cost, sustainability..

## Migration & Innovation:
- AWS-CAF: (Cloud-Adoption-Framework):
    - 6-areas based on role-type: biz, ppl (hr), governance, platform, sec, ops..
    - AWS-CAF Action-Plan..
- 6-r's of migration:
    - Rehosting: lift & shift..
    - Replatforming: lift, tinker, & shift.. no code-changes/dev-efforts..
    - Refactoring/re-architecting:  new-code,  biz-need..  was not possible on-prem..
    - Repurchasing:  abondon legacy-software-vendor..
    - Retaining: wait a bit before killin 'em..
    - Retiring:  no-longer-needed cause aws-awesome..
- AWS-Snow-Family:
    - 1Gbps = 1-PB of data in 100-days..
    - AWS-Snocone = 8-TB data, edge-computing..  EC2, AWS IoT green-grass..
    - Ship, plug, copy, then we will copy to S3 you own..  TBs of data..
    - Snowball-Edge: compute-optimized, storage-optimized..
    - Snomobile: 45-foot shipping-container pulled by truck..  100-PB..
- Innovation-at-AWS:
    - VM-Ware-Cloud on AWS..
    - Amazon-Sage-Maker..
    - Amazon-Lex..  (Alexa)..
    - Amazon-Textract..
    - AWS Deep-Racer..
    - IoT:  ??
    - AWS-Ground-Station..  (Satellite)..
    - Amazon-Augmented-AI.. (A2I)..  Amazon Augmented AI (Amazon A2I) provides built-in human review workflows for common machine learning use cases, such as content moderation and text extraction from documents. With Amazon A2I, a person can also create their own workflows for machine learning models built on Amazon SageMaker or any other tools.


## AWS-Well-Architected-Frame-Work:
- ex: Replicate VPCs across AZs.
- tool: green, orange, red..
- Pillars: opex, sec, reliability, perf, cost, sustainability..
    - sec:  integrity, encryption, ..
    - cost:  where money is spent ex. overestimation ec2-size..
    - opex: monitoring, automating changes to pipelines, responding to triggered-events..
    - perf:  efficiency ex. amazon ec2-type
    - reliability:  recovery-planning from aws-service failures..
    - sustainability:  env-impact..


## 6-main-AWS-cloud-benefits:
1. on-premesis data-center-costs.. 
2. benefit from massive-economies-of-scale..
3. stop-guessing-capacity..
4. increased speed & agility..
5. stop spending-money running & maintaining data-centers..
6. go-global in-minutes..  (cloud-formation)..


## Exam:
- domains: cloud-concepts, security & compliance, technology, billing & pricing..