resource aws_key_pair "myinstance"{
    key_name = "ecs_ecr_proj"
    public_key=file("ecs_ecr_proj.pub")
}

resource "aws_default_vpc" "myvpc" {
  tags={
    Name="mydefaultvpc"
  }
}

resource "aws_security_group" "mysg" {
     name="ecs_ecr_sg"
     description = "This is my ecs_ecr server security group"
     
     ingress{
        from_port = 22
        to_port = 22
        description = "Security group port 22 open"
        cidr_blocks = ["0.0.0.0/0"]
        protocol = "tcp"
     }

     ingress {
        from_port = 80
        to_port = 80
        description = "Security group port 80 open"
        cidr_blocks = ["0.0.0.0/0"]
        protocol = "tcp"
     }

     ingress {
        from_port = 443
        to_port = 443
        description = "Port 443 open for this sg"
        cidr_blocks = ["0.0.0.0/0"]
        protocol = "tcp"
     }

     egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        description = "This is basically my sg outbound rules"
     }

     tags={
        Name="ecs_ecr_sg"
     }
}

resource "aws_instance" "myinstance" {

    key_name = aws_key_pair.myinstance.key_name
    security_groups = [aws_security_group.mysg.name]
    instance_type = "t2.large"
    ami="ami-0f5fcdfbd140e4ab7"

    root_block_device {
      volume_size = "20"
      volume_type = "gp3"
    }

    tags={
        Name="ecs_ec2_instance"
    }
  
}