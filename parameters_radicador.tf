resource "aws_ssm_parameter" "apiUrlRadicadorIA" {
  name        = "/${var.layer_rad}/ms/${var.stack_id}/apiUrlRadicadorIA"
  description = "apiUrlRadicadorIA"
  type        = "String"
  value       = var.apiUrlRadicadorIA
}

resource "aws_ssm_parameter" "apiUrlCataloge" {
  name        = "/${var.layer_rad}/ms/${var.stack_id}/apiUrlCataloge"
  description = "apiUrlCataloge"
  type        = "String"
  value       = var.apiUrlCataloge
}

resource "aws_ssm_parameter" "headerCataloge" {
  name        = "/${var.layer_rad}/ms/${var.stack_id}/headerCataloge"
  description = "headerCataloge"
  type        = "String"
  value       = var.headerCataloge
}

resource "aws_ssm_parameter" "headerOrchestrator" {
  name        = "/${var.layer_rad}/ms/${var.stack_id}/headerOrchestrator"
  description = "headerOrchestrator"
  type        = "String"
  value       = var.headerOrchestrator
}