resource "aws_waf_byte_match_set" "byte_set" {
  name = "tf_waf_byte_match_set"

  byte_match_tuples {
    text_transformation = "NONE"
    target_string = "${var.allowed_referer}"
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

resource "aws_waf_web_acl" "waf_acl" {
  depends_on  = ["aws_waf_byte_match_set.byte_set", "aws_waf_rule.wafrule"]
  name        = "tfWebACL"
  metric_name = "tfWebACL"

  default_action {
    type = "BLOCK"
  }

  rules {
    action {
      type = "ALLOW"
    }

    priority = 1
    rule_id  = "${aws_waf_rule.wafrule.id}"
    type     = "REGULAR"
  }
}
