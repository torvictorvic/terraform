module "ecs_cluster_mod_automaticas" {
  source             = "./modules/compute/ecs"
  name               = var.name_ma
  stack_id           = var.stack_id
  layer              = var.layer_ma
  tags               = var.tags_ma
  region             = var.region
  vpc_id             = module.network.vpc_id
  subnets            = setunion(module.network.private_subnet_cidr_block, module.network.public_subnet_cidr_block)
  private_subnet_ids = module.network.private_subnet_ids
  ingress_rule       = var.ingress_rule_ma
  tg_names           = var.tg_names_ma
  http_rules         = var.http_rules_ma
  containers         = var.containers_ma
  lb_dns_name        = module.ecs_cluster.lb_dns_name
  sg_id              = module.ecs_cluster.sg_id
  lb_listener_arn    = module.ecs_cluster.lb_listener_arn
  ecs_cluster_id     = module.ecs_cluster.cluster_id
  ecs_cluster_name   = "${var.layer}-${var.stack_id}-ecs-cluster"
  extra_template_variables = {
    "profile" : var.stack_id,
    "account_id" : var.account_id,
    "layer" : var.layer_ma
  }

  depends_on      = [module.network, module.ecs_cluster]
  schedule_enable = var.schedule_enable
}
