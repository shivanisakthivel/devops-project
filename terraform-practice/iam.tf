resource "aws_iam_user" "user1" {
  name = "devproject"
  path = "/"

  tags = {
    tag-key = "project-hands-on"
  }
}
