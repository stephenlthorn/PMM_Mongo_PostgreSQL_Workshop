resource "aws_instance" "PMM"{

      count           = "${var.instance_count}"
      ami             = "ami-00bb05679d83a40ad"
      instance_type   = "t2.micro"
      subnet_id       = "${var.subnet_id}"
      vpc_security_group_ids  = ["sg-0997aefa12778ce20"]
      associate_public_ip_address = true

tags {
      Name = "Workshop_PMM_${count.index}"
  }


provisioner "local-exec"{
      command = "echo PMM ${self.id}: Public: ${self.public_ip}, Private: ${self.private_ip} >> PMM_IPs.txt"
  }

}

resource "aws_instance" "Mongo"{
count           = "${var.instance_count}"
ami             = "ami-02d2f2fda67aa2438"
instance_type   = "t2.micro"
subnet_id       = "${var.subnet_id}"
vpc_security_group_ids  = ["sg-0997aefa12778ce20"]
associate_public_ip_address = true

tags {
    Name = "Workshop_Mongo_${count.index}"
  }

  provisioner "local-exec"{
        command = "echo Mongo ${self.id}: Private: ${self.private_ip}  >> Mongo_IPs.txt"
    }
}

resource "aws_instance" "Postgres"{
count           = "${var.instance_count}"
ami             = "ami-07dbd06492ab7a93d"
instance_type   = "t2.micro"
subnet_id       = "${var.subnet_id}"
vpc_security_group_ids  = ["sg-0997aefa12778ce20"]
associate_public_ip_address = true
tags {
    Name = "Workshop_Postgres_${count.index}"
  }

  provisioner "local-exec"{
        command = "echo Postgres ${self.id}: Private: ${self.private_ip}  >> PostgreSQL_IPs.txt"
    }
}
