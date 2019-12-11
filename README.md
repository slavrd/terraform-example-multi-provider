# Terraform example: multi provider

A simple terraform project to demonstrate the use of multiple provider configurations within a terraform module.

The projects creates two AWS S3 buckets in two different AWS regions. The regions are passed by the user via input variables. One of them is used in the default aws provider and the other in an alternate aws provider configuration.

## Prerequisites

* Install [terraform](https://www.terraform.io/downloads.html) `>=0.12`

## Running the example

* Initialize `terraform init`
* Run terraform, providing the two AWS regions. For example
  
  ```Bash
  terraform apply \
    -var aws_region_default=us-east-1 \
    -var aws_region_2=us-east-2
  ```

* Confirm that the two buckets are created and are in the two provided regions e.g. using the AWS console.
* Destroy the created resources, providing the same AWS regions. For example:

  ```Bash
  terraform destroy \
    -var aws_region_default=us-east-1 \
    -var aws_region_2=us-east-2
  ```
