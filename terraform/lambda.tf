resource "aws_lambda_function" "terraform_function" {
  function_name    = "terraformFunction"
  filename         = "../bin/terraformFunction.zip"
  handler          = "main"
  source_code_hash = filebase64sha256("../bin/terraformFunction.zip")
  role             = "fake_role"
  runtime          = "go1.x"
  timeout          = 5
  memory_size      = 128
}
