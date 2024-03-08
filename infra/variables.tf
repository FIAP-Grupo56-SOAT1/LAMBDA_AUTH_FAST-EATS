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

######### OBS: a execution role acima foi trocada por LabRole devido a restricoes de permissao na conta da AWS Academy ########
variable "lab_role_arn" {
  type    = string
  default = "arn:aws:iam::730335661438:role/LabRole" #aws_iam_role.ecsTaskExecutionRole.arn
}


