terraform {
  required_version = ">= 1.0.0"

# Uncomment this block once the s3 and dynamoDB is deployed
/* backend "s3" {
    bucket = "YOUR_BUCKET_NAME"
    access_key = "YOUR_ACCESS_KEY"
    secret_key = "IAM_user_Secret"
    key = "setup-infra/s3/terraform.tfstate"
    region = "us-east-2"
    dynamodb_table = "YOUR_DYANAMO_DB_NAME"
    encrypt = true
    } */
}

provider "aws" {
  region     = "us-east-2"
}

resource "aws_s3_bucket" "terraform_state" {

  bucket = var.bucket_name
  force_destroy = true
  versioning {
    enabled = true
  }
  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
}

resource "aws_dynamodb_table" "terraform_locks" {
  name         = var.table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
