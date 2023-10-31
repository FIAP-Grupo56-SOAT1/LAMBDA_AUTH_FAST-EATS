output "lambdas" {
  value = [{
    arn           = aws_lambda_function.lambda_authorizer.arn
    name          = aws_lambda_function.lambda_authorizer.function_name
    description   = aws_lambda_function.lambda_authorizer.description
    version       = aws_lambda_function.lambda_authorizer.version
    last_modified = aws_lambda_function.lambda_authorizer.last_modified
  }]
}
