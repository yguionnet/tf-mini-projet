provider "aws" {
  region     = "us-east-1"
  access_key = "AKIA6CVPLTMPZUWJ43MJ"
  secret_key = "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"
}

module "sg" {
  source = "../modules/sg"
  sg_name = "app-yannick-sg"
}

module "ec2" {
  source = "../modules/ec2module"
  instancetype = "t2.micro"
  aws_common_tag = {
    Name = "ec2-app-yannick"
  }
  sg_name = "app-yannick-sg"
}

module "ippub" {
  source = "../modules/ippub"
  instance_id = module.ec2.instance_vm_id
  public_ip = module.ec2.public_ip
  availability_zone = module.ec2.instance_av_zone
}

module "ebs" {
  source = "../modules/ebs"
  instance_id = module.ec2.instance_vm_id
  availability_zone = module.ec2.instance_av_zone
  ebs_size = 10
}


