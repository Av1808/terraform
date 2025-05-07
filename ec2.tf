resource "aws_instance" "myec2" {
  ami = data.aws_ami.amzlinux.id
  instance_type = var.instance_types["small"]
  key_name      = var.ssh_key
  user_data = file("${path.module}/app1-install.sh")
#   count = 2
#   tags = {
#     "Name" = "EC2 Demo-> ${count.index}"
#   }

 #if using for each
  for_each = toset(data.aws_availability_zones.myzones.names) #will create an instance in each zone, kind a like count
  tags={
    "Name" = "EC2->${each.key}"
  }

  vpc_security_group_ids = [aws_security_group.vpc-ssh.id, aws_security_group.vpc-web.id]
}

