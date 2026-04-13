output "account_id" {
    value = data.aws_caller_identity.aws_user_data.account_id
    description = "This is the accound id of the aws user"
}

output "usernames" {
    value = [for user in local.users : "${user.first_name}-${user.last_name }"]
}

output "password" {
  value = {
    for user,prifle in aws_iam_user_login_profile.users_profile.user : user => "Password created - user must reset on first login"
  } 
  sensitive = true
}