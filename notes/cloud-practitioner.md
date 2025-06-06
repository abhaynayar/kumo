# AWS-Cloud-Practitioner:
Bookmark: - AWS Skill-Builder: Exam Prep Plan: AWS Certified Cloud Practitioner (CLF-C02 - English) - AWS Certified Cloud Practitioner (CLF-C02) - **Domain-4-Review**:..

## Methods of Deploying & Operating:
- Public, Private, Multi, & Hybrid-Cloud:
    - Public-Cloud: AWS.
    - Multi-Cloud: AWS+GCP+Azure.
    - Private-Cloud: AWS Outposts.
    - Hybrid-Cloud: Deploying on-premesis and on the cloud is not Hybrid-Cloud, it is Hybrid-Environment. Hybrid-Cloud is using Public-Cloud & Private-Cloud together. (Not Public-Cloud & On-Premesis).
- Public & Private-Services:
    - Public-Service: In a public-zone i.e. can be connected to from an internet-connection. Example: Amazon S3.
    - Private-Service: In a private-zone i.e. cannot be connected to from an internet-connection or public-zone. Example: VPC, EC2. By default isolated and can only be accessed by other private-zone-services, can add permissions to access from public-zone/internet.
    - Network-Connectivity: AWS-Direct-Connect, AWS-VPN, Internet-Gateway, NAT-Gateway.

## Global-Infrastructure & Reliability:
- Regions:
    - Build close to business-demands.
    - Inside each region there are multiple data-centers.
    - Inter-region high-speed fibre-network-connections.
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
    - Edge-Locations have Cloudfront, Route53 (DNS).
    - AWS Outposts: (O&O by AWS). In your building.
    - **Amazon-CloudFront** = CDNs.
        - Uses AWS-Shield.
        - Improves cache content. (Static/Dynamic).
    - **AWS-Global-Accelarator**:
        - Uses AWS-Shield.
        - Improves performance for applications. (TCP/UDP).
        - No-Caching.
        - HTTP uses-cases for a static IP.
        - Fast regional-failover.
- How to provision AWS-resources?:
    - Through-APIs.
    - Services that send requests to AWS-APIs:
        - AWS Management-Console. (Browser-Based).
        - AWS Command-Line-Interface. (CLI).
        - AWS Software-Development-Kits. (SDK).
    - Infrastructure-as-Code:
        - **AWS-Elastic-Beanstalk**:
            - Give it application-code & desired-configurations.
            - Elastic Beanstalk gives you the ability to deploy and manage applications in AWS Cloud without you having to understand or manage the underlying infrastructure. Elastic Beanstalk also includes functionality to monitor the health of your application.
        - **AWS-Cloud-Formation**:
            - Cloud-Formation Template.
            - **AWS-CDK** = Cloud-Formation + Programming-Languages + Reusability.

## EC2:
- Intro:
    - AZ-resilient, not-region-resilient.
    - ***Multi-tenancy***: Sharing underlying hardware between virtual machines.
        - When you spin up an EC2 instance, it’s not an entire physical machine, it’s a VM in a physical machine among others, managed by a hypervisor.
        - The hypervisor is responsible for coordinating this multitenancy. And it is managed by AWS.
    - EC2-Instances are resize-able.
    - You only pay for running instances, not stopped or terminated instances.
- EC2-Instance-Families:
    - General-Purpose.
    - Compute-Optimized. (Batch-Processing).
    - Storage-Optimized. (High-RW to Local-Storage).
    - Memory-Optimized. (Large-Dataset In-Memory).
    - Accelerated-Computing.
    - AMI: Amazon-Machine-Instances: Custom-Images.
    - ***Instance-Metadata***: `http://169.254.169.254/latest/metadata`
