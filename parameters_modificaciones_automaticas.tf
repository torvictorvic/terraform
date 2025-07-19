resource "aws_ssm_parameter" "key_correo" {
  name        = "/${var.layer_ma}/ms/${var.stack_id}/key_correo"
  description = "Api key correo"
  type        = "String"
  value       = var.key_correo
}

resource "aws_ssm_parameter" "url_correo" {
  name        = "/${var.layer_ma}/ms/${var.stack_id}/url_correo"
  description = "URL correo"
  type        = "String"
  value       = var.url_correo
}

resource "aws_ssm_parameter" "headers_correo" {
  name        = "/${var.layer_ma}/ms/${var.stack_id}/headers_correo"
  description = "URL correo"
  type        = "String"
  value       = var.headers_correo
}

resource "aws_ssm_parameter" "key_otp" {
  name        = "/${var.layer_ma}/ms/${var.stack_id}/key_otp"
  description = "Key código OTP"
  type        = "String"
  value       = var.key_otp
}

resource "aws_ssm_parameter" "url_otp" {
  name        = "/${var.layer_ma}/ms/${var.stack_id}/url_otp"
  description = "URL código OTP"
  type        = "String"
  value       = var.url_otp
}

resource "aws_ssm_parameter" "headers_otp" {
  name        = "/${var.layer_ma}/ms/${var.stack_id}/headers_otp"
  description = "Headers código OTP"
  type        = "String"
  value       = var.headers_otp
}

resource "aws_ssm_parameter" "key_validation_otp" {
  name        = "/${var.layer_ma}/ms/${var.stack_id}/key_validation_otp"
  description = "Key Validation código OTP"
  type        = "String"
  value       = var.key_validation_otp
}

resource "aws_ssm_parameter" "url_validation_otp" {
  name        = "/${var.layer_ma}/ms/${var.stack_id}/url_validation_otp"
  description = "URL Validation código OTP"
  type        = "String"
  value       = var.url_validation_otp
}

resource "aws_ssm_parameter" "key_polizas_mundos" {
  name        = "/${var.layer_ma}/ms/${var.stack_id}/key_polizas_mundos"
  description = "Key zzz eee"
  type        = "String"
  value       = var.key_polizas_mundos
}

resource "aws_ssm_parameter" "url_polizas_mundos" {
  name        = "/${var.layer_ma}/ms/${var.stack_id}/url_polizas_mundos"
  description = "URL zzz eee"
  type        = "String"
  value       = var.url_polizas_mundos
}

resource "aws_ssm_parameter" "headers_polizas_mundos" {
  name        = "/${var.layer_ma}/ms/${var.stack_id}/headers_polizas_mundos"
  description = "Headers zzz eee"
  type        = "String"
  value       = var.headers_polizas_mundos
}

resource "aws_ssm_parameter" "key_azure" {
  name        = "/${var.layer_ma}/ms/${var.stack_id}/key_azure"
  description = "Key azure"
  type        = "String"
  value       = var.key_azure
}

resource "aws_ssm_parameter" "url_azure" {
  name        = "/${var.layer_ma}/ms/${var.stack_id}/url_azure"
  description = "URL azure"
  type        = "String"
  value       = var.url_azure
}

resource "aws_ssm_parameter" "headers_azure" {
  name        = "/${var.layer_ma}/ms/${var.stack_id}/headers_azure"
  description = "Headers azure"
  type        = "String"
  value       = var.headers_azure
}


resource "aws_ssm_parameter" "docs_url" {
  name        = "/${var.layer_ma}/ms/${var.stack_id}/docs_url"
  description = "Docs url"
  type        = "String"
  value       = var.docs_url
}

resource "aws_ssm_parameter" "redoc_url" {
  name        = "/${var.layer_ma}/ms/${var.stack_id}/redoc_url"
  description = "Redoc url"
  type        = "String"
  value       = var.redoc_url
}

resource "aws_ssm_parameter" "port_db" {
  name        = "/${var.layer_ma}/bd/${var.stack_id}/port-db"
  description = "Puerto de la base de datos"
  type        = "String"
  value       = ""
}

