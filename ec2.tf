
resource "aws_instance" "My_server01" {
  ami               = "ami-03972092c42e8c0ca"
  instance_type     = "t2.micro"
  subnet_id         = aws_subnet.private1.id
  availability_zone = "us-east-1a"
  # security_groups = [aws_security_group.sg-demo.name]
  vpc_security_group_ids = [aws_security_group.sg-demo1.id]
  //key_name               = aws_key_pair.aws_key.key_name
  user_data = file("progrm.sh")
  tags = {
    Name = "webs1"
  }
}

resource "aws_instance" "My_server02" {
  ami               = "ami-03972092c42e8c0ca"
  instance_type     = "t2.micro"
  subnet_id         = aws_subnet.private2.id
  availability_zone = "us-east-1b"
  # security_groups = [aws_security_group.sg-demo.name]
  vpc_security_group_ids = [aws_security_group.sg-demo1.id]
  //key_name               = aws_key_pair.aws_key.key_name
  user_data = file("progrm.sh")
  tags = {
    Name = "webs2"
  }
}