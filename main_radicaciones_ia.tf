//CLUSTER

  module "ecs_cluster_radicaciones_ia" {
  //source                = "git::https://github.com/xxxxxxxxxxxx/library-infra.git//modules/compute/ecs?ref=v2.6.6"
  source             = "./modules/compute/ecs"
  name                  = "${var.name_rad}"
  stack_id              = var.stack_id
  layer                 = var.layer_rad
  tags                  = var.tags_rad
  region                = var.region
  vpc_id                = module.network.vpc_id
  subnets               = setunion(module.network.private_subnet_cidr_block, module.network.public_subnet_cidr_block)
  private_subnet_ids    = module.network.private_subnet_ids
  ingress_rule          = var.ingress_rule
  tg_names              = var.tg_names_rad
  http_rules            = var.http_rules_rad
  containers            = var.containers_rad
  lb_dns_name           = module.ecs_cluster.lb_dns_name
  sg_id                 = module.ecs_cluster.sg_id
  lb_listener_arn       = module.ecs_cluster.lb_listener_arn
  ecs_cluster_id        = module.ecs_cluster.cluster_id
  ecs_cluster_name      = "${var.layer}-${var.stack_id}-ecs-cluster"
  extra_template_variables = local.extra_template_variables2
  
  depends_on = [module.network, module.ecs_cluster]
}

//API GATEWAY

module "api_gateway_radicaciones_ia"{
  source = "git::https://github.com/xxxxxxxxxxxx/library-infra.git//modules/compute/api_gateway?ref=v2.6.11"
  name        = "${var.layer_rad}-${var.stack_id}"
  stack_id    = var.stack_id
  layer       = var.layer_rad
  tags        = var.tags_rad
  vpc_id      = module.network.vpc_id
  private_ids = module.network.private_subnet_ids
  alb_dns_name = module.ecs_cluster.lb_dns_name
  stage_name  = var.stack_id
  certificate_arn = module.ecs_cluster.certificate_arn
  binary_media_types = var.binary_media_types
 }

  resource "aws_api_gateway_usage_plan" "plan_radicaciones" {
   name = "${var.layer_rad}-${var.stack_id}-usage-plan"
   api_stages {
     api_id = module.api_gateway_radicaciones_ia.aws_api_gateway_rest_api
     stage  = var.stack_id
   }
 }

 resource "aws_api_gateway_api_key" "key_gateway_radicaciones" {
   name = "${var.name_rad}-api-key"
 }

 resource "aws_api_gateway_usage_plan_key" "plan_key_radicaciones" {
   key_id        = aws_api_gateway_api_key.key_gateway_radicaciones.id
   key_type      = "API_KEY"
   usage_plan_id = aws_api_gateway_usage_plan.plan_radicaciones.id
 }


module "s3_bucket_casos_bizagi" {
  source = "git::https://github.com/xxxxxxxxxxxx/library-infra.git//modules/s3?ref=v2.0.0"

  name = "casos-bizagi-${var.stack_id}"
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
                "AWS": "arn:aws:iam::${var.account_id_transversalesia}:role/zransqazwsx-${var.stack_id}-ecs-service-taskrole-fargate"
            },
            "Action": [
                "s3:PutObject",
                "s3:GetObject",
                "s3:DeleteObject",
                "s3:ListBucket"
            ],
            "Resource": [
                "arn:aws:s3:::casos-bizagi-${var.stack_id}/*",
                "arn:aws:s3:::casos-bizagi-${var.stack_id}"
            ]
        }
    ]
  })
}


