resource "aws_ebs_volume" "ebs_1" {
  availability_zone = var.availability_zone
  size              = var.ebs_size
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.ebs_1.id
  instance_id = var.instance_id
}