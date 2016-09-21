#!/bin/sh

# Static parameters
WORKSPACE=$PWD
BOX_PLAYBOOK=$WORKSPACE/playbooks/roles/create-vpc/bin/network_create.yml
BOX_NAME=awsnetwork

echo $BOX_NAME

prudentia local <<EOF
unregister $BOX_NAME
register
$BOX_PLAYBOOK
$BOX_NAME

verbose 4

set env demo
set aws_region us-east-1

envset AWS_ACCESS_KEY_ID YOUR_ACCESS_KEY
envset AWS_SECRET_ACCESS_KEY YOUR_SECRET_ACCESS_KEY

provision $BOX_NAME

unregister $BOX_NAME
EOF
