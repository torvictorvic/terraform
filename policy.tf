resource "aws_iam_role_policy" "mod_colectivas_policy_apigateway_invoke" {
  name   = "${var.name}-role-apigateway-invoke"
  role   = aws_iam_role.mod_colectivas_role_apigateway.id
  policy = <<EOF
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Effect": "Allow",
            "Action": ["logs:*",
                        "execute-api:Invoke",
                        "execute-api:ManageConnections"
                        ],
            "Resource": "*"
        }
    ]
}
EOF
}