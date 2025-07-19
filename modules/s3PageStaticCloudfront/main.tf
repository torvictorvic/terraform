variable "layer" {
  description = "A unique identifier for the deployment. Used as a prefix for all the Openstack resources."
  type        = string
  default     = null
}

variable "stack_id" {
  description = "A unique identifier for the deployment. Used as a prefix for all the Openstack resources."
  type        = string
  default     = null
}

variable "bucket_name" {
  description = "Name bucket multimedia s3"
  type        = string
  default     = null
}
/*
variable "web_acl_id" {
  description = "WAF ACL rule id"
  type        = string
}
*/
variable "arn_certificate" {
  description = "ARN certificate"
  type        = string
  default     = null
}

variable "aliases" {
  description = "aliases for cloudfront rule"
  type        = list(string)
  default     = null
}


# resource "aws_s3_bucket" "s3" {
#   bucket = var.bucket_name
#   acl    = "private"
