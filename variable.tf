variable "stack_id" {
  description = "Nombre del ambiente"
  type        = string
  default     = ""
}

variable "stack_id2" {
  description = "Nombre del ambiente por el caso stg"
  type        = string
  default     = ""
}

variable "layer" {
  description = "Nombre del proyecto"
  type        = string
  default     = ""
}

variable "name" {
  description = "Nombre del proyecto"
  type        = string
  default     = ""
}

variable "type" {
  description = "Tipo del recurso, infra, frontend, movil, backend"
  type        = string
  default     = ""
}

variable "component_name" {
  description = "Nombre del componente"
  type        = string
  default     = ""
}

variable "region" {
  default = "us-east-1"
}

variable "tags" {
  description = "Etiquetas para identificar los recursos del proyecto"
  type        = map(any)
  default     = {}
}

variable "limit_amount" {
  description = "Monto limite. Budget"
  type        = string
  default     = ""
}

variable "period_start" {
  description = "Periodo de inicio. Budget"
  type        = string
  default     = ""
}

variable "perc_limit_notify" {
  description = "Porcentaje de presupuesto alcanzado para notificar. Budgets"
  type        = string
  default     = ""
}

variable "emails" {
  description = "Emails de notificacion. Budgets"
  type        = list(any)
  default     = []
}

variable "vpc_cidr" {
  description = "CIDR VPC. Rango de IPs asignadas"
  type        = string
  default     = ""
}

variable "azs" {
  description = "Zonas de disponibilidad"
  type        = list(any)
  default     = []
}

variable "private_subnets" {
  description = "IPs privadas"
  type        = list(any)
  default     = []
}

variable "public_subnets" {
  description = "IPs publicas"
  type        = list(any)
  default     = []
}

variable "transit_gateway_id" {
  description = "Identificador de transit gateway"
  type        = string
  default     = ""
}

variable "visibility_config_waf" {
  description = "Configuracion de visibilidad del WAF"
  type        = map(any)
  default     = {}
}

variable "parameters" {
  description = "Parametros de la plataforma"
  type        = list(any)
  default     = []
}

variable "parameters_ops" {
  description = "Parametros gestionados por operaciones y Terraform"
  type        = list(any)
  default     = []
}

variable "visibility_config_waf_api" {
  description = "Configuracion de visibilidad del WAF para el apiwategay"
  type        = map(any)
  default     = {}
}

variable "tg_names" {
  description = "tg_names"
  type        = list(any)
  default     = []
}

variable "containers" {
  description = "containers"
  type        = list(any)
  default     = []
}

variable "create_listener_https" {
  type    = bool
  default = false
}

variable "http_rules" {
  description = "http_rules"
  type        = list(any)
  default     = []
}

variable "ingress_rule" {
  description = "ingress_rule"
  type        = list(any)
  default     = []
}

variable "s3_certs" {
  description = "s3_certs"
  type        = string
  default     = "terraform-cert-acm-bolivar"
}

variable "website_enabled" {
  type    = bool
  default = true
}

variable "acm_certificate_arn" {
  type    = string
  default = ""
}

variable "default_custom_policy_lambdas_private" {
  description = "Acciones por defecto para las lambdas (conexión) que se usa en una vpc"
  type        = list(any)
  default = [
    {
      name = "connections-policy"
      policy = {
        "Version" : "2012-10-17",
        "Statement" : [
          {
            "Effect" : "Allow",
            "Action" : [
              "lambda:InvokeFunction",
              "execute-api:Invoke",
              "execute-api:ManageConnections",
              "ec2:DescribeNetworkInterfaces",
              "ec2:CreateNetworkInterface",
              "ec2:DeleteNetworkInterface",
              "ec2:DescribeInstances",
              "ec2:AttachNetworkInterface",
              "logs:CreateLogGroup",
              "logs:CreateLogStream",
              "logs:DescribeLogGroups",
              "logs:DescribeLogStreams",
              "logs:PutLogEvents",
              "logs:GetLogEvents",
              "logs:FilterLogEvents",
              "ssm:GetParametersByPath",
              "ssm:GetParameters",
              "ssm:GetParameter",
              "kms:*"
            ],
            "Resource" : "*"
          }
        ]
      }
    }
  ]
}

