# infrastructure and provisioning code to deploy a jumpcloud client in AWS (ubuntu 14.04) 

This directory contains a collection of Terraform, Ansible, python and perl code to deploy jumpcloud clients and manage users and security group rules.

1. Terraform module and script to deploy a VPC, EC2 instance, routing table and security groups: vpc/, app.tf
2. Ansible playbook to deploy jumpcloud client on Ubuntu 14.04 (Ubuntu 16.04 has a bug), ansible/jumpcloud.yml
3. Python code to add rules to the VPC security group (addSGRule.py)
4. PERL code to create jumpcloud users using the jumpcloud API (scripts/createUser.pl)

## License

MIT

