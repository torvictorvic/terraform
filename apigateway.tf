 /*
 ** Description: Main API gateway
 */
 module "api_gateway" {
   source = "git::https://github.com/xxxxxxxxxxxx/library-infra.git//modules/compute/api_gateway?ref=v2.6.11"
   name            = var.name
   stack_id        = var.stack_id
   layer           = var.layer
   tags            = var.tags
   private_ids     = module.network.private_subnet_ids
   vpc_id          = module.network.vpc_id
   stage_name      = var.stack_id
   alb_dns_name    = module.ecs_cluster.lb_dns_name
   certificate_arn = module.ecs_cluster.certificate_arn
   binary_media_types = var.binary_media_types
 }

 /*
 ** Description: Usage plan and key for the API gateway
 */
 resource "aws_api_gateway_usage_plan" "plan_modificaciones_colectivas" {
   name = "${var.layer}-${var.stack_id}-usage-plan"
   api_stages {
     api_id = module.api_gateway.aws_api_gateway_rest_api
     stage  = var.stack_id
   }
 }

 resource "aws_api_gateway_api_key" "key_gateway_modificaciones_colectivas" {
   name = "${var.name}-api-key"
 }

 resource "aws_api_gateway_usage_plan_key" "plan_key_modificaciones_colectivas" {
   key_id        = aws_api_gateway_api_key.key_gateway_modificaciones_colectivas.id
   key_type      = "API_KEY"
   usage_plan_id = aws_api_gateway_usage_plan.plan_modificaciones_colectivas.id
 }