# we are creating a group were this group contains the s3 bucket read and write policies, 
# So whoever added in this group will be granted the access as per the above

resource "aws_iam_group" "Terraform-Group" {
    name = "Terraform-Group"
    # The group name is Terraform-Group
}
output "Terraform-Group-output" {
    value = aws_iam_group.Terraform-Group
    # This is the output block were it shows the output
}
resource "aws_iam_policy" "Terraform-Group-policy" {
    # This is the policy name and description
    name        = "Terraform-Group-policy"
    description = "Terraform-Group-policy were it grants the s3 bucket read and write access"
    policy      = <<EOF
    {
    "Version": "2012-10-17",
  "Statement": [
    {
      "Sid": "AllowS3ReadWrite",
      "Effect": "Allow",
      "Action": [
        "s3:GetObject",
        "s3:PutObject",
        "s3:DeleteObject",
        "s3:ListBucket"
      ],
      "Resource": [
        "arn:aws:s3:::my-bucket",
        "arn:aws:s3:::my-bucket/*"
      ]
    }
  ]
    }
  EOF
}
# This is the policy attachment block were it attaches the policy to the group
resource "aws_iam_group_policy_attachment" "Terraform-Group-policy-attachment" {
    # This is the group name and policy name
    group      = aws_iam_group.Terraform-Group.name
    policy_arn = aws_iam_policy.Terraform-Group-policy.arn
}
# This is the output of the policy group
output "Terraform-Group_policy-attachment-output" {
    value = aws_iam_group_policy_attachment.Terraform-Group-policy-attachment
}
# This is the user creation part
resource "aws_iam_user" "Terraform-user" {
    name = "Terraform-user"
}
# this is the output of user creation
output "Terraform-user-output" {
    value = aws_iam_user.Terraform-user
}
# This is a stage were we wil be adding the user into the group
resource "aws_iam_user_group_membership" "Terraform-user-addtion" {
    user = aws_iam_user.Terraform-user.name
    groups = [ aws_iam_group.Terraform-Group.name ] 
}
output "Terraform-user-addtion-output" {
    value = aws_iam_user_group_membership.Terraform-user-addtion 
}
# This is a stage were we need to provide the username and key for the iam user we have createdcheck "name" {
  resource "aws_iam_access_key" "Terraform-user-Access-key" {
    user = aws_iam_user.Terraform-user.name
  }
  output "Terraform-user-Access-Key-output" {
    value = aws_iam_access_key.Terraform-user-Access-key.id
    
  }
  output "Terraform-user-Access-key-secret-output" {
    value = aws_iam_access_key.Terraform-user-Access-key.secret
    sensitive = true
    
  }
  