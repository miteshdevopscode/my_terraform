# Variables for PUB/PRI Keys and Username

variable "PUBLIC_KEY" {
  default = "my-demokey.pub"
}

variable "PRIVATE_KEY" {
  default = "my-demokey"
}

variable "USERNAME" {
  default = "ubuntu"
}

# Variable for AWS Access and Secret Keys 

variable "AWS_ACCESS_KEY" {}

variable "AWS_SECRET_KEY" {}

variable "AWS_REGION" {
  default = "us-east-1"
}

# Variable for AWS AMIS
variable "AMIS" {
  type = "map"

  default = {
    us-east-1 = "ami-0f9cf087c1f27d9b1"
  }
}

# Variables for ECS AMIS
# Full List: http://docs.aws.amazon.com/AmazonECS/latest/developerguide/ecs-optimized_AMI.html

variable "ECS_INSTANCE_TYPE" {
  default = "t2.micro"
}

variable "ECS_AMIS" {
  type = "map"

  default = {
    us-east-1 = "ami-1924770e"
  }
}
