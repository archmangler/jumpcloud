provider "aws" {
  region     = "${var.region}"
  access_key = "${var.access_key}"
  secret_key = "${var.secret_key}"
}

resource "aws_iam_user" "iam_ec2" {
  name = "${var.ec2_iam_user}"
  path = "/system/"
}

resource "aws_iam_access_key" "iam_ec2" {
  user = "${aws_iam_user.iam_ec2.name}"
}

resource "aws_iam_user_policy" "iam_ec2_ro" {
  name = "grab_user_policy"
  user = "${aws_iam_user.iam_ec2.name}"

  policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": [
        "ec2:*"
      ],
      "Effect": "Allow",
      "Resource": "*"
    },
    {
      "Effect": "Allow",
      "Action": "ec2:*",
      "Resource": "arn:aws:ec2:region:account:subnet/*",
        "Condition": {
         "StringEquals": {
            "ec2:Vpc": "arn:aws:ec2:region:account:vpc/vpc-6b7a0e00"
            }
      }
   }
  
  ]
}
EOF
}
