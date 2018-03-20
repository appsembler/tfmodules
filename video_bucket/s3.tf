resource "aws_s3_bucket" "bucket" {
  bucket = "${var.prefix}-${var.name}-video"
  acl = "public-read"

  policy = <<EOF
{
    "Version": "2008-10-17",
    "Statement": [
        {
            "Sid": "PublicReadForGetBucketObjects",
            "Effect": "Allow",
            "Principal": {
                "AWS": "*"
            },
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::${var.prefix}-${var.name}-video/*"
        },
        {
            "Sid": "",
            "Effect": "Allow",
            "Principal": {
                "AWS": "${aws_iam_user.user.arn}"
            },
            "Action": "s3:*",
            "Resource": [
                "arn:aws:s3:::${var.prefix}-${var.name}-video",
                "arn:aws:s3:::${var.prefix}-${var.name}-video/*"
            ]
        }
    ]
}
EOF

	cors_rule {
    allowed_headers = ["*"]
    allowed_methods = ["GET", "HEAD"]
    allowed_origins = ["*"]
    expose_headers  = ["ETag"]
    max_age_seconds = 3000
	}
  tags {
    Name = "Video files for ${var.name}"
    Customer = "${var.customer}"
    Terraform = true
  }
}
