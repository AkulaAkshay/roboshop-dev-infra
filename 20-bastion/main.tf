resource "aws_instance" "bastion" {
    #key, value --> are nothing but arguments
  ami           = local.ami_id
  instance_type = "t3.micro"
  vpc_security_group_ids = [local.bastion_sg_id]
  subnet_id = local.public_subnet_id

  tags = merge (
    local.common_tags,
    {
        Name = "${var.project_name}-${var.environment}-bastion"
    }
  )

}

resource "aws_security_group" "allow-all" { #allow-all-->for refering this in another resource in tf; tf ref
  name = "allow-all-sg" #allow-all-sg --> security group name; in aws console.

  egress { #outgoing traffic
    from_port       = 0 #from_port 0 to to_port 0 means all ports
    to_port         = 0
    protocol        = "-1" #-1 means all protocols
    cidr_blocks = ["0.0.0.0/0"] #0.0.0.0/0 means internet
  }

  ingress { #incomming traffic
    from_port       = 0 
    to_port         = 0
    protocol        = "-1" #-1 means all protocols
    cidr_blocks = ["0.0.0.0/0"] #0.0.0.0/0 --> means internet
  }

  tags = {
    Name = "Terraform-sg" #name --> for user display; in aws console 
  }

}