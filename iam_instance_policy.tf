data "aws_iam_policy_document" "snap" {                                                                                                                                   
  statement {                                                                                                                                                             
    sid = "1"                                                                                                                                                             
    actions = [                                                                                                                                                           
      "ec2:*Snapshot*",                                                                                                                                                   
      "ec2:Describe*"                                                                                                                                                     
    ]
    resources = [
      "*",
    ]
  }
}
 
resource "aws_iam_policy" "testbox" {
  name   = "${var.uid}-${var.Env}-terraformed-snapshop-policy-testbox"
  path   = "/"
  policy = data.aws_iam_policy_document.snap.json
}
 
 
resource "aws_iam_policy_attachment" "terraformed-snapshot-attachment" {
    name       = "${var.uid}-${var.Env}-Snapshot"
    policy_arn = aws_iam_policy.testbox.arn
    roles      = [aws_iam_role.testbox.id]
}
 
data "aws_iam_policy_document" "instance-assume-role-policy" {
  statement {
    actions = ["sts:AssumeRole"]
 
    principals {
      type        = "Service"
      identifiers = ["ec2.amazonaws.com"]
    }
  }
}
 
resource "aws_iam_instance_profile" "testbox" {
  name               = "${var.uid}-${var.Env}-testbox"
  role = aws_iam_role.testbox.name
}
 
resource "aws_iam_role" "testbox" {
  name               = "${var.uid}-${var.Env}-testboxsnaprole"
  path               = "/"
  assume_role_policy = data.aws_iam_policy_document.instance-assume-role-policy.json
  tags               = local.common_tags
}