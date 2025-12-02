resource "aws_instance" "instance_launch" {
  for_each = var.Instance_Det
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = var.vpc_security_group_ids

  tags = {
    Name = each.key
  }
}

resource "aws_route53_record" "Record_Launch" {
  for_each =  var.Instance_Det
  zone_id = var.zone_id
  name    = "${each.key}-dev"
  type    = "A"
  ttl     = 50
  records = [aws_instance.instance_launch[each.key].private_ip]
}