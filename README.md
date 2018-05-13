# infrastructure and provisioning code to deploy a jumpcloud client in AWS (ubuntu 14.04) 

This directory contains a collection of Terraform, Ansible, python and perl code to deploy jumpcloud clients and manage users and security group rules.

1. Terraform module and script to deploy a VPC, EC2 instance, routing table and security groups: vpc/, app.tf
2. Ansible playbook to deploy jumpcloud client on Ubuntu 14.04 (Ubuntu 16.04 has a bug), ansible/jumpcloud.yml
3. Python code to add rules to the VPC security group (addSGRule.py)
4. PERL code to create jumpcloud users using the jumpcloud API (scripts/createUser.pl)


## Usage


1. deploy aws infrastructure using Terraform and the vpc module, first customising app.tf, a variables.tf. make sure vpc is copied under modules/ and app.tf and variables.tf is under a directory called app/  
2. Once the EC2 instance is deployed, configure ansible/hosts/grab with the IP address and then run the playbook with:

```
ansible-playbook --diff -vv -i hosts/grab jumpcloud.yml

```

(NOTE: make sure you have your ec2 ssh key correctly configures in terraform's variables.tf and for ansible)

## License

MIT

