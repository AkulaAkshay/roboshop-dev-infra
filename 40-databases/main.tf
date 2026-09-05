resource "aws_instance" "mongodb" {
    #key, value --> are nothing but arguments
  ami           = local.ami_id
  instance_type = "t3.micro"
  vpc_security_group_ids = [local.mongodb_sg_id]
  subnet_id = local.database_subnet_ids

  tags = merge (
    local.common_tags,
    {
        Name = "${local.common_name_suffix}-mongodb" #roboshop-dev-mongodb
    }
  )
}

resource "terraform_data" "mongodb" {
  triggers_replace = [aws_instance.mongodb.id]

  connection {
    type        = "ssh"
    user        = "ec2-user"
    password    = "DevOps321"     # Local path to your private key
    host        = aws_instance.mongodb.public_ip  
  }

  provisioner "remote-exec" {
    inline = [
      "sudo dnf install nginx -y",
      "sudo systemctl start nginx"
   ]
  }
}