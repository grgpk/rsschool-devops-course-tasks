resource "aws_iam_role" "GithubActionsRole" {
  name = "GithubActionsRole"

  assume_role_policy = jsonencode({
    "Version" : "2012-10-17",
    "Statement" : [
      {
        "Effect" : "Allow",
        "Principal" : {
          "Federated" : var.aws_oidc_provider
        },
        "Action" : "sts:AssumeRoleWithWebIdentity",
        "Condition" : {
          "StringLike" : {
            "token.actions.githubusercontent.com:aud" : "sts.amazonaws.com",
            "token.actions.githubusercontent.com:sub" : [
              "repo:grgpk/rsschool-devops-course-tasks:ref:refs/heads/*",
              # "repo:grgpk/rsschool-devops-course-tasks:ref:refs/heads/test"
            ]
          }
        }
      }
    ]
  })

  tags = {
    tag-key = "rs-devops-task-01"
  }
}