resource "aws_ssm_parameter" "schema_popeye" {
  name        = "/${var.layer_ma}/bd/${var.stack_id}/schema"
  description = "Esquema de la base de datos"
  type        = "String"
  value       = ""
}

resource "aws_ssm_parameter" "endpoint" {
  name        = "/${var.layer_ma}/bd/${var.stack_id}/endpoint_popeye"
  description = "Esquema de la base de datos"
  type        = "String"
  value       = var.endpoint_popeye
}


resource "aws_ssm_parameter" "env" {
  name        = "/${var.layer_ma}/ms/${var.stack_id}/env"
  description = "Environment"
  type        = "String"
  value       = var.stack_id
}

resource "aws_ssm_parameter" "database_name" {
  name        = "/${var.layer_ma}/bd/${var.stack_id}/database_name"
  description = "Nombre base de datos"
  type        = "String"
  value       = ""
}

resource "aws_ssm_parameter" "service_account" {
  name        = "/${var.layer_ma}/ms/${var.stack_id}/service_account"
  description = "Tipo de cuenta Google Sheets"
  type        = "String"
  value       = "service_account"
}

resource "aws_ssm_parameter" "project_id" {
  name        = "/${var.layer_ma}/ms/${var.stack_id}/project_id"
  description = "Id proyecto Google Sheets"
  type        = "String"
  value       = "bidashboards"
}

resource "aws_ssm_parameter" "private_key_id" {
  name        = "/${var.layer_ma}/ms/${var.stack_id}/private_key_id"
  description = "Private key -"
  type        = "String"
  value       = ""
}

resource "aws_ssm_parameter" "private_key" {
  name        = "/${var.layer_ma}/ms/${var.stack_id}/private_key"
  description = "Private key -"
  type        = "String"
  value       = ""
}

resource "aws_ssm_parameter" "client_id" {
  name        = "/${var.layer_ma}/ms/${var.stack_id}/client_id"
  description = "Id cliente proyecto Google Sheets"
  type        = "String"
  value       = ""
}

resource "aws_ssm_parameter" "client_email" {
  name        = "/${var.layer_ma}/ms/${var.stack_id}/client_email"
  description = "Email p-----"
  type        = "String"
  value       = ""
}

resource "aws_ssm_parameter" "auth_uri" {
  name        = "/${var.layer_ma}/ms/${var.stack_id}/auth_uri"
  description = "Uri autorizacion Google Sheets"
  type        = "String"
  value       = ""
}

resource "aws_ssm_parameter" "token_uri" {
  name        = "/${var.layer_ma}/ms/${var.stack_id}/token_uri"
  description = "Uri token Google Sheets"
  type        = "String"
  value       = ""
}

resource "aws_ssm_parameter" "auth_provider_x509_cert_url" {
  name        = "/${var.layer_ma}/ms/${var.stack_id}/auth_provider_x509_cert_url"
  description = "Autenticacion provider Google Sheets"
  type        = "String"
  value       = ""
}

resource "aws_ssm_parameter" "client_x509_cert_url" {
  name        = "/${var.layer_ma}/ms/${var.stack_id}/client_x509_cert_url"
  description = "Url Cliente provider Google Sheets"
  type        = "String"
  value       = ""
}

resource "aws_ssm_parameter" "universe_domain" {
  name        = "/${var.layer_ma}/ms/${var.stack_id}/universe_domain"
  description = "Domain APIs Google Sheets"
  type        = "String"
  value       = ""
}

resource "aws_ssm_parameter" "url_sheets" {
  name        = "/${var.layer_ma}/ms/${var.stack_id}/url_sheets"
  description = "Url acceso Google Sheets"
  type        = "String"
  value       = var.url_sheets
}

resource "aws_ssm_parameter" "url_sheets_cne" {
  name        = "/${var.layer_ma}/ms/${var.stack_id}/url_sheets_cne"
  description = "Url acceso Google Sheets error"
  type        = "String"
  value       = var.url_sheets_cne
}

