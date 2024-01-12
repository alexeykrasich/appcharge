##########Slack Variables#############

variable "slack_token" {
  default = "TOKEN"
}

variable "slack-user-logging"{
  default = "user"
}

variable "group_name0" {
  default = "appcharge-request-logs"
}

variable "channel_name" {
  default = "Appcharge_from_SQS"
}

##########SQS Queue Variables#############
variable "sqs_delayseconds" {
  default = "5"
}
variable "max_message_size" {
  default = "2048"
}
variable "message_retention_seconds" {
  default = 86000
}
variable "visibility_timeout_seconds" {
  default = 200
}
variable "receive_wait_time_seconds" {
  default = 10
}

#####S3 Bucket Variables##########
variable "s3_bucket_1_block_public_acl" {
  type = bool
  default = "true"
}

variable "s3_bucket_1_block_public_policy" {
  type = bool
  default = true
}
variable "s3_bucket_1_ignore_public_acls"{
  type = bool
  default = true
}
variable "s3_bucket_1_restrict_public_buckets"{
  type = bool
  default = true
}
variable "s3_bucket_1_acl"{
  default = "private"
}

######Lambda Variables###########
variable "lambda_name" {
  default = "my-test-lambda-function"
}
variable "lambda_description" {
  default = "Lambda function which calls code from S3 and invokes when S3 queue recieves a message"
}
variable "lambda_handler" {
  default = "lambda_function.lambda_handler"
}
variable "lambda_memory_size" {
  default = 128
}
variable "lambda_runtime" {
  default = "python3.9"
}
variable "lambda_timeout" {
  default = 180
}

# variable "" {
#  type = string
#  default = ""
# }

