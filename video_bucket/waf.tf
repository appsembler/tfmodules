# check for our whitelisted referer
resource "aws_waf_byte_match_set" "byte_set" {
  name = "tf_waf_byte_match_set"

  byte_match_tuples {
    text_transformation   = "NONE"
    target_string         = "${var.allowed_referer}"
    positional_constraint = "CONTAINS"

    field_to_match {
      type = "HEADER"
      data = "referer"
    }
  }
}

resource "aws_waf_rule" "wafrule" {
  depends_on  = ["aws_waf_byte_match_set.byte_set"]
  name        = "tfWAFRule"
  metric_name = "tfWAFRule"

  predicates {
    data_id = "${aws_waf_byte_match_set.byte_set.id}"
    negated = false
    type    = "ByteMatch"
  }
}

# this one matches basically any referer
# we use it to check if the referer was set at all.
resource "aws_waf_byte_match_set" "referer_set" {
  name = "referer_set"

  byte_match_tuples {
    text_transformation   = "NONE"
    target_string         = "://"
    positional_constraint = "CONTAINS"

    field_to_match {
      type = "HEADER"
      data = "referer"
    }
  }
}

resource "aws_waf_rule" "referer_set" {
  depends_on  = ["aws_waf_byte_match_set.referer_set"]
  name        = "tfWAFRefererSetRule"
  metric_name = "tfWAFRefererSetRule"

  predicates {
    data_id = "${aws_waf_byte_match_set.referer_set.id}"
    negated = false
    type    = "ByteMatch"
  }
}

resource "aws_waf_web_acl" "waf_acl" {
  depends_on = ["aws_waf_byte_match_set.byte_set", "aws_waf_rule.wafrule",
    "aws_waf_byte_match_set.referer_set",
    "aws_waf_rule.referer_set",
  ]

  name        = "tfWebACL"
  metric_name = "tfWebACL"

  default_action {
    type = "ALLOW"
  }

  rules {
    # if they've got a whitelisted referer, let them in
    action {
      type = "ALLOW"
    }

    priority = 1
    rule_id  = "${aws_waf_rule.wafrule.id}"
    type     = "REGULAR"
  }

  rules {
    # otherwise, if the referer is set, block them
    # (JS players sometimes strip referers out)
    action {
      type = "BLOCK"
    }

    priority = 2
    rule_id  = "${aws_waf_rule.referer_set.id}"
    type     = "REGULAR"
  }
}
