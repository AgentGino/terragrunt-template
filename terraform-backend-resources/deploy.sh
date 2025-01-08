aws cloudformation deploy \
    --template-file terraform-backend.yaml \
    --stack-name terraform-backend \
    --capabilities CAPABILITY_NAMED_IAM