#!/bin/bash


# Set your AWS region
AWS_REGION="us-east-1"

# Set the instance ID of the EC2 instance you want to start

INSTANCE_ID="i-07c4eb43d74325cb2"




# Start the EC2 instance
#aws ec2 start-instances --region $AWS_REGION --instance-ids $INSTANCE_ID
#INSTANCE_STATE=$(aws ec2 describe-instances --region $AWS_REGION --instance-ids $INSTANCE_ID --query "Reservations[0].Instances[0].State.Name" --output text)

# Check if the instance is in the "running" state after starting
INSTANCE_STATE=$(aws ec2 describe-instances --region $AWS_REGION --instance-ids $INSTANCE_ID --query "Reservations[0].Instances[0].State.Name" --output text)

#PublicIpAddress=$(aws ec2 describe-instances --region $AWS_REGION --instance-ids $INSTANCE_ID --query "Reservations[0].Instances[0].PublicIpAddress" --output text)

echo "$INSTANCE_STATE"

echo "$PublicIpAddress"


if [ "$INSTANCE_STATE" == "stopped" ]; then
    
    aws ec2 start-instances --region $AWS_REGION --instance-ids $INSTANCE_ID 
    sleep 30
    echo "Instance Start Successfully"
    PublicIpAddress=$(aws ec2 describe-instances --region $AWS_REGION --instance-ids $INSTANCE_ID --query "Reservations[0].Instances[0].PublicIpAddress" --output text)

    echo "$PublicIpAddress"
else
    echo "Failed to start instance $INSTANCE_ID."
fi




