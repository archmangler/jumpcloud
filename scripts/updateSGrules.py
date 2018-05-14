#!/usr/bin/env python3
import boto3

'''
Just a simple example of updating SG rules using boto.
Used to update SSH access to roaming users whose home
addresses are always changing
Further work: further checks, error handling logic, idempotency 
can be built in,
In any case, this task is better done using a templating
technology like Terraform or cloudformation 
-- traiano@gmail.com

NOTE: A bug in some versions of boto3 results in rule description being rejected ... working on that
'''

#Change these values to customise the rule to change/update
#(manually) then run the script
sg_id = "sg-d3fdd1be"
sg_rule_desc = "traiano-zurich"
previous_ip = '213.160.53.91'
current_ip = '213.160.53.93/32'

ec2 = boto3.resource("ec2")
security_group = ec2.SecurityGroup(sg_id)

for p in security_group.ip_permissions:
	for r in p['IpRanges']:
		if 'Description' in r and r['Description'] == sg_rule_desc:
			previous_ip = r['CidrIp']
			print("found previous IP : "+ previous_ip)
		else:
			print("can't find previous IP")

if previous_ip != "127.0.0.1":
	security_group.revoke_ingress(IpProtocol="tcp", CidrIp=previous_ip+"/32", FromPort=22, ToPort=22)
	print("remove previous IP "+previous_ip)

perms = {
  'FromPort': 22,
  'IpProtocol': "tcp",
  'IpRanges': [
	{
  		'CidrIp': current_ip
	},
   ],
  'ToPort': 22
}  
security_group.authorize_ingress(IpPermissions=[perms])
print("updated with "+ current_ip +"/32")
