resource "aws_instance" "web" {
  count = 3    # Creates same resource for multiple times  
  ami           = "ami-0440d3b780d96b29d" #value after argument(ami)
  instance_type = "t2.micro" #value after argument(instance_type)
  vpc_security_group_ids = [ aws_security_group.main.id ] #attribute ID for security group
  tags = {
    Name        = "${var.env}-instance"     #dev-instance, qa-instance, stage-instance, prod-instance
    Environment = var.env          #Reference to input variable var.variable_name
    # Add more tags as needed
    }
    lifecycle {    # Meta-argument to create the new resource before destroying old. to prevent downtime
      create_before_destroy = true
    }
}

### HashiCorp Language
##Terraform##
##2 Main Blocks
    # 1.Resource = Block
    # 2.Data_source = Block

#resource = block
    # Resource block is to designed to create and manage resources.

# aws_instance= first label - indicates what resource needs to be created
    # (defined by terraform )

# web = second_label - logical name or logical id for the resource. 
    # Keep in mind it is a resource name. (defined by author)
    # Logical name must be unique

# ami, instance_type = arguments (configurations)
    # (defined by Terraform)

# Argument values are known BEFORE you create the resource(AMI ID etc..)
# Attribute values are known AFTER you create the resource(Resource ID, ARN etc..)

## Working Directory ##
# This directory is a place where you declare all the .tf files 
# and execute your TF commands

#Terraform init
# Initializes the working directory
# Terraform Folder is the working directory
# will read every .tf file in this directory

#Terrafom Reference to Resource
# firstlabel_secondlabel.attribute
# References do not need "". Reference to Resource and and Reference to named values never use ""
