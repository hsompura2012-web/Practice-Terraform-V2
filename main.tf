resource "aws_instance" "instance_launch" {
  for_each = var.Instance_Det
  ami           = var.ami
  instance_type = var.instance_type
  vpc_security_group_ids = var.vpc_security_group_ids

  tags = {
    Name = each.key
  }

  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      user     = "ec2-user"
      password = "DevOps321"
      host     = "${self.private_ip}"
    }
    inline =  [
      "sudo dnf install python.13.pip -y",
      "sudo pip3.13 install ansible",
      "ansible-pull -i localhost, -U https://github.com/hsompura2012-web/Practice-Ansible-template-V1.git main.yaml -e component = ${each.key} -e env=dev"

]
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