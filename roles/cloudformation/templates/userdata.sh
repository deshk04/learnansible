#!/bin/bash


export ANSIBLE_LOG_PATH="/var/log/ansible.log"
export ENVIRONMENT=dev
export ANSIBLE_VAULT_PASSWORD_FILE="myansiblepassword"
# HOME=/root ansible-playbook -c local -i inventories/dev x80_deploy.yml -vvvvv

# export ANSIBLE_RETCODE=$?

# /opt/aws/bin/cfn-signal -e $ANSIBLE_RETCODE --stack x80-pipeline-dev --region ap-southeast-2

