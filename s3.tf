module "aws_s3_bucket_web_frontend" {
  source = "git::https://github.com/xxxxxxxxxxxx/library-infra.git//modules/s3?ref=v1.1.3"
  name   = "${var.name}-web-frontend"
  acl  = null
  website = {
    index_document = "index.html"
    error_document = "index.html"
  }
  tags   = var.tags

}

resource "aws_s3_bucket_ownership_controls" "example" {
  bucket = "${var.name}-web-frontend"

  rule {
    object_ownership = "ObjectWriter"
  }
}