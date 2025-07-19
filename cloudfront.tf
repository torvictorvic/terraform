/*
** Description: Cloudfront that integrates with the frontend's S3 bucket
*/
module "cloudfront_distribution_s3_website" {
  source                             = "git::https://github.com/xxxxxxxxxxxx/library-infra.git//modules/compute/cloudfront-cdn?ref=v1.1.3"
  name                               = "${var.name}-cloudfront"
  stack_id                           = var.stack_id
  layer                              = var.layer
  tags                               = var.tags
  origin_bucket                      = module.aws_s3_bucket_web_frontend.name
  website_enabled                    = var.website_enabled
  block_origin_public_access_enabled = false
  //web_acl_id                         = module.waf_cloudfront.web_acl_arn
  acm_certificate_arn                = var.acm_certificate_arn
  aliases                            = var.aliases_cloudfront
  price_class                        = "PriceClass_All"
}