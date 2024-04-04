module "lambda_function1" {
  source = "../../modules/lambda/function1"
  environment   = var.environment
  function_name = "my-first-lambda-function"
}
