resource "aws_instance" "test" {
  count = var.testservercount
  ami = element(data.aws_ami_ids.centos7.ids,0)
  ebs_optimized = false
  instance_type = "t2.nano"
  monitoring    = false
  key_name      = aws_key_pair.usersshkey.key_name
  #subnet_id     = element(module.vpc.public_subnets, 0)
  subnet_id  = element(module.vpc.public_subnets,count.index % 2)
  vpc_security_group_ids      = [aws_security_group.test.id]
  associate_public_ip_address = true
  source_dest_check           = true
  root_block_device {
    volume_type           = "gp2"
    volume_size           = 8
    delete_on_termination = true
  }

  iam_instance_profile = aws_iam_instance_profile.testbox.name
#  user_data = data.template_cloudinit_config.config.rendered

  tags = local.common_tags
}