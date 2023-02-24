# Terraform workspaces.

provider "aws" {
  region = "ap-south-1"
}

locals {
  instance_name = "${terraform.workspace}-instance" 
}

resource "aws_instance" "ec2_example" {

    ami = "ami-0f8ca728008ff5af4" 

    instance_type = "t2.micro"

    tags = {
      Name = local.instance_name
    }
}




# Command to list down workspaces : terraform workspace list
# Command to create a workspace :  terraform workspace new name_of_workspace
# Command to show active workspace : terraform workspace show
# Command to switch between terraform workspace : terraform workspace select name_of_workspace_which_to_be_switched
# ${terraform.workspace}= provides workspace name