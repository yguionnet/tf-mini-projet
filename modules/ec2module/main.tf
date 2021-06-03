data "aws_ami" "ubuntu" {
    most_recent = true

    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
    }

    filter {
        name   = "virtualization-type"
        values = ["hvm"]
    }

    owners = ["099720109477"] # Canonical
}

resource "aws_instance" "myec2" {
  ami             = data.aws_ami.ubuntu.id
  instance_type   = var.instancetype
  key_name        = "devops-yannick"
  tags            = var.aws_common_tag
  availability_zone = "us-east-1e"
  security_groups = [var.sg_name]
  provisioner "remote-exec" {
     inline = [
       "sudo apt update -y",
       "sudo apt install -y nginx"
     ]

      connection {
        type = "ssh"
        user = "ubuntu"
        private_key = file("./devops-yannick.pem")
        host = self.public_ip
      }
   }
  root_block_device {
    delete_on_termination = true
  }

}

output "instance_vm_id" {
  value       = aws_instance.myec2.id
  description = "Id of instance vm."
}

output "instance_av_zone" {
  value       = aws_instance.myec2.availability_zone
  description = "Id of av zone vm."
}

output "public_ip" {
  value       = aws_instance.myec2.public_ip
  description = "public ip."
}


