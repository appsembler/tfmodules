resource "aws_iam_user" "user" {
  name = "${var.prefix}-${var.name}-user"
}

resource "aws_iam_access_key" "user_key" {
  user = "${aws_iam_user.user.name}"
}

resource "aws_iam_user_policy" "user_rw" {
  name = "${aws_iam_user.user.name}-rw"
  user = "${aws_iam_user.user.name}"
  policy= <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": "s3:*",
            "Resource": [
                "arn:aws:s3:::${var.prefix}-${var.name}-video",
                "arn:aws:s3:::${var.prefix}-${var.name}-video/*"
            ]
        }
   ]
}
EOF
}
