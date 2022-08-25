## Elastic Beanstalk Environment Module
### Version 1
This module will create an 
1. elastic beanstalk environment and configure https. 
2. Setup Security groups that allow inbound on 443 to the load balancer 
3. Configure Security group that allows traffic to flow securely from the load balancer to the service.

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
| auto_scaling_instance_type | | EC2 type used by EB Environment e.g. t2.small |
| instance_type_family | | EC2 instance family type used by EB Environment e.g. t2|
| instance_types | | EC2 instance types allowed to be provisioned by EB Environment| 
| enable_cross_zone_lb | false | Allow Load Balancer to balancer across AZ's |
| health_check_path | /health | Path used for health check |
| solution_stack_name | | Solution stack used by EB Environment |
| subnets | | Subnet EB Environment will run in|
| ssl_cert | | SSL cert used for traffic on port 443 |
| elb_scheme | | Schema used by EB Environment | 
| service_role | | IAM role used by EB Environment | 
| deployment_policy | Rolling | Deployment policy used by EB Environment |
| ssh_source_restriction | tcp,22,22,34.200.4.86/32 | port and IP restrictions by EB Environment EC2 |
| default_ssh_port | 22 | Port used for ssh |
| availability_zone | ANY | AZ's used for auto scaling |
| auto_scaling_min | 1 |  Min number of running instances |
| auto_scaling_max | 2 | Max number of running instances |
| auto_scaling_scale_down_increment | -1 | Amount decreased by at a time when scaling down|
| auto_scaling_scale_up_increment | 1 | Amount increased by at a time when scaling up|
| rollback_on_failure |  true | Roll back if deployment to EB Environment fails |
| environment_variables | | Map of EB Environment's environment variables |
| logs_delete_on_terminate | true | delete logs when EB envrionment is terminated |
| enable_stream_logs | true | Allow EB Environment logs to be streamed to cloudwatch|
| connection_idle_time_out| 60| Load balancer timeout |