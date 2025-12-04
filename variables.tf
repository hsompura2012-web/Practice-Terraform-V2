data "aws_ami" "AMINAME" {
  owners = [ "973714476881" ]
  filter {
    name = "name"
    values = [ "RHEL-9-DevOps-Practice" ]
  }
}

variable "ami" {
  default = data.aws_ami.AMINAME.name
}

variable "instance_type" {
  default = "t3.micro"
}

variable "vpc_security_group_ids"{
  default = [ "sg-07306e019683163e7" ]

}

variable "zone_id" {
  default =  "Z055196614WSVQYU4VYMA"

}

variable "Instance_Det" {
  default = {
    frontend = ""
    mongodb = ""
    redis = ""
    catalogue = ""
    mysql = ""
    user = ""
    cart = ""
    shipping = ""
    rabbitmq = ""
    payment = ""
  }
}