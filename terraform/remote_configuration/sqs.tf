#SQS SQS Queue.
resource "aws_sqs_queue" "test-sqs" {
  name                       = "FORECS-TEST_ALEX"
}

#Create Bucket 1
resource "aws_s3_bucket" "s3-bucket-ALEX" {
  bucket = "my-test-bucket-lambda-sqs-alex333"
}

#Call SQS resource as data reference
data "aws_sqs_queue" "lambda_sqs_queue" {
    name = "FORECS-TEST_ALEX"
}

#Lambda Function Resource
resource "aws_lambda_function" "lambda_alex" {
  function_name    = var.lambda_name
  role             = "arn:aws:iam::635496631625:role/service-role/schedule-lambda-role-ue849qsq"
  description      = var.lambda_description
  handler          = var.lambda_handler
  memory_size      = var.lambda_memory_size
  s3_bucket        = "my-test-bucket-lambda-sqs-alex333"
  s3_key           = "lambda.zip"
  runtime          = var.lambda_runtime
  timeout          = var.lambda_timeout
}

#Lambda SQS Trigger
resource "aws_lambda_event_source_mapping" "lambda_test_sqs_trigger" {
  event_source_arn = data.aws_sqs_queue.lambda_sqs_queue.arn
  function_name    = aws_lambda_function.lambda_alex.arn
  depends_on       = [aws_sqs_queue.test-sqs]

}

