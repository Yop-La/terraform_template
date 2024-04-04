module "lambda_function1" {
  source = "../../modules/lambda/function1"
  function_name = "my-first-lambda-function"
  environment   = var.environment
}
