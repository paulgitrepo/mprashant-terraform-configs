aws_instance_type = "t3.micro"

ec2_config = {
    v_size = 30
    v_type = "gp3"
}

additional_tags = {
    DEPT = "QA"
    PROJECT = "MYPROJECT_QA"
}
