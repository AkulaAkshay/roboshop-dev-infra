# resource "aws_instance" "bastion" {
#     #key, value --> are nothing but arguments
#   ami           = local.ami_id
#   instance_type = "t3.micro"
#   vpc_security_group_ids = [local.bastion_sg_id]
#   subnet_id = local.public_subnet_id

#   user_data = file("bastion.sh")

#   tags = merge (
#     local.common_tags,
#     {
#         Name = "${var.project_name}-${var.environment}-bastion"
#     }
#   )

# }



resource "aws_instance" "bastion" {
    #key, value --> are nothing but arguments
  ami           = local.ami_id
  instance_type = "t3.micro"
  vpc_security_group_ids = [local.bastion_sg_id]
  subnet_id = local.public_subnet_id
  iam_instance_profile = aws_iam_instance_profile.bastion.name

  user_data = file("bastion.sh")

  tags = merge (
    local.common_tags,
    {
        Name = "${var.project_name}-${var.environment}-bastion"
    }
  )

}

# since now we are using iam role we dont need to run aws configure inside bastion host server manually and also we no need to install terraform manually 
resource "aws_iam_instance_profile" "bastion" {
  name = "bastion"
  role = "BastionTerraformAdmin"
}