variable "memory_size_lambda" {
  description = "memory size lambda"
  type        = string
  default     = ""
}

#Cognito
variable "callback_urls" {
  description = "callback urls"
  type        = list(any)
  default     = []
}

variable "logout_urls" {
  description = "logout urls"
  type        = list(any)
  default     = []
}

variable "cognito_access_control_identity_provider_metadata_file" {
  description = "cognito access control identity provider metadata file"
  type        = string
  default     = ""
}
variable "cognito_attribute_mapping" {
  description = "cognito_attribute_mapping"
  type        = list(any)
  default     = []
}

variable "aliases_cloudfront" {
  description = "aliases cloudfront"
  type        = list(any)
  default     = []
}

#VARIABLES INDEMNIZACIONES

variable "layer2" {
  description = "Nombre del proyecto"
  type        = string
  default     = ""
}

variable "name2" {
  description = "Nombre del proyecto"
  type        = string
  default     = ""
}

variable "tags2" {
  description = "Etiquetas para identificar los recursos del proyecto"
  type        = map(any)
  default     = {}
}

#Varibles base de datos
variable "engine" { default = "" }
variable "engine_version" { default = "" }
variable "family" { default = "" }
variable "major_engine_version" { default = "" }
variable "instance_class" { default = "" }
variable "allocated_storage" { default = "" }
variable "port" { default = "" }
variable "storage_encrypted" { default = "" }
variable "database_name" { default = "" }
variable "username" { default = "" }
variable "create_random_password" { default = "" }
variable "random_password_length" { default = "" }
variable "multi_az" { default = "" }
variable "maintenance_window" { default = "" }
variable "backup_window" { default = "" }
variable "enabled_cloudwatch_logs_exports" { default = "" }
variable "backup_retention_period" { default = "" }
variable "allowed_cidr_blocks" { default = "" }
variable "skip_final_snapshot" { default = "" }
variable "deletion_protection" { default = "" }
variable "username_db" { default = "" }
variable "password_db" { default = "" }

variable "aliases_indemnizaciones" {
  type = any
  default = ["indemnizaciones"]
}
variable "layer_indemnizaciones" {
  default = "indemnizaciones"
}
variable "tags_indemnizaciones" {
  default = null
}
variable "publicly_accessible" {
  type        = bool
  description = "Base de datos publica"
  default     = false
}

variable "apply_immediately" {
  type        = bool
  description = "Especifica si las modificaciones de la base de datos se aplican inmediatamente o durante la próxima ventana de mantenimiento"
  default     = false
}

variable "tg_names2" {
  description = "tg_names"
  type        = list(any)
  default     = []
}

variable "containers2" {
  description = "containers"
  type        = list(any)
  default     = []
}

variable "http_rules2" {
  description = "http_rules"
  type        = list(any)
  default     = []
}

variable "ingress_rules_api" {
  description = "Ingres rules for security group in apigateway"
  type        = list(object({ from_port = string, to_port = string, protocol = string, cidr_blocks = list(string) }))
  default = [{
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }]
}

variable "lb_arn_net" {
  description = "Nombre del proyecto"
  type        = string
  default     = ""
}

variable "parameters2" {
  description = "Parametros de la plataforma"
  type        = list(any)
  default     = []
}

variable "parameters_ops2" {
  description = "Parametros gestionados por operaciones y Terraform"
  type        = list(any)
  default     = []
}

variable "account_id" {
  description = "ID De la cuenta"
  type        = string
  default     = ""
}

variable "account_id_transversalesia" {
  description = "ID De la cuenta transversales ia"
  type        = string
  default     = ""
}

variable "account_id_do_seguros" {
  description = "ID De la cuenta account_id_do_seguros"
  type        = string
  default     = ""
}

variable "apiUrlRadicadorIA" {
  description = "apiUrlRadicadorIA"
  type = string
  default = ""
}
variable "apiUrlCataloge" {
  description = "apiUrlCataloge"
  type = string
  default = ""
}
variable "headerCataloge" {
  description = "headerCataloge"
  type = string
  default = ""
}
variable "headerOrchestrator" {
  description = "headerOrchestrator"
  type = string
  default = ""
}

