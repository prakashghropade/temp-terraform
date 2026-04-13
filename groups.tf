resource "aws_iam_group" "sales" {
  name = "Sales"
  path = "/groups/"
}

resource "aws_iam_group" "reception" {
    name = "Reception"
    path = "/groups/"
}

resource "aws_iam_group" "accounting" {
    name = "Accounting"
    path = "/groups/"
}

resource "aws_iam_group_membership" "sales_mambers" {
  name = "sales-group-membership"

  users = [
    for user in aws_iam_user.users : user.name if user.tags.Department == "Sales" 
  ]

  group = aws_iam_group.sales.name
}

resource "aws_iam_group_membership" "reception_members" {
    name = "reception-group-membership"
    group = aws_iam_group.reception.name

    users = [
        for user in aws_iam_user.users : user.name if user.tags.Department == "Reception"
    ]
}

resource "aws_iam_group_membership" "accounting_members" {
    name = "accounting-grop-membership"
    group = aws_iam_group.accounting.name
    users = [
        for user in aws_iam_user.users : user.name if user.tags.Department == "Accounting"
    ]
}