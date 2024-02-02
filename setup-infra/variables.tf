variable "bucket_name" {
  description = "The name of the S3 bucket."
  type        = string
  default = "YOUR_BUCKET_NAME"
}

variable "table_name" {
  description = "The name of the DynamoDB table."
  type        = string
  default = "YOUR_DYANAMO_DB_NAME"
}
