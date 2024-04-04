module "lambda_function1" {
  source = "../../modules/lambda/template"
  environment   = var.environment
  function_name = "my-first-lambda-function"
}
