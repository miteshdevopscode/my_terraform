resource "aws_key_pair" "demokey" {
  key_name   = "my-demokey"
  public_key = "${file("${var.PUBLIC_KEY}")}"
}

