resource "aws_cloudfront_distribution" "cdn" {
  origin {
    domain_name = "${aws_s3_bucket.bucket.bucket}.s3.amazonaws.com"
    origin_id   = "S3-${aws_s3_bucket.bucket.bucket}"
  }

  default_root_object = "index.html"
  enabled             = true

  default_cache_behavior {
    allowed_methods  = ["GET", "HEAD", "OPTIONS", "PATCH", "POST", "PUT", "DELETE"]
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = "S3-${aws_s3_bucket.bucket.bucket}"

    # Forward all query strings, cookies and headers
    forwarded_values {
      query_string = true

      cookies {
        forward = "all"
      }
    }

    viewer_protocol_policy = "allow-all"
  }

  price_class = "${var.price_class}"

  restrictions {
    geo_restriction {
      # type of restriction, blacklist, whitelist or none
      restriction_type = "none"
    }
  }

  web_acl_id = "${aws_waf_web_acl.waf_acl.id}"

  viewer_certificate {
    cloudfront_default_certificate = true
  }

  tags {
    Customer  = "${var.customer}"
    Terraform = true
  }
}
