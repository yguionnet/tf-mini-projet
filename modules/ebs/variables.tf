variable ebs_size {
  type        = string
  description = "set ebs size (Gb)"
  default     = 1
}

variable instance_id {
  type        = string
  description = "set instance id "
  default     = "eazytraining-sg"
}

variable availability_zone {
  type        = string
  description = "set av zone "
  default     = ""
}