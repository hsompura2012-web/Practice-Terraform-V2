resource "aws_instance" "instance_launch" {
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = var.vpc_security_group_ids

  tags = {
    Name = var.Instance_Det[count.index]
  }
}

resource "aws_route53_record" "Record_Launch" {
  zone_id = var.zone_id
  name    = "${var.Instance_Det[count.index]}-dev"
  type    = "A"
  ttl     = 50
  records = [aws_instance.instance_launch.private_ip]
}