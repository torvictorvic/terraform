module "budgets" {
  source            = "git::https://github.com/xxxxxxxxxxxx/library-infra.git//modules/asdfg/budgets?ref=v1.1.3"
  name              = "${var.name}-budget"
  limit_amount      = var.limit_amount
  period_start      = var.period_start
  perc_limit_notify = var.perc_limit_notify
  emails            = var.emails
}

module "network" {
  source             = "git::https://github.com/xxxxxxxxxxxx/library-infra.git//modules/network?ref=v0.0.40"
  name               = var.name
  stack_id           = var.stack_id
  layer              = var.layer
  tags               = var.tags
  vpc_cidr           = var.vpc_cidr
  azs                = var.azs
  private_subnets    = var.private_subnets
  public_subnets     = var.public_subnets
  transit_gateway_id = var.transit_gateway_id
}

module "parameter_store" {
   source         = "github.com/xxxxxxxxxxxx/library-infra.git//modules/ssm/parameter_store?ref=v1.0.6"
   tags           = var.tags
   parameters     = var.parameters
   parameters_ops = var.parameters_ops
}

module "waf_regional" {
    source               = "github.com/xxxxxxxxxxxx/library-infra.git//modules/security/waf_v2?ref=v1.7.1"
    name                 = var.name
    tags                 = var.tags 
    allow_default_action = true
    visibility_config    = var.visibility_config_waf
    //resources_arn        = var.resources_arn
    rules = [
        {
            name     = "AWS-AWSManagedRulesAdminProtectionRuleSet"
            priority = 100

            override_action = "none"

            visibility_config = {
                cloudwatch_metrics_enabled = true
                metric_name                = "managedrules-adminprotection-ruleset"
                sampled_requests_enabled   = true
            }

            managed_rule_group_statement = {
                name        = "AWSManagedRulesAdminProtectionRuleSet"
                vendor_name = "AWS"
            }
        },
        {
            name     = "AWS-AWSManagedRulesAmazonIpReputationList"
            priority = 200

            override_action = "none"

            visibility_config = {
                cloudwatch_metrics_enabled = true
                metric_name                = "managedrules-amazonipreputationlist"
                sampled_requests_enabled   = true
            }

            managed_rule_group_statement = {
                name        = "AWSManagedRulesAmazonIpReputationList"
                vendor_name = "AWS"
            }
        },
        {
            name     = "AWS-AWSManagedRulesAnonymousIpList"
            priority = 300

            override_action = "none"

            visibility_config = {
                cloudwatch_metrics_enabled = true
                metric_name                = "managedrules-anonymousiplist"
                sampled_requests_enabled   = true
            }

            managed_rule_group_statement = {
                name        = "AWSManagedRulesAnonymousIpList"
                vendor_name = "AWS"
            }
        },
        {
            name     = "AWS-AWSManagedRulesCommonRuleSet"
            priority = 400

            override_action = "none"

            visibility_config = {
                cloudwatch_metrics_enabled = true
                metric_name                = "managedrules-commonruleset"
                sampled_requests_enabled   = true
            }

            managed_rule_group_statement = {
                name        = "AWSManagedRulesCommonRuleSet"
                vendor_name = "AWS"

                excluded_rule = [
                    "SizeRestrictions_BODY"
                ]
            }
        },
        {
            name     = "AWS-AWSManagedRulesKnownBadInputsRuleSet"
            priority = 500

            override_action = "none"

            visibility_config = {
                cloudwatch_metrics_enabled = true
                metric_name                = "managedRules-knownbadinputsruleset"
                sampled_requests_enabled   = true
            }

            managed_rule_group_statement = {
                name        = "AWSManagedRulesKnownBadInputsRuleSet"
                vendor_name = "AWS"
            }
        }
    ]

    rules_rate = {
        name     = "IpRateBasedRule-7"
        priority = 50

        action = "count"

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

output "web_acl_name" { value = module.waf_regional.web_acl_name }
output "web_acl_arn" { value = module.waf_regional.web_acl_arn }
output "web_acl_id" { value = module.waf_regional.web_acl_id }
output "web_acl_capacity" { value = module.waf_regional.web_acl_capacity }