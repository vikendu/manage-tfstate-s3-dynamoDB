# manage-tfstate-s3-dynamoDB
my solution to how to manage tfstate for a large team/distributed builds using s3 buckets and dynamoDB

FIRST: Deploy the s3 bucket and DynamoDB in setup-infra dir

SECOND: Uncomment the 'backend' block in your project main.tf

use `terraform init` to initialize the project dir then all changes going forward should get stored in the s3 bucket and DynamoDB will ensure no one else can make changes while you're working on it.