- EC2-Scaling:
    - Vertical: Re-Size, Horizontal: Adding new instances.
    - EC2-Auto-Scaling: (Horizontal): Add/Remove instances in response to changing-needs.
        - Dynamic: Respond to changing-demand.
        - Predictive: Schedule based on predictions.
        - Both can be used together.
    - The **minimum-capacity** is the number of Amazon-EC2-Instances that launch immediately after you have created the Auto Scaling group.
    - If you do not specify the **desired-capacity** of Amazon-EC2-Instances in an Auto-Scaling-Group, the desired-capacity defaults to your minimum-capacity.
    - Configure the Auto-Scaling-Group to scale out in response to increased-demand, but only to a **maximum-capacity** of four Amazon-EC2-Instances.
- Elastic-Load-Balancing:
    - It is a **regional-construct**. It runs on a region-level.
    - It is a **single-URL** that the front-end, then the ELB directs the traffic to the back-end.
- AWS-Lambda:
    - Serverless compute-option. Managed-environment.
    - Upload code to Lambda-Function. Configure a trigger.
    - 1-mil free then charged by num of request AND execution-time.
- Other:
    - Amazon-ECS. (Elastic-Container-Service).
    - Amazon-EKS. (Elastic-Kubernetes-Service).
    - **Container** (Docker) is a package for your code.
        - Package up your application/code, dependencies, configs.
        - These containers run on top of EC2 instances (host) in isolation.
        - Many containers together is a **cluster**.
        - The process is called container orchestration.
    - AWS-Fargate: Platform for ECS or EKS.
- Agility is the ability to add or to remove new or existing services quickly. Agility does not relate to horizontal-scaling.

## Networking:
- **Amazon-Virtual-Private-Cloud** (VPC):
    - Lightsail is a virtual-private-server that you use to build and host applications in the AWS-Cloud.
    - It's a region-level resilient/construct, not global/AZ-level.
    - Logically-isolated section of AWS-Cloud. In a virtual-network that you define.
    - Public/private (subnets) IP-range. Subnets: group resources-together.
    - In order to allow public-traffic to flow into your VPC, you need to have an **Internet-Gateway**. (IGW).
    - **NAT-Gateway**: Allow-private-resources access to internet or AWS-Public-Zones. Common reason to do this is public-updates. NAT-gateways sit in a public(not-private) subnet to allow private-resources access to the Internet or the AWS public-zones.
    - **VPC-Peering**: Link multiple VPCs together. Can spans AWS-accounts/regions.
    - **VPC-Endpoints**: Sort of like an Internet-Gateway but inside Private-Zone for communicated outside-of-it.
    - For Private-Traffic, use-instead a Private-Gateway. **Virtual-Private-Gateway**: VPN-Connection between a Private-Network, and your VPC.
    - For a **dedicated** Private-Connection with Low-Latency, **AWS Direct-Connect**: From your Data-Centre to AWS. **Physical piece-of-fiber**.
    - **AWS-VPN**: Hardware-VPN between Amazon-VPC and On-Premesis.
    - **AWS Site-to-Site VPN**: Creates an encrypted network path between your on-premises network and your AWS Cloud network. This connection between your on-premises network and your AWS Cloud network uses the internet. 
- Subnets & Network-ACLs:
    - The only reason to use subnets within the VPC is to access control to the gateways. Public-subnets have access to the internet-gateway, private subnets, do-not.
    - Every-packet that attempts to cross over the subnet boundary gets checked over by the **network access control list (ACL)** - does the packet have permissions to *leave and/or enter the subnet* based on who it was sent from and how it was trying to communicate. By default, network-ACLs allow-all inboug/outbound traffic.
    - But that is for whole-subnets. Instead, to solve **Instance-Level-Access** we have **Security-Groups**. Every EC2-Instance when it's launched, automatically comes with its EC2-Instance. By default: all-ports and-IPs are-blocked.
    - **Security-group is stateful vs. Network-ACL is stateless**.
    - **Security-groups by default allow ALL return-traffic**.
- Global-Networking:
    - **Amazon-Route-53**: (DNS-web-service): Routing-Policies:
        - Latency.
        - Geolocation.
        - Geoproximity.
        - Weighted-round-robin.
    - You can also buy domain-names from Route-53. Connect user requests to infrastructure in AWS and outside of AWS.
    - You can use Cloud-Front to cache serve static-assets near your customers in edge-loc-tions.

