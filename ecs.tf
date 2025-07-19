module "ecs_cluster" {
  source                = "git::https://github.com/xxxxxxxxxxxx/library-infra.git//modules/compute/ecs?ref=v2.6.27"
  name                  = var.name
  stack_id              = var.stack_id
  layer                 = var.layer
  tags                  = var.tags
  region                = var.region
  containers            = var.containers
  tg_names              = var.tg_names
  create_listener_https = var.create_listener_https
  s3_certs              = var.s3_certs
  http_rules            = var.http_rules
  ingress_rule          = var.ingress_rule
  vpc_id                = module.network.vpc_id
  subnets               = setunion(module.network.private_subnet_cidr_block, module.network.public_subnet_cidr_block)
  private_subnet_ids    = module.network.private_subnet_ids
  schedule_enable       = var.schedule_enable
}
