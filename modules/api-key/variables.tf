
variable "name_api" {
  description = "Nombre del ambiente"
  type        = string
  default = ""
}

variable "aws_api_gateway_rest_api" {
  description = "Identificador del API Gateway"
  type        = string
  default = ""
}

variable "aws_api_gateway_stage" {
  description = "Nombre del stage creado para el API Gateway"
  type        = string
  default = ""
}