variable "aws_region" {
  type    = string
  default = "us-east-1"
}

variable "lambda_function_name" {
  description = "LAMBDA Function name"
  type        = string
  default     = "lambda_authorizer"
}

variable "lambda_memory" {
  description = "Lambda max memory size"
  type        = number
  default     = 512
}

variable "lambda_runtime" {
  description = "Lambda runtime"
  type        = string
  default     = "java17"
}

variable "lambda_handler" {
  description = "Lambda handler"
  type        = string
  default     = "br.com.fiap.lanchonete.handler.LambdaAuthorizer::handleRequest"
}

variable "timeout" {
  description = "code version"
  type        = number
  default     = 5
}

variable "description" {
  description = "Descrição do lambda"
  type        = string
  default     = "lambda para autorização de token - fiap56"
}

variable "version_lambda" {
  description = "code version"
  type        = string
  default     = "1.0.0"
}

variable "user_pool_id" {
  description = "user_pool_id"
  type        = string
  default     = "us-east-1_l3fytM5Hz"
}


