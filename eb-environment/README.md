## Elastic Beanstalk Environment Module
### Version 1

## Module Variables

| Variable Name | Default Value | Description |
| :--: | :--: | :--: |
| environment_name |  | Name of EB Environment |
| application_name |  | Name of EB Application |
| tier |  WebServer | Type of EB tier (Worker, WebServer) |
| vpc_id | | VPC your EB Application will run in |
| enable_public_ip |  | If your EB server should have a public IP |
| environment_type | | Type of EB environment e.g. LoadBalanced |
| lb_type | application | Type of Load Balancer e.g. application, classic |
| key_pair | | Key pair used to SSH onto server |
| ami_id | | Id of AMI used by EB Environment |