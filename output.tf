output "PMM Public IPs" {
    value = "${aws_instance.PMM.*.public_ip}"
  }

output "PMM Private IPs" {
value = "${aws_instance.PMM.*.private_ip}"

}

output "Mongo Private IPs" {
value = "${aws_instance.Mongo.*.private_ip}"

}

output "PostgreSQL Private IPs" {
value = "${aws_instance.Postgres.*.private_ip}"

}
