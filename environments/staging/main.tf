module "lambda_function1" {
  source = "../../modules/lambda/template"
  function_name = "my-first-lambda-function"
  environment   = var.environment
}
