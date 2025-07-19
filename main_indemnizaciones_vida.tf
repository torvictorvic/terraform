//CLUSTER

  module "ecs_cluster_indemnizaciones" {
  //source                = "git::https://github.com/xxxxxxxxxxxx/library-infra.git//modules/compute/ecs?ref=v2.6.6"
  source             = "./modules/compute/ecs"
  name                  = "${var.name2}"
  stack_id              = var.stack_id
  layer                 = var.layer2
  tags                  = var.tags2
  region                = var.region
  vpc_id                = module.network.vpc_id
  subnets               = setunion(module.network.private_subnet_cidr_block, module.network.public_subnet_cidr_block)
  private_subnet_ids    = module.network.private_subnet_ids
  ingress_rule          = var.ingress_rule
  tg_names              = var.tg_names2
  http_rules            = var.http_rules2
  containers            = var.containers2
  lb_dns_name           = module.ecs_cluster.lb_dns_name
  sg_id                 = module.ecs_cluster.sg_id
  lb_listener_arn       = module.ecs_cluster.lb_listener_arn
  ecs_cluster_id        = module.ecs_cluster.cluster_id
  ecs_cluster_name      = "${var.layer}-${var.stack_id}-ecs-cluster"
  extra_template_variables = local.extra_template_variables
  
  depends_on = [module.network, module.ecs_cluster]
}

//API GATEWAY

module "api_gateway_indemnizaciones"{
  //source = "git::https://github.com/xxxxxxxxxxxx/library-infra.git//modules/compute/api_gateway?ref=v2.0.2"
  source             = "./modules/compute/api_gateway"
  name        = "${var.layer2}-${var.stack_id}"
  stack_id    = var.stack_id
  layer       = var.layer2
  tags        = var.tags2
  vpc_id      = module.network.vpc_id
  private_ids = module.network.private_subnet_ids
  alb_dns_name = module.ecs_cluster.lb_dns_name
  stage_name  = var.stack_id
  endpoint_configuration_type = "REGIONAL" 
  //endpoint_configuration_type = local.is_dev ? "REGIONAL" : "PRIVATE" 
  ingress_rules_api = var.ingress_rules_api
  lb_arn_net  = var.lb_arn_net
 }


//COGNITO
module "s3_bucket_app_indemnizaciones_vida" {
  source = "git::https://github.com/xxxxxxxxxxxx/library-infra.git//modules/s3?ref=v2.0.0"

  name = "${var.layer2}-${var.stack_id}-store"
  acl  = "private"
  tags = var.tags2
  attach_policy           = true
  policy                  = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "",
            "Effect": "Allow",
            "Principal": {
                "AWS": "arn:aws:iam::${var.account_id_do_seguros}:role/do-qazwsx-${var.stack_id2}-cef-accesoglue-iam-rol"
            },
            "Action": [
                "s3:PutObject",
                "s3:GetObject",
                "s3:DeleteObject",
                "s3:ListBucket"
            ],
            "Resource": [
                "arn:aws:s3:::${var.layer2}-${var.stack_id}-store/*",
                "arn:aws:s3:::${var.layer2}-${var.stack_id}-store"
            ]
        }
    ]
  })
}