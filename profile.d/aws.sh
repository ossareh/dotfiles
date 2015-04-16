# aws
AWS_AUTH=~/.aws/id.auth
if [ -f ${AWS_AUTH} ]; then
    source ${AWS_AUTH}
fi
