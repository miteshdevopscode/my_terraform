variable "PUBLIC_KEY" {
  default = "my-demokey.pub"
}

variable "PRIVATE_KEY" {
  default = "my-demokey"
}

variable "USERNAME" {
  default = "ubuntu"
}

variable "AWS_ACCESS_KEY" {}

variable "AWS_SECRET_KEY" {}

variable "AWS_REGION" {
  default = "us-east-1"
}

variable "AMIS" {
  type = "map"

  default = {
    us-east-1 = "ami-0f9cf087c1f27d9b1"
  }
}
