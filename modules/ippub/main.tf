resource "aws_eip" "app-eip" {
  instance = var.instance_id
  vpc      = true
  provisioner "local-exec" {
    command = "echo PUBLIC IP: ${var.public_ip} - ID: ${var.instance_id} - AZ: ${var.availability_zone} >> infos_ec2.txt"
  }
  
}