## Storage:
- Instance-Stores & Amazon-EBS:
    - Block-Level-Storage: Stores-files. As blocks on disk. So not all overwritten. Updates just the pieces that changed.
    - **Instance store volumes**. Local-storage directly attached to the host that your EC2 instances is attached on top of. But if you stop EC2. All data to the instance store volume will be deleted. Because if you start instance again it might start on another host where the volume does not exist. Since **EC2-Instances are virtual-machines**. Don't write important data to these drives. Only epehermal stuff.
    - Instead use **Elastic-Block-Storage**: Virtual-volumes, can attach to your EC2-Instances. Not tied to host. Set size, type, config then attach to your EC2-Instance. Take regular **snap-shots** (Incremental-Backups). **Solid-State by default, but hdd options**. **Up to 16TiB**.
    - Block-storage (EBS) is preferred over object-storage (S3) when say you wanna make edits to a big video file. cause in block-storage only parts of the file need to be changed, in object-storage we need to re-upload the whole new edited video-file.
    - Most EC2-Instance use EBS for boot-volume. (Where the operating-system is stored).
    - Types:
        - General-purpose-SSD.  (Boot-volume).
        - Provisioned IOPs-SSD.  (Data-Bases).
        - Throughput-optimized-SSD.  (Streaming).
        - Cold-HDD.  (Low-storage-cost).
    - **AWS-Storage-Gateway**:
        - Connect on-premesis to AWS.
        - Types:
            - File-gateway: stores objects in S3 with on-premesis local-cache.
            - Volume-gateway: stored and cached-volumes.
            - Virtual-tape: virtual-tape-drive-to-S3.  (disaster-recovery).
- **Amazon-S3**:
    - **Data is stored as objects**.
    - **Objects are stored in buckets**.
    - **Maximum object size is 5-TB!!**
    - Unlimited amount of data.
    - In public-zone.
    - Globally-unique-name no-matter which region or AZ.
    - Can also version objects to prevent from accidental-deletion.
    - S3-Lifecycle management/policies: Move-data automatically between-tiers.
    - S3-Versioning: Restore if overwritten or deleted.
    - Classes/Tiers: (**Durability = Probability of Remaining-Intact after 1-Year**):
        - **S3-Standard** -> 11 9s durability -> 99.99999999% of durability.  multiple copies reside across 3 locations.
        - S3-Static-Website hosting.
        - S3-Standard-Infrequent Access less frequently but rapid when needed.  to store backups/disaster-recovery. In the Amazon S3 Intelligent-Tiering storage class, Amazon S3 monitors object access patterns. If an object has not been accessed for 30 consecutive days, Amazon S3 automatically moves it to the infrequent access tier, Amazon S3 Standard-IA. If an object is accessed in the infrequent access tier, Amazon S3 automatically moves it to the frequent access tier, Amazon S3 Standard.
        - **S3-Glacier-Flexible-Retrieval**: Compliance. Glacier vault-policy.  Controls like: write once read many (WORM).
        - **S3-Glacier-Deep-Archive**: Objects stored in the Amazon S3-Glacier-Flexible-Retrieval storage class can be retrieved within a few minutes to a few hours. By comparison, objects that are stored in the Amazon S3 Glacier Deep Archive storage class can be retrieved within 12 hours.
        - Amazon-S3 Intelligent-Tiering monitors access patterns of objects and automatically moves them between the Amazon S3 Standard and Amazon S3 Standard-IA storage classes. It is not designed for archival data.
- **Amazon-EFS**: (Elastic-File-System):
    - Businesses usually have shared filesystems across their applications.
    - Multiple instances can access the data in EFS at the same time.
    - EBS:
        - Attached to EC2. **Availability-Zone-level resource**.
        - Need to be in same AZ to attach to EC2-Instance.
        - EBS Volumes do not automatically scale.
    - EFS:
        - Automatically-scales.
        - It is not a blank hard-drive but a Linux.
        - Regional-resource. Amazon EFS is a shared file system that gives EC2 instances the ability to share access to data in different Availability Zones in the same AWS Region.
    - FSx: For Windows, cause EFS is for Linux, has: SAMBA, AD, ACLs.
    - FSx-Lustre: Parallel-Distributed: ML, high-perf, sub-ms-latency.

