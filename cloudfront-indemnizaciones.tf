module "s3_indemnizaciones" {
  source = "git::https://github.com/xxxxxxxxxxxx/library-infra.git//modules/s3?ref=v2.6.23"
  name   = "bucket-web-${var.stack_id}-${var.layer}"
  website = {
    index_document = "index.html"
    error_document = "index.html"
  }
}
module "cloudfront" {
  source                   = "git::https://github.com/xxxxxxxxxxxx/library-infra.git//modules/compute/cloudfront-cdn?ref=v2.0.0"
  name                     = var.layer_indemnizaciones
  stack_id                 = var.stack_id
  layer                    = var.layer_indemnizaciones
  tags                     = var.tags_indemnizaciones
  web_acl_id               = module.waf_cloudfront.web_acl_arn
  aliases                  = var.aliases_indemnizaciones
  acm_certificate_arn      = var.acm_certificate_arn
  minimum_protocol_version = "TLSv1.2_2021"
  origins = [
    {
      origin_id     = "bucket-web-${var.stack_id}-${var.layer}"
      origin_bucket = module.s3_indemnizaciones.name
      domain_name   = module.s3_indemnizaciones.website_endpoint
      tipo          = "web"
    }
  ]
  custom_error_response = [
    {
      error_code            = 404
      response_code         = 200
      response_page_path    = "/index.html"
      error_caching_min_ttl = 10
    },
    {
      error_code            = 403
      response_code         = 200
      response_page_path    = "/index.html"
      error_caching_min_ttl = 10
    }
  ]

  depends_on = [module.s3_indemnizaciones, module.waf_cloudfront]
}
