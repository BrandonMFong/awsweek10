# EC2
/* resource "aws_instance" "week10-bastion-vm" {
  ami           = "ami-02e136e904f3da870"
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.week10-sub-b.id

  vpc_security_group_ids = [
    aws_security_group.week10-ssh-sg-v2.id
  ]

  key_name = "ECE592"

  tags = {
    Name = "week10-bastion-vm"
  }
}*/

# worker vm
resource "aws_instance" "week10-worker-vm" {
  ami                  = "ami-02e136e904f3da870"
  instance_type        = "t2.micro"
  subnet_id            = aws_subnet.week10-pri-a.id
  iam_instance_profile = aws_iam_instance_profile.week10-profile-ref.name

  vpc_security_group_ids = [
    aws_security_group.week10-ssh-pri-sg.id
  ]

  key_name = "ECE592"

  tags = {
    Name = "week10-worker-vm"
  }
}

# IAM profile ref
resource "aws_iam_instance_profile" "week10-profile-ref" {
  name = "week10-profile-ref"
  role = aws_iam_role.week10-role.name
  tags = {
    Name = "week10-profile-ref"
  }
}
