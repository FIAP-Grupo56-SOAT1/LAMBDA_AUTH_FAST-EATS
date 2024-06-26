locals {
  lambda_payload_filename = "../app/target/${var.lambda_function_name}-${var.version_lambda}.jar"
}

resource "aws_cloudwatch_log_group" "lambda_log_group" {
  name              = "/aws/lambda/${aws_lambda_function.lambda_authorizer.function_name}"
  retention_in_days = 1
  lifecycle {
    prevent_destroy = false
  }
}

resource "aws_lambda_function" "lambda_authorizer" {
  function_name = var.lambda_function_name
  handler       = var.lambda_handler
  description   = var.description
  role          = var.lab_role_arn #aws_iam_role.lambda_sts_lambda.arn (adicionado devedo restricoes lab aws academy)
  runtime       = var.lambda_runtime
  filename         = local.lambda_payload_filename
  source_code_hash = base64sha256(filebase64(local.lambda_payload_filename))

  timeout     = var.timeout
  memory_size = var.lambda_memory

  environment {
    variables = {
      USER_POOL_ID : jsondecode(data.aws_secretsmanager_secret_version.credentials_sts.secret_string)["userPoolId"]
    }
  }

}

#obteando dados do secret manager STS
data "aws_secretsmanager_secret" "sts" {
  name = "prod/soat1grupo56/Sts"
}

data "aws_secretsmanager_secret_version" "credentials_sts" {
  secret_id = data.aws_secretsmanager_secret.sts.id
}