variable "name3" {
  description = "Nombre completo del proyecto"
  type        = string
  default     = ""
}

#VARIABLES MODIFICACIONES AUTOMATICAS
variable "name_ma" {
  description = "Nombre del proyecto"
  type        = string
  default     = ""
}

variable "layer_ma" {
  description = "Nombre del proyecto"
  type        = string
  default     = ""
}

variable "tags_ma" {
  description = "Etiquetas para identificar los recursos del proyecto"
  type        = map(any)
  default     = {}
}

variable "containers_ma" {
  description = "containers"
  type        = list(any)
  default     = []
}

variable "tg_names_ma" {
  description = "tg_names"
  type        = list(any)
  default     = []
}

variable "http_rules_ma" {
  description = "http_rules"
  type        = list(any)
  default     = []
}

variable "ingress_rule_ma" {
  description = "ingress_rule"
  type        = list(any)
  default     = []
}

#PARAMETER STORE
variable "key_correo" {
  description = "Key correo"
  type        = string
  default     = ""
}

variable "url_correo" {
  description = "URL correo"
  type        = string
  default     = ""
}

variable "headers_correo" {
  description = "Headers correo"
  type        = string
  default     = ""
}

variable "key_otp" {
  description = "Key código OTP"
  type        = string
  default     = ""
}

variable "url_otp" {
  description = "URL código OTP"
  type        = string
  default     = ""
}

variable "headers_otp" {
  description = "Headers código OTP"
  type        = string
  default     = ""
}

variable "key_validation_otp" {
  description = "Key Validation código OTP"
  type        = string
  default     = ""
}

variable "url_validation_otp" {
  description = "URL Validation código OTP"
  type        = string
  default     = ""
}

variable "key_polizas_mundos" {
  description = "Key zzz eee"
  type        = string
  default     = ""
}

variable "url_polizas_mundos" {
  description = "URL zzz eee"
  type        = string
  default     = ""
}

variable "headers_polizas_mundos" {
  description = "Headers zzz eee"
  type        = string
  default     = ""
}

variable "key_azure" {
  description = "Key azure"
  type        = string
  default     = ""
}

variable "url_azure" {
  description = "URL azure"
  type        = string
  default     = ""
}

variable "headers_azure" {
  description = "Headers azure"
  type        = string
  default     = ""
}

# variable "openai_api_key" {
#   description = "Api key Open AI"
#   type        = string
# }

variable "docs_url" {
  description = "docs_url"
  type        = string
  default     = ""
}

variable "redoc_url" {
  description = "redoc_url"
  type        = string
  default     = ""
}

variable "endpoint_popeye" {
  description = "endpoint_popeye"
  type        = string
  default     = ""
}

variable "url_sheets" {
  description = "url_sheets"
  type        = string
}

variable "url_sheets_cne" {
  description = "url_sheets_cne"
  type        = string
}

variable "layer_rad" {
  description = "Nombre del proyecto"
  type        = string
  default     = ""
}

variable "name_rad" {
  description = "Nombre del proyecto"
  type        = string
  default     = ""
}

variable "tags_rad" {
  description = "Etiquetas para identificar los recursos del proyecto"
  type        = map(any)
  default     = {}
}

variable "containers_rad" {
  description = "containers"
  type        = list(any)
  default     = []
}

variable "tg_names_rad" {
  description = "tg_names"
  type        = list(any)
  default     = []
}

variable "http_rules_rad" {
  description = "http_rules"
  type        = list(any)
  default     = []
}

variable "parameters_rad" {
  description = "Parametros de la plataforma"
  type        = list(any)
  default     = []
}

variable "parameters_ops_rad" {
  description = "Parametros gestionados por operaciones y Terraform"
  type        = list(any)
  default     = []
}

variable "binary_media_types" {
  description = "binary media types"
  type        = list(string)
  default     = ["multipart/form-data","application/pdf"]
}

#COGNITO
variable "clients" { default = "" }
variable "string_schemas" { default = "" }
variable "generate_secret" { default = "" }

#SCHEDULER ECS
variable "schedule_enable" { 
  type = bool
  default = false 
}