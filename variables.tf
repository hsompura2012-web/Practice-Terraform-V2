variable "ami" {
  default = "ami-09c813fb71547fc4f"
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
  default = [
       "frontend",
       "mongodb",
       "catalogue",
       "redis",
       "mysql",
       "cart",
       "user",
       "shipping",
       "rabbitmq",
       "payment"

  ]
}