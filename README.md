# Terraform-Practise
This is a terraform learning repo were we will try to implement terraform with aws and azure clouds
####################################################################################################

MOTO/GOAL : I need to create an IAM user who requires both read and write access to a specific S3 bucket. This user should be able to access the bucket using the AWS CLI. Additionally, I need to share login credentials with this user.

### Step 1: Create an IAM user and attach the necessary policies to the user via group.
For this we will create a user and the policies will be attached to the group not for the user.

for this we will be creating couple of files like 

Provider.tf :

This is a file were we will be defining the provider details and which version that need to be.

Resource.tf
This is a file, were we will be creating the iam user, group, policies,adding them as per our requirnemnt.

Output:

terraform output Terraform-user-Access-key-id
AKIAIOSFODNN7EXAMPLE

$ terraform output Terraform-user-Access-key-secret
<secret key will be displayed here>