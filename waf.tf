module "waf_cloudfront" {
  source               = "git::https://github.com/xxxxxxxxxxxx/library-infra.git//modules/security/waf_v2?ref=v1.0.6"
  name                 = var.name
  tags                 = var.tags
  allow_default_action = true
  visibility_config    = var.visibility_config_waf
  scope                = "CLOUDFRONT"
  rules_rate = {
    name     = "IpRateBasedRule-7"
    priority = 50
    action   = "count"
    visibility_config = {
      cloudwatch_metrics_enabled = true
      metric_name                = "IpRateBasedRule-metric"
      sampled_requests_enabled   = true
    }
    rate_based_statement = {
      limit              = 1000
      aggregate_key_type = "IP"
    }
  }
}

