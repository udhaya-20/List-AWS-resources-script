#!/bin/bash

#------------------------------------------------------------------------------

# This script lists all the resources of major services used in an AWS account
# Author: Udhayakumar R
# Version: v0.0.1

# Major AWS services included are
# [ EC2, S3, IAM, EBS, VPC, Lambda, SNS, Cloudwatch ]

#------------------------------------------------------------------------------

# Step-1: Check for AWS CLI installation
if ! command -v aws &> /dev/null; 
then
    echo""
    echo "Error: AWS CLI is not installed. Please install it and try again."
    echo "To install AWS CLI, visit: ( https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html )"
    exit 1
fi

# Step-2: Check for AWS CLI configuration
if [ ! -d ~/.aws ]; 
then
    echo "Error: AWS CLI is not configured. Please configure it and try again."
    echo ""
    echo "Follow these steps to configure AWS CLI into your machine" 
    echo "-------------------------------------------------------------------------"
    echo "Step 1: Run 'aws configure' to set up your AWS CLI with your credentials."
    echo "Step 2: You will be prompted to enter the following:"
    echo "        - AWS Access Key ID: Your access key ID (e.g., AKIA...)"
    echo "        - AWS Secret Access Key: Your secret access key."
    echo "        - Default region name: The AWS region you typically work in (e.g., us-east-1)."
    echo "        - Default output format: The output format for the CLI (json, text, or table)."
    echo "Step 3: You can get your AWS access keys from the AWS Management Console under 'My Security Credentials'."
    echo "Step 4: To manually configure, you can edit the following files: ~/.aws/credentials and ~/.aws/config"
    echo ""
    echo "Follow these steps to generate an AWS Access Key:"
    echo "------------------------------------------------------------------------------"
    echo "Step 1: Log in to the AWS Management Console (https://aws.amazon.com/console/)"
    echo "Step 2: Navigate to IAM ==> Users and select a user or create a new user."
    echo "Step 3: Under 'Security credentials', click 'Create access key'."
    echo "Step 4: Download and save the Access Key ID and Secret Access Key."
    echo ""
    echo "For more information, refer to: https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-files.html"
    exit 1
fi

# Step-3: Get available regions
available_regions=$(aws ec2 describe-regions --query "Regions[*].RegionName" --output text)

# Step-4: Get inputs from user
echo ""
read -p "Enter the region code (e.g., us-east-1): " region_code

# Step-5: Verify if the entered region is valid
if [[ $available_regions =~ $region_code ]];
then
    region_description=$(aws ec2 describe-regions --region "$region_code" --query "Regions[?RegionName=='$region_code'].RegionName" --output text)
    echo "Selected Region is: $region_code"
else
    echo "Error: Invalid region code. Please enter a valid AWS region."
    exit 1
fi

# Step-6: Get service input from user
echo ""
read -p "Enter the AWS service name: " service_name
echo ""

# Step-7: Convert service name to uppercase for case-insensitive comparison
service_name_upper=$(echo "$service_name" | tr '[:lower:]' '[:upper:]')

# Step-8: Execute the AWS CLI command based on the user-entered service name
case $service_name_upper in
    EC2)
        echo "Listing EC2 Instances in '$region_code' region..."
        aws ec2 describe-instances --region "$region_code"
        ;;
    S3)
        echo "Listing S3 Buckets..."
        aws s3api list-buckets --region "$region_code"
        ;;
    IAM)
        echo "Listing IAM Users..."
        aws iam list-users --region "$region_code"
        ;;
    EBS)
        echo "Listing EBS Volumes in '$region_code' region..."
        aws ec2 describe-volumes --region "$region_code"
        ;;
    VPC)
        echo "Listing VPCs in '$region_code' region..."
        aws ec2 describe-vpcs --region "$region_code"
        ;;
    LAMBDA)
        echo "Listing Lambda Functions in '$region_code' region..."
        aws lambda list-functions --region "$region_code"
        ;;
    SNS)
        echo "Listing SNS Topics..."
        aws sns list-topics --region "$region_code"
        ;;
    CLOUDWATCH)
        echo "Listing Cloudwatch Alarms in '$region_code' region..."
        aws cloudwatch describe-alarms --region "$region_code"
        ;;
    *)
        echo "Error: Invalid service. Please enter a valid AWS Service."
        echo "Valid AWS Services are: ${services[*]}"
        exit 1
        ;;
esac

