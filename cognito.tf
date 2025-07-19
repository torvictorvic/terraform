 /*
 ** Description: Configuring Cognito with IDP SAML Federation
 */

 module "cognito" {
   source = "git::https://github.com/xxxxxxxxxxxx/library-infra.git//modules/security/cognito?ref=v2.6.5"
   name   = var.name
   tags   = var.tags
   clients = [
     {
       name                         = "${var.layer}-${var.stack_id}-control-acceso"
       supported_identity_providers = ["${var.layer}-${var.stack_id}-idp"]
       allowed_oauth_flows          = ["code"]
       access_token_validity        = 24
       id_token_validity            = 24
       token_validity_units = {
         "access_token" : "hours",
         "id_token" : "hours"
       }
       //allowed_oauth_scopes = ["email", "openid"]
       allowed_oauth_scopes = ["email", "openid", "profile", "${var.layer}-${var.stack_id}-control-acceso/conexion-ldap"]
       callback_urls        = var.callback_urls
       logout_urls          = var.logout_urls
       explicit_auth_flows  = ["ALLOW_REFRESH_TOKEN_AUTH"]
     }
   ]
   resources = [
     {
       name       = "${var.layer}-${var.stack_id}-control-acceso"
       identifier = "${var.layer}-${var.stack_id}-control-acceso"
       scopes = [
         {
           scope_name        = "conexion-ldap"
           scope_description = "Ambito para la conexión con el LDAP"
         }
       ]
     }
   ]
   identity_providers = [
     {
       provider_name = "${var.layer}-${var.stack_id}-idp"
       provider_type = "SAML"
       provider_details = {
         MetadataFile = "${file(var.cognito_access_control_identity_provider_metadata_file)}"
         IDPSignout   = true
       }
       attribute_mapping = {
         email                         = var.cognito_attribute_mapping[0]
         name                          = var.cognito_attribute_mapping[1]
         "custom:identificationType"   = var.cognito_attribute_mapping[2]
         "custom:identificationNumber" = var.cognito_attribute_mapping[3]
         "custom:workforceID"          = var.cognito_attribute_mapping[4]
         "custom:loginTime"            = var.cognito_attribute_mapping[5]
       }
     }
   ]

   string_schemas = [
    {
      attribute_data_type      = "String"
      developer_only_attribute = false
      mutable                  = true
      name                     = "identificationType"
      required                 = false

      string_attribute_constraints = {
        min_length = 1
        max_length = 5
      }
    },
    {
      attribute_data_type      = "String"
      developer_only_attribute = false
      mutable                  = true
      name                     = "identificationNumber"
      required                 = false

      string_attribute_constraints = {
        min_length = 1
        max_length = 25
      }
    },
    {
      attribute_data_type      = "String"
      developer_only_attribute = false
      mutable                  = true
      name                     = "workforceID"
      required                 = false

      string_attribute_constraints = {
        min_length = 1
        max_length = 10
      }
    },
    {
      attribute_data_type      = "String"
      developer_only_attribute = false
      mutable                  = true
      name                     = "loginTime"
      required                 = false

      string_attribute_constraints = {
        min_length = 1
        max_length = 20
      }
    }
  ]
 }