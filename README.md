# envase-terraform-demo

Simple terraform module and stack to create an 
Elastic Beanstalk Application
Elastic Beanstalk Environment for nodejs application

# Getting started
  1. [Install AWS CLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
     1. **Important make sure you install CLI v2**
     2. Configure your cli access
     3. [Create a named profile](https://docs.aws.amazon.com/cli/latest/userguide/cli-configure-profiles.html)
        1. run `aws configure --profile`
     4. Verify you have set up your aws_access_key_id and aws_secret_access_key setup correctly by
        running the following command `cat ~/.aws/credentials` you should see something like so:
     
     5. 
     ```
     [your-profile-name]
        aws_access_key_id=test
        aws_secret_access_key=test
     ```
     5. verify access run the following command `aws sts get-caller-identity`
        it should output the following:
     
     ```
     {
     "UserId": "AXFAQ567RFGUYOL2MHNNX",
     "Account": "000000000000",
     "Arn": "arn:aws:iam::000000000000:user/ethan-local-dev"
     }
     ```
     
  2. [Install Terraform CLI](https://www.terraform.io/downloads)
  3. [Terraform Documentation](https://www.terraform.io/docs)

# Things to consider
You will need to change the vpc, subnets, acm cert outlined under `/variables/*`

# How To Run
If you are running infrastructure that is for a specific environment please follow the instruction below.
For each environment you will need to run the following commands in the following order:

1. `terraform init -backend-config="key=${application-name}/${environment}/terraform.tfstate" -reconfigure`
2. `terraform plan -var-file="./variables/${environment}.tfvars"`
3. `terraform apply -var-file="./variables/${environment}.tfvars" -auto-approve`

# Destroying your infrastructure 
1. `terraform init -backend-config="key=${application-name}/${environment}/terraform.tfstate" -reconfigure`
2. `terraform plan -destroy -var-file="./variables/${environment}.tfvars"`
3. `terraform destroy -var-file="./variables/${environment}.tfvars" -auto-approve`