## Data-Bases:
- **Amazon-RDS**: (Relational-Database-Service):
    - One RDS DB instance resides in a single Region. With Amazon RDS, you can create read replicas across Regions. Amazon RDS replicates any data from the primary DB instance to the read replica across Regions.
    - Automated-patching, backups, redundancy, failover, disaster-recovery.
    - Asynchronous-replication: Read-Replica.
    - Synchronous-replication: Standby-Instance.
    - Backups by default.
    - Compute-capacity easily-scaled.
- **Amazon-Aurora**:
    - Cluster. MySQL. PostgreSQL.
    - 1/10th the cost of commercial-databases.
    - Data replication across facilities.
    - Up to 15-replicas.
    - Continuous backup to S3.
    - Point-in-time recovery.
    - Aurora-Global: Replicate-Globally. Less than 1s between-regions.
    - Aurora-Serverless: Aurora-Capacity-Units: (ACUs): You can set min and max ACU you will need, it will scale according to that. Can go down to zero and even be paused.
- **Amazon-Dynamo-DB**:
    - Public-Service in Public-Zone.
    - **Serverless-Database**.
    - Tables -> Items, Attributes.
    - Manages underlying-storage/scaling.
    - Stores-redundantly. Across-AZs. Mirrors data across multiple-drives
    - **1-ms response-time**.
    - Does not use SQL. No-SQL. Great for data-sets where there is some variation from item-to-item. Like your client-side JSON-blob collections.
- RDS vs. Dynamo-DB:
    - RDS: Ownership of data, schema, network.
    - DDB: Key-value, massive-throughput, PB-size, granular-API-access.
- **Amazon-Redshift**: (OLAP not OLTP):
    - PB-scale data-warehousing-solution.
    - Cluster. On-loads/off-loads to S3.
    - Redshift-Spectrum for direct S3 read/write.
    - Instead of right-now. **What DID happen?**
    - Volume of data over time. Is-huge.
    - So we need **data-warehouses**. Where you are looking at historical-analytics as opposed to operational-analysis.
    - Redshift = Data-Warehousing as a Service.
    - Redshift-nodes in multiple-petabytes is common.
    - Redshift-Spectrum. Run SQL-query across exa-bytes of unstructured-data.
- **AWS-DMS**: (Database-Migration-Sevice):
    - Source remains operational during migration.
    - Source & Target don't need to be of same type.
- Database-Accelerators: (In-Memory):
    - Amazon-ElastiCache. **memcacheD** & **Redis**.
    - Amazon-DynamoDB-Accelerator. Amazon DAX. Micro-seconds as opposed to milli-seconds. Not strongly-consitent but eventually-consistent. Low-latency.
- Additional-DB-Services:
    - You can use **AWS-SCT** to convert an existing database schema from one **database-engine** to another.
    - You can use **AWS-Data-Sync** to move data. However, AWS-Data-Sync does not provide database-schema-management.
    - Amazon-DocumentDB: like-MongoDB.
    - Amazon-Neptune: Graph-DB for social-network, rec-sys, fraud-detection.
    - Amazon-Managed-Blockchain.
    - Amazon-QLDB: Quantum-Ledger: Immutable, no entry can ever be removed.

## Security:
- Shared-Responsibility Model:
    - AWS: of the cloud ie. physical, network, hypervisor.
    - Customer: in the cloud. ie. operating-system, application, data.
