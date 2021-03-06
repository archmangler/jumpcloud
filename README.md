# infrastructure and provisioning code to deploy a jumpcloud client in AWS (ubuntu 14.04) 

This directory contains a collection of Terraform, Ansible, python and perl code to deploy jumpcloud clients and manage users and security group rules.

1. Terraform module and script to deploy a VPC, EC2 instance, routing table and security groups: vpc/, app.tf
2. Ansible playbook to deploy jumpcloud client on Ubuntu 14.04 (Ubuntu 16.04 has a bug), ansible/jumpcloud.yml
3. Python code to add rules to the VPC security group (addSGRule.py)
4. PERL proof of concept code to create jumpcloud users using the jumpcloud API (scripts/createUser.pl)
5. Terraform script to create an IAM user restricted to using EC2 (iam-users/iam.tf)


## Usage


1. deploy aws infrastructure using Terraform and the vpc module, first customising app.tf, a variables.tf. make sure vpc is copied under modules/ and app.tf and variables.tf is under a directory called app/  
2. Once the EC2 instance is deployed, configure ansible/hosts/grab with the IP address and then run the playbook with:

```
ansible-playbook --diff -vv -i hosts/grab jumpcloud.yml

```

3. under iam-users/iam.tf customise the example-variables.tf and run terraform plan -out iam.plan and then terraform apply iam.plan
4. Adding / Changing Jumpcloud users: under scripts/ there is a .csv file called users.csv. Each line contains the details of a user.
   the script createUser.pl uses this file to create users via the JumpCloud REST API. To add a new user, edit the file to add a new line.
   (currently users must be deleted from the UI and from the users.csv file to be removed)

(NOTE: make sure you have your ec2 ssh key correctly configures in terraform's variables.tf and for ansible)

## License

MIT

