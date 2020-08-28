resource "aws_flow_log" "urburn_flowlogs" {
  iam_role_arn    = aws_iam_role.urburn_role.arn
  log_destination = aws_cloudwatch_log_group.urburn_cloudwatch.arn
  traffic_type    = "ALL"
  vpc_id          = aws_vpc.prod_tgw_vpc.id
}

resource "aws_cloudwatch_log_group" "urburn_cloudwatch" {
  name = "flowlogs"
}

resource "aws_iam_role" "urburn_role" {
  name = "flowlogs_svc"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "",
      "Effect": "Allow",
      "Principal": {
        "Service": "vpc-flow-logs.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}

resource "aws_iam_role_policy" "example" {
  name = "example"
  role = aws_iam_role.urburn_role.id

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "logs:CreateLogGroup",
        "logs:CreateLogStream",
        "logs:PutLogEvents",
        "logs:DescribeLogGroups",
        "logs:DescribeLogStreams"
      ],
      "Effect": "Allow",
      "Resource": "*"
    }
  ]
}
EOF
}