- User-Permissions & Access:
    - AWS root-account user, owner of AWS account, access & control anything.
    - Programmatic-access requires: an access-key ID, & a secret-access-key.
    - As soon as you create an account pls turn on MFA.
    - Still, you don't wanna use root-user for everything.
    - **AWS-IAM**:  for granular access instead.
        - Create IAM users: by default no permissions.
        - Add access by principle of least-privilege.
        - Attach policy to an IAM user - IAM policy (json doc) -> what API calls (action) can a user can/can't (effect) make. on a (resource). managed (AWS) / unmanaged (customer).
        - Organize them into IAM groups. attach a policy to a group (all users get access)
        - IAM-policy simulator.
        - S3-user/bucket policy.
        - MFA-delete. (must-enable-versioning-first).
        - **IAM Identity Center** provides you with the ability to manage sign-in security for your workforce users. IAM Identity Center can be used for SSO integration to access the AWS Management Console.
    - **IAM-Roles**:
        - Associated permissions.
        - Allow or deny.
        - Assumed for temp amounts of time.
        - No username or password.
        - Access to temporary permissions.
        - Can apply them to: resources, users, external IDs, applications, other services.
        - When applied, everything previous to that role is abandoned.
        - You can federate users into the account. (corp-account).
    - Amazon-Cognito Identity-Pool??
- Compliance:
    - Examples: EU -> GDPR, US-healtcare -> HIPAA
    - Region -> compliance -> do-not replicate-data.
    - AWS-Compliance & AWS-Artifact: compliance-reports done by third-parties. Review, accept, and manage agreements with AWS.
- DDoS:
    - UDP-Flood. reflection. fake return-address. ie. victim-server.
    - HTTP-level. slow-lorris. pretends to have a terribly-slow connection.
    - UDP-flood solution: security-groups. 
    - Slow-Lorris solution: elastic-load-balancer.
    - **AWS-Shield** with **AWS-WAF**: ML, new-threats.
- Additional-Services:
    - **AWS-Cert-Manager**: Implement encryption in transit.
    - **AWS-KMS**: create crypto-keys - encryption at rest/transit.
    - **Amazon-Inspector**: automated security-assessments against your infrastructure. **EC2, not S3**
        - Network-config reachability-piece.
        - Amazon-agent.
        - Security assessment service.
    - **Amazon-Guard-Duty**:
        - AWS-GuardDuty identifies threats by continually monitoring the network activity and account behavior within an AWS environment.
        - Takes in as input: cloud-trail, vpc flow logs, dns logs.
        - Known IP-address, anomaly-detection, machine-learning.
        - GuardDuty provides continuous monitoring and threat detection services. GuardDuty uses threat intelligence feeds and machine learning to identify unauthorized and malicious activity within your AWS environment. You can use GuardDuty to identify compromised instances and accounts.
    - Advanced-Shield, Security-Hub.
    - **Macie** is an automated security assessment service that helps improve the security and compliance of applications (S3) deployed on AWS.
    - **Secrets-Manager** helps you protect secrets needed to access your applications, services, and IT resources. Secrets-Manager does not perform S3 data classification and automatic discovery.

## Monitoring & Analytics:
-  **Amazon-Event-Bridge**:
-  **Amazon-CloudWatch**: (near-real-time):
    - Amazon CloudWatch is a service that provides data for monitoring applications, optimizing resource utilization, and responding to system-wide performance changes.
    - CloudWatch monitors your AWS resources and the applications that you run on AWS in real time. You can use CloudWatch to collect and track metrics, which are variables that you can measure for your resources and applications. However, CloudWatch does not record API activity.
    - CloudWatch-Alarm:
        - Threshold for metric when breached -> alarmed.
        - Integrated with SNS. (can send SMSes).
    - **Dash-Board**: Auto-Refresh.
    - Reduce MTTR & TCO.
-  **AWS-CloudTrail**:
    - AWS-API-auditing-tool.
    - Every request gets logged in the cloud-trail-engine
    - Who, when, where, what was the response.
    - Root can change- how do you convince auditor it wasn't changed? Cloud-trail. Vault-lock.
-  **AWS-Trusted-Advisor**:
    - Automatically evaluates your resources against 5 pillars.
    - Cost, perf, security, fault-tolerance, service-limits.
