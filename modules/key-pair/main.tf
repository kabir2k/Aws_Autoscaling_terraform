resource "aws_key_pair" "deployer" {
  key_name   = var.key_name
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQCpmAIKwgfDWisjfI+cxCW1kIxSD2aE/3auBpC0TDVZKONYYEY+nWsg8yBzHTnf/Nk/rMmAJiuYBkkEj9/NbxReDgazUF9fLSp6KIWBwYeewzBcFwqfMwOjf1dQb2Pv7Scdp6eWgAmck/53zE4iMyGeEuT+Iyp48umLZmQwbciQa5TEzt/THy/u710Nb1yxs1s0yU9Nhmgpx5PP9BUkjBJcGcasIikFH6Q/3xWRj852C4EpbuYuKmXPDSRv4Av/BMYVkUgny7Z7g8UMqUotbUKAfZwliD+939X8nAUONn7AbMpZp2mLEvFlt0bJhb3MtiQoz4suEQWBQcnOPbpG8Kxb ka-key"
 }


