# Variables for the S3 backend configuration
variable "backend_s3_bucket" {
  description = "Name of the S3 bucket for Terraform state storage"
  type        = string
  default     = "your-s3-bucket-name"
}

variable "backend_s3_key" {
  description = "Path to store Terraform state within the S3 bucket"
  type        = string
  default     = "terraform/state.tfstate"
}

variable "backend_s3_region" {
  description = "AWS region where the S3 bucket is located"
  type        = string
  default     = "us-east-1"
}

variable "backend_dynamodb_table" {
  description = "Name of the DynamoDB table for state locking"
  type        = string
  default     = "your-dynamodb-table-name"
}
