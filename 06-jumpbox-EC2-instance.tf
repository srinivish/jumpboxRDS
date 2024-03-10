resource "aws_instance" "jumpbox" {
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name
  user_data     = file(var.startup_script)
  tags = {
    Name = "jumpbox"
  }
  vpc_security_group_ids      = ["${aws_security_group.jumpbox.id}"]
  subnet_id                   = aws_subnet.jumpbox.id
  associate_public_ip_address = true
}

output "jumpbox_public_ip" {
  value = aws_instance.jumpbox.public_ip
}
output "jumpbox_private_ip" {
  value = aws_instance.jumpbox.private_ip
}

