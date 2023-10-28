variable "vpc_cidr_block" {
  description = "The IPv4 CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr_block" {
  description = "The IPv4 CIDR block for the public subnet. The CIDR block must fit within the range of the VPC CIDR range."
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr_block" {
  description = "The IPv4 CIDR block for the private subnet. The CIDR block must fit within the range of the VPC CIDR range."
  type        = string
  default     = "10.0.10.0/24"
}

variable "bastion_host_key_name" {
  description = "The name of the bastion host SSH key"
  type        = string
  default     = "bastion_host_key"
}

variable "k8s_key_name" {
  description = "The name of the kubernetes node SSH key"
  type        = string
  default     = "k8s_key"
}
