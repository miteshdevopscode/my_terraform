resource "aws_instance" "firstec2" {
  ami                         = "${lookup(var.AMIS, var.AWS_REGION)}"
  instance_type               = "t2.micro"
  subnet_id                   = "${aws_subnet.main-public-2.id}"
  vpc_security_group_ids      = ["${aws_security_group.allow-ssh.id}"]
  associate_public_ip_address = "true"
  key_name                    = "${aws_key_pair.demokey.key_name}"

  tags {
    Name = "firstec2"
  }

  provisioner "file" {
    source      = "script.sh"
    destination = "/tmp/script.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "sudo /tmp/script.sh",
    ]
  }

  connection {
    user        = "${var.USERNAME}"
    private_key = "${file("${var.PRIVATE_KEY}")}"
  }
}
