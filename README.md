# Readme about this project


For terraform with love

## Run project

Use the terraform [download](https://developer.hashicorp.com/terraform/downloads) to run project.

```bash

wget https://releases.hashicorp.com/terraform/1.4.6/terraform_1.4.6_linux_amd64.zip

unzip terraform_1.4.6_linux_amd64.zip

sudo mv terraform /usr/bin/terraform
```

## Usage

```hcl
#Resource initialize
terraform init

# Resource planning
terraform plan

# Resource Apply
terraform apply --auto-approve

# Destroy resources
terraform destroy
```


## License

[MIT](https://choosealicense.com/licenses/mit/)
