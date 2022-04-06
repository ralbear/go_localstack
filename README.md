# Go Localstack
A localstack setup using go

### Requirements



#### Install
 - AWS CLI [here](https://aws.amazon.com/cli/)

#### Configurations

  - Add `localstack` profile to our `AWS CLI` configuration on `~/.aws/credentials`

    ```
    [localstack]
    aws_access_key_id = fake
    aws_secret_access_key = fake
    region = ap-southeast-1
    ```

  - Add an alias to your terminal configuration to simplify your life (optional)  
    By default this is done adding the following line to `~/.bashrc`

      ```
      alias awslocal='aws --profile localstack --endpoint-url http://localhost:4566'
      ```
