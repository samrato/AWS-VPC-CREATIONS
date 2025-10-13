# Backend configuration for remote state storage
# NOTE: You must initialize this backend with proper values before applying
# terraform init -backend-config="bucket=actual-bucket-name" -backend-config="dynamodb_table=actual-table-name"
terraform {
  backend "s3" {
    bucket         = "your-s3-bucket-name"       # Replace with your S3 bucket name
    key            = "terraform/state.tfstate"   # Path to store Terraform state
    region         = "us-east-1"                 # Modify to your AWS region
    dynamodb_table = "your-dynamodb-table-name"  # Replace with your DynamoDB table name
    encrypt        = true                        # Ensures state file encryption
  }
}
