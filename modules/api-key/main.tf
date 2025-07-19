resource "aws_api_gateway_usage_plan" "usage_plan" {
  name = "${var.name_api}-usage-plan"

  api_stages {
    api_id = var.aws_api_gateway_rest_api
    stage  = var.aws_api_gateway_stage
  }
}

resource "aws_api_gateway_api_key" "api_key" {
  name = "${var.name_api}-api-key"
}

resource "aws_api_gateway_usage_plan_key" "main" {
  key_id        = aws_api_gateway_api_key.api_key.id
  key_type      = "API_KEY"
  usage_plan_id = aws_api_gateway_usage_plan.usage_plan.id
}