- Messaging & Queueing:
    - If applications communicate directly → tightly coupled architecture.
    - Loosely coupled → single failure won’t cascade into multiple failures.
        - We create a message-queue.
        - Amazon-SQS/SNS. (Queue/Notification).
    - **SQS**: (Short & Long-Polling,  Queue-Types):
        - Amazon-SQS is a message queuing service. Using Amazon-SQS, an application developer can send, store, and receive messages between software components at any volume size, without losing messages or requiring other services to be available.
        - In Amazon-SQS, an application sends-messages into a queue. A user or service retrieves a message from the queue, processes-it, and then deletes it from the queue.
    - **SNS**:
        - Pub-Sub-Model.
        - Create an SNS-Topic.
        - Ex. Cloud-Formation when Stacks change-status.
- Bussiness-Application-Services:
    - Amazon-Connect. (cloud-based contact center service that you can use to set up an on-demand contact center).
    - Amazon-Simple-Email-Service.

## Migration & Innovation:
- AWS Application-Migration Service:
    - AWS MGN is an automated lift-and-shift solution. This solution can migrate physical servers and any databases or applications that run on them to EC2 instances in AWS.
- AWS-CAF: (Cloud-Adoption-Framework):
    - 6-Areas based on role-type: **Perspectives**: biz, ppl (hr), governance, platform, sec, ops.
    - AWS-CAF Action-Plan.
- 6-R's of migration:
    - Rehosting: lift & shift.
    - Replatforming: lift, tinker, & shift. no code-changes/dev-efforts.
    - Refactoring/re-architecting: new-code, biz-need. was not possible on-prem.
    - Repurchasing: abondon legacy-software-vendor.
    - Retaining: wait a bit before killin 'em.
    - Retiring: no-longer-needed cause aws-awesome.
    - **Re-Locate**: The 7th-R.
- AWS-Snow-Family:
    - 1Gbps = 1-PB of data in 100-days.
    - AWS-Snocone = 8-TB data, edge-computing. EC2, AWS IoT green-grass.
    - Ship, plug, copy, then we will copy to S3 you own. TBs of data.
    - Snowball-Edge: compute-optimized, storage-optimized.
    - Snomobile: 45-foot shipping-container pulled by truck. 100-PB.
- Innovation-at-AWS:
    - VM-Ware-Cloud on AWS.
    - Amazon-Sage-Maker.
    - Amazon-Lex. (Alexa).
    - Amazon-Textract.
    - AWS Deep-Racer.
    - IoT: ??
    - AWS-Ground-Station. (Satellite).
    - Amazon Polly is a machine learning service that converts text to speech. This service provides the ability to read text out loud.
    - Amazon-Augmented-AI. (A2I). Amazon Augmented AI (Amazon A2I) provides built-in human review workflows for common machine learning use cases, such as content moderation and text extraction from documents. With Amazon A2I, a person can also create their own workflows for machine learning models built on Amazon SageMaker or any other tools.

## Other-Services:
- ML-Services:
    - AI:
        - Amazon-Translate.  (Text-to-speech).
        - Amazon-Polly.
        - Amazon-Lex.
        - Amazon-Comprehend.
        - Amazon-Forecast.
        - Amazon-Code-Guru.
        - Amazon-Rekognition:  (Image/Video: Identify-objects/people/text/etc).
    - ML:
        - AWS-Sagemaker.
        - Amazon-Code-Whisperer.
    - ML-Frameworks & Infrastructure:
        - Tensor-Flow.
        - Py-Torch.
        - Apache-MX-Net.
- Data-Analytics:
    - Amazon-Macie: AWS-Security-Service, Discover/Classify/Protect S3-Data. (Ex. PII).
    - Amazon-Athena: Interactive-Query-Service, Data-Stored-in-S3. Pay-per-query/TB-scanned.
    - Amazon-Redshift: Column-Based, Cluster, OLAP.
    - Amazon-Kinesis: Streaming-Data, Real-Time. (Ex. Click-Stream).
    - AWS-Glue: Serverless-data-integration-service from multiple-sources.
    - Amazon-Quicksight: BI-Service.
    - Amazon-Open-Search: DB & Search-Engine.
    - **Amazon-EMR**: Service that helps run big data frameworks to process vast amounts of data. Hosted Apache-Hadoop-Framework running on EC2 & S3.
