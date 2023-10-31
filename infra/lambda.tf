locals {
  lambda_payload_filename = "../app/target/${var.lambda_function_name}-${var.version_lambda}.jar"
}

resource "aws_lambda_function" "lambda_authorizer" {
  function_name = var.lambda_function_name
  handler       = var.lambda_handler
  description   = var.description
  role          = aws_iam_role.lambda_authorizer_lambda.arn
  runtime       = var.lambda_runtime

  filename         = local.lambda_payload_filename
  source_code_hash = base64sha256(filebase64(local.lambda_payload_filename))

  timeout     = var.timeout
  memory_size = var.lambda_memory

}
