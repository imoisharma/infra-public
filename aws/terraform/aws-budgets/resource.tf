# This Budgets TF module will need to improve to meet Licode standards.

terraform {
  backend "s3" {
    bucket = "sharmio-tf-backend-ap-southeast-2"
    key    = "sharmio/staging/budgets/aws-budgets-reports.tfstate"
    region = "ap-southeast-2"
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
  #terraform version
  required_version = ">=1.5.0"
}


resource "aws_budgets_budget" "myBudget" {
  account_id        = "412088913008"
  budget_type       = "COST"
  limit_amount      = "200.0"
  limit_unit        = "USD"
  name              = "My_Monthly_Cost_Budget"
  name_prefix       = null
  time_period_end   = "2087-06-15_00:00"
  time_period_start = "2024-02-01_00:00"
  time_unit         = "MONTHLY"
  cost_types {
    include_credit             = false
    include_discount           = true
    include_other_subscription = true
    include_recurring          = true
    include_refund             = false
    include_subscription       = true
    include_support            = true
    include_tax                = true
    include_upfront            = true
    use_amortized              = false
    use_blended                = false
  }
  notification {
    comparison_operator        = "GREATER_THAN"
    notification_type          = "ACTUAL"
    subscriber_email_addresses = ["imoisharma@gmail.com"]
    subscriber_sns_topic_arns  = []
    threshold                  = 100
    threshold_type             = "PERCENTAGE"
  }
  notification {
    comparison_operator        = "GREATER_THAN"
    notification_type          = "ACTUAL"
    subscriber_email_addresses = ["imoisharma@gmail.com"]
    subscriber_sns_topic_arns  = []
    threshold                  = 85
    threshold_type             = "PERCENTAGE"
  }
  notification {
    comparison_operator        = "GREATER_THAN"
    notification_type          = "FORECASTED"
    subscriber_email_addresses = ["imoisharma@gmail.com"]
    subscriber_sns_topic_arns  = []
    threshold                  = 100
    threshold_type             = "PERCENTAGE"
  }
}
