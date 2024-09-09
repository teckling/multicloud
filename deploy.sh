#!/bin/bash
export SCRIPT_ROOT_DIRECTORY=$(cd ${0%/*} && pwd -L )

source $SCRIPT_ROOT_DIRECTORY/deployment_code_library/aws.lib
source $SCRIPT_ROOT_DIRECTORY/deployment_code_library/azure.lib
source $SCRIPT_ROOT_DIRECTORY/deployment_code_library/google.lib
source $SCRIPT_ROOT_DIRECTORY/deployment_code_library/alibaba.lib

PRODUCT=$1
CLOUD=$2
REGION=$3
TENANT=$4
MODE=$5

TENANT_ENV_FOLDER=tenant_environment/$1/$2/$3/$4
echo 'deploying resources defined in ' $SCRIPT_ROOT_DIRECTORY/$TENANT_ENV_FOLDER
