ec2_config = [
  {
    ami           = "ami-0705384c0b33c194c" #ubuntu
    instance_type = "t3.micro"
  },
  {
    ami           = "ami-052387465d846f3fc" #amazon linux
    instance_type = "t3.micro"
}]


ec2_map = {
  #key=value
  "ubuntu" = {
    ami           = "ami-0705384c0b33c194c" #ubuntu
    instance_type = "t3.micro"
  },
  "amazon-linux" = {
    ami           = "ami-052387465d846f3fc" #amazon linux
    instance_type = "t3.micro"
  }
}
