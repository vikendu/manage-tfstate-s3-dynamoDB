terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.16"
    }
  }

  required_version = ">= 1.2.0"
# Uncomment this block once the s3 and dynamoDB is deployed
/* backend "s3" {
    bucket = "YOUR_BUCKET_NAME"
    # you can keep your keys in a separate file obv
    access_key = "YOUR_ACCESS_KEY"
    secret_key = "IAM_user_Secret"
    key = "setup-infra/s3/terraform.tfstate"
    region = "us-east-2"
    dynamodb_table = "YOUR_DYANAMO_DB_NAME"
    encrypt = true
    } */
}

provider "aws" {
  region     = "us-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-08d70e59c07c61a3a"
  instance_type = "t2.micro"

  tags = {
    Name = "Azure-pipelines-Test-Instance"
  }
}
