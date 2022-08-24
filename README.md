# envase-terraform-demo

Simple terraform module and stack to create an 
Elastic Beanstalk Application
Elastic Beanstalk Environment


# How To Run
If you are running infrastructure that is for a specific environment please follow the instruction below.
For each environment you have you will need to run the following commands in the following order:

1. terraform init -backend-config="key=<application-name>/<environment>/terraform.tfstate" -reconfigure
2. terraform plan -var-file="./variables/${environment}.tfvars"
3. terraform apply -var-file="./variables/${environment}.tfvars" -auto-approve


