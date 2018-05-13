#output "elb_address" {
#  value = "${aws_elb.web.dns_name}"
#}

output "web_addresses" {
  value = "${aws_instance.web.*.public_ip}"
}

#output "bastion_addresses" {
#  value = "${module.vpc.bastion_host_ip}"
#}

output "public_subnet_ids" {
  value = "${module.vpc.public_subnet_ids}"
}
