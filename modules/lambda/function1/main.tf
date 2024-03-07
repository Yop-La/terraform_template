provider "aws" {
  region = "us-east-1" # Choisissez la région appropriée
}

module "lambda_function" {
  source  = "terraform-aws-modules/lambda/aws"

  function_name = "lambda_function"
  handler       = "lambda_function.handler" # Le nom de votre fichier et la fonction
  runtime       = "python3.11"
  source_path = {
    path = "${path.root}/../../src/lambda_function",
    pip_requirements = true
  }

    layers = [
    "arn:aws:lambda:us-east-1:336392948345:layer:AWSSDKPandas-Python311:9"
     # Remplacez par l'ARN de votre layer
  ]

  # Tags, environnement et autres configurations peuvent être ajoutés ici
}