- Customer-Engagement-Services:
    - AWS-Activate.
    - AWS-IQ.
    - AWS-Managed-Services. (operational services to manage a customer's AWS infrastructure and services on their behalf).
    - AWS-Support. (hub used by users to request and manage support requests from AWS).
- Developer-Services:
    - AWS-App-Config.
    - AWS-Code-Pipeline.
    - AWS-Code-Commit.
    - AWS-Code-Artifact.
    - AWS-Code-Build.
    - AWS-Code-Star.
    - AWS-X-Ray.
    - AWS-Cloud-9.
    - AWS-Cloud-Shell.
    - AWS-Code-Deploy.
        - AWS-Code-Deploy is a deployment-service used to automate application-deployment on compute-resources. However, the developer is still required to have knowledge of how to manage the underlying infrastructure and AWS networking-services.
- End-User-Compute:
    - Amazon-App-Stream-2.0.
    - Amazon-Workspaces.
    - Amazon-Workspaces-Web.
- Frontend-Web-and-Mobile:
    - AWS-Amplify.
    - AWS-App-Sync.
- IoT-Services:
    - IoT-Core.
    - IoT-Green-Grass.

## Billing, Pricing, & Support:
- **EC2-Purchase-Options**:
    - On-Demand. (Costliest, for unpredictable-workloads). Linux/second, Windows/hour.
    - Savings-Plan. (Fixed dollar-amount/hour for 1/3-years). EC2/Fargate/Lambda.
    - Reserved-Instances. (1/3-year commitments with discounts). Standard/Convertible/Scheduled.
    - Dedicated-Hosts. (Physical-Server). On-Demand/Reserved. (1/3-years). Compliance. If you needed to use your existing server-bound software-licenses.
    - Spot-Instances. (Cheapest, bidding, 2-minute-notice). Stateless-workloads. Batch-processing, big-data-analytics, containerized-applications, CI/CD-pipelines.
-  AWS-Free-Tier:
    - Types: Always-Free, 12-Months-Free, Trials.
    - Services: (Free-Tier-examples):
        - Lambda: 1-mil free invocations-per-month.
        - After free-tier expires.
        - S3: free-for 12-months for up-to 5GB-of-storage.
        - Sage-Maker, Dynamo-DB, SNS, Cognito.
- AWS-Pricing-Calculator:  https://calculator.aws/#/
- Billing-Dashboard: Search in AWS-console. Can-consolidate.
- **AWS-Budgets**: Cost or usage when breached. Get-notified.
- **AWS-Cost-Explorer**: Since pay for what you use.  
- **AWS-Control-Tower**: would help the company set up and govern an AWS-multi-account environment that follows AWS best practices. However, AWS-Control-Tower does not provide guidance on moving to the AWS-Cloud.
- **AWS-Organizations**: (Central-location to manage multiple-AWS-accounts):
    - Centralized-management.
    - Consolidated-billing.
    - Hierarchical groupings of accounts.
    - AWS service & API actions access-control.
        - Service-Control-Policies (SCPs) - applied to individual-member-account, or an org-unit (OU).
    - Organizations offers an API to create and manage AWS accounts. Organizations can control permissions that are available to accounts and can consolidate-billing.
- AWS-Marketplace: Catalog. 3rd-party-software. One-click-deployment. Pay as you go.
- AWS-Support-Plans:
    - Basic-Support. free. 24x7 customer service, docs, whitepapers, aws trusted-advisor, aws personal-health dashboard.
    - Dev-Support: basic + email customer support (24h resp time, 12 hour if impaired)
    - Business-Support: basic+dev, full-set trusted-advisor checks, phone-access to cloud-support engineers.. (4h hour if impaired, 1 hr if down)
    - Enterprise on-ramp: prev. + 30 min resp. time + access to a pool of TAMs.
    - Enterprise: prev. + 15-minute resp time for biz crit work-loads.. designated TAM
    - TAM: Well-architected-framework: op ex, sec, reliability, perf, cost, sustainability.
- **AWS-Well-Architected-Frame-Work**:
    - Ex: Replicate-VPCs across-AZs.
    - Tool: green, orange, red.
    - Pillars: **opex, sec, reliability, perf, cost, sustainability**.
        - Sec:  Identity, traceability, integrity, encryption.
        - Cost: Deliver-business-value at the lowest-price-point where money is spent ex. overestimation ec2-size.
        - Opex: **Anticipate-failure**, IaC, monitoring, automating changes to pipelines, responding to triggered-events.
        - Perf-Efficiency: Democratize advanced-tech, go global fast, serverless, experiment, ex. Amazon EC2-type.
        - Reliability: **Automatic recovery-planning from aws-service failures**, scale-horizontally, stop-guessing-capacity.
        - Sustainability: Env-impact, max util, efficient-offerings, managed-services.

## 6-Main-AWS-Cloud-Benefits:
1. On-premesis data-center-costs.
2. Benefit from massive-economies-of-scale.
3. Stop-guessing-capacity.
4. Increased speed & agility.
5. Stop spending-money running & maintaining data-centers.
6. Go-global in-minutes. (Cloud-Formation).

## Simu-Learn: AWS-Lambda & Amazon-Event-Bridge:
- Hi-there. Our manual Amazon-EC2 instance tracking is tedious, and we are looking for an automated-solution. To address your requirement, we can use a combination of AWS-Lambda, Amazon-CloudWatch, and Amazon-Event-Bridge. We'll create a Lambda function that collects the necessary information about your EC2 instances. AmazonrEvent-Bridge will invoke the Lambda function and monitor for specific EC2 events.
- Amazon-CloudWatch can capture various metrics and logs related to your EC2 instances, such as instance state changes, CPU utilization, and network traffic.
Amazon-Event-Bridge acts as the central event bus, monitoring for specific EC2 events and invoking the Lambda function accordingly.

```
import json
import boto3
from pprint import pprint

def lambda_handler(event, context):

    client = boto3.client("ec2")
    status = client.describe_instance_status(IncludeAllInstances = True)

    for i in status["InstanceStatuses"]:
        print("This is the Lambda function from Lab 1 - an EC2 instance has just started running!")
        print("AvailabilityZone :", i["AvailabilityZone"])
        print("InstanceId :", i["InstanceId"])
        print("InstanceState :", i["InstanceState"])
        print("InstanceStatus", i["InstanceStatus"])
    return {
        'statusCode': 200,
        'body': json.dumps('Hello from Lambda!')
    }
```

---
## Weak-Areas:
- under-stand differences between AWS-security-services..
- under-stand differences between pricing-models.. **EC2-purchase-options**..

## Flash-Cards:
- 5-Criteria of Cloud-Computing?:
- On-Demand Self-Service, Network-Connectivity, Resource-Pooling, Elasticity, and that resource usage must be monitored and billed.

- 6-Pillars of WAF:    TBD:
- 7-Migragion strats:  TBD:

- 4-parts of total-cost of-ownership (TCO) in AWS for this exam?:
  - Operational expenses (OpEx) are your day-to-day operating costs such as utilities, printer toner, coffee, and snacks. 
  - Capital Expenses (CapEx) are the costs associated with creating the long-term benefits such as purchasing a building, servers, printers, storage, and backups. CapEx items are generally purchased once, and are expected to be used by your organization for years.
  - Labor costs are the costs assocaited with staffing an on-premises environment or data center such as the network operation center technicians, who are responsbile for installation, configuration, troubleshooting, and management of your servers and infrastructure.
  - Software licensing costs are the cost and the impact of migrating software licensing costs to AWS.

- When you migrate from an on-premises environment and traditional servers to AWS, are you trading capital expenses for variable expenses? 
  - Yes.