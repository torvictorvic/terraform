/*
** Description: API gateway automatic modifications
*/
module "api_gateway_xxx_xxx" {
  source = "git::https://github.com/xxxxxxxxxxxx/library-infra.git//modules/compute/api_gateway?ref=v2.4.3"
  name            = var.name_ma
  stack_id        = var.stack_id
  layer           = var.layer_ma
  tags            = var.tags_ma
  private_ids     = module.network.private_subnet_ids
  vpc_id          = module.network.vpc_id
  stage_name      = var.stack_id
  alb_dns_name    = module.ecs_cluster.lb_dns_name
  certificate_arn = module.ecs_cluster.certificate_arn

  depends_on = [
    module.ecs_cluster,
    module.network
  ]
}

resource "aws_api_gateway_authorizer" "autorCognito" {
  name          = "Back-To-Back-AutorizerCognito-${var.stack_id}"
  type          = "COGNITO_USER_POOLS"
  rest_api_id   = module.api_gateway_xxx_xxx.aws_api_gateway_rest_api
  provider_arns = [module.cognito_modificaciones_automaticas.cognito_arn]

  depends_on = [
    module.api_gateway_xxx_xxx,
    module.cognito_modificaciones_automaticas
  ]
}