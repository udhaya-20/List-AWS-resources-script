# AWS Resource Lister Script

## Overview

This **Bash script** allows users to list resources from major AWS services in their AWS account. It checks for AWS CLI installation and configuration,
then prompts the user for the AWS region and service they want to query.

### Supported AWS Services in this script
- EC2 (Elastic Compute Cloud)
- S3 (Simple Storage Service)
- IAM (Identity and Access Management)
- EBS (Elastic Block Store)
- VPC (Virtual Private Cloud)
- Lambda (AWS Lambda Functions)
- SNS (Simple Notification Service)
- Cloudwatch (Monitoring & Alarms)

## Features
- **AWS CLI Installation Check**: Verifies if AWS CLI is installed on the machine or not.
- **AWS CLI Configuration Check**: Ensures the user has configured their AWS CLI credentials.
- **AWS Region Validation**: Prompts users for a region and validates it against available regions.
- **Service Resource Listing**: Lists resources for the selected AWS service in the provided region.

## Prerequisites

- **AWS CLI**: The script requires the AWS CLI to be installed and configured on your system. Follow the steps below to install and configure it.
  
## Installation

### Step 1: Install AWS CLI
If the AWS CLI is not installed, you can install it using the following guide:
- [AWS CLI Installation Guide](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

### Step 2: Configure AWS CLI
Once the AWS CLI is installed, you must configure it with your credentials:
The command to configure:
```bash
aws configure
```
### Step 3: Create the Script
Copy the code provided in the script into a file named eg:(aws_resource_lister.sh).
Save it to a desired location.

### Step 4: Make the Script Executable
To execute the script, you need to provide it with execution permissions:
The command to make the script executable:
```bash
chmod +x aws_resource_lister.sh
```

### Step 5: Run the Script
Run the script in your terminal by using the following command:
```bash
./aws_resource_lister.sh
```
### --------------------Thankyou for using/executing my script-------------------- ###
