# Creating and connecting to a MySQL RDS instance using Jumpbox server
# jumpbox resides in public subnet
# rds resides in private subnet
# ingress security group configured in RDS will allow ports 22, 3306 from jumpbox
# outgress security group configured in RDS will allow outgoing traffic to anywhere
# jumpbox will have full incoming access to ports 22, 80, 443 and 8080 (Will use dynamic blocks) 


# journalctl -t startup

# Action Items & Status

01-vpc - Done
02-internet-gateway - Done
03-subnet - Done
04-eip-nat-gateway
04-route-table - WIP
05-security-group - WIP
06-jumpbox-EC2-instance - Working Done
07-RDS-instance
08-sql-commands
09-insert.sql



# References
https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/CHAP_GettingStarted.CreatingConnecting.MySQL.html
https://srinivish.hashnode.dev/securing-your-cloud-building-a-bastion-host-in-aws
https://www.youtube.com/watch?v=buqBSiEEdQc&t=251s