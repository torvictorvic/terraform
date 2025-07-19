module "cognito_modificaciones_automaticas" {
  source = "git::https://github.com/xxxxxxxxxxxx/library-infra.git//modules/security/cognito?ref=v2.6.12"
  name = var.name_ma
  tags = var.tags_ma
  clients = var.clients
  string_schemas = var.string_schemas
  generate_secret = var.generate_secret
  resources = [
    {
      name       = "${var.layer_ma}-${var.stack_id}-control-acceso"
      identifier = "${var.layer_ma}-${var.stack_id}-control-acceso"
      scopes = [
        {
          scope_name        = "conexion-xxxxxx"
          scope_description = "Ambito para la conexión con el LDAP"
        }
      ]
    }
  ]
}

output "cognito_arn" { value = module.cognito_modificaciones_automaticas.cognito_arn }