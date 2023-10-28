data "aws_ami" "al2" {
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["amzn2-ami-hvm-*-x86_64-gp2"]
  }
}

data "aws_ami" "al2023" {
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["al2023-ami-2023.*-x86_64"]
  }
}

data "aws_ami" "rhel" {
  owners      = ["amazon"]
  most_recent = true
  filter {
    name   = "name"
    values = ["RHEL-*_HVM-*-x86_64-38-Hourly2-GP2"]
  }
}
