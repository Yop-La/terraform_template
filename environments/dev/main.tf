module "lambda_function1" {
  source = "../../modules/lambda/function1"
  # Ajoutez ici les variables spécifiques au module, si nécessaire
  function_name = "my-first-lambda-function-dev"
}
