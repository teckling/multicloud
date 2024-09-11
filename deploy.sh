#!/bin/bash
export SCRIPT_ROOT_DIRECTORY=$(cd ${0%/*} && pwd -L )

source $SCRIPT_ROOT_DIRECTORY/deployment_code_library/aws_lib.sh
source $SCRIPT_ROOT_DIRECTORY/deployment_code_library/azure_lib.sh
source $SCRIPT_ROOT_DIRECTORY/deployment_code_library/google_lib.sh
source $SCRIPT_ROOT_DIRECTORY/deployment_code_library/alibaba_lib.sh

PRODUCT=$1
CLOUD=$2
REGION=$3
TENANT=$4
MODE=$5

#define specific tenant folder
TENANT_ENV_VARIABLE_SPECIFICATION=tenant_environment/$1/$2/$3/$4

#each tenant environment desired configuration is stored in tenant_environment_input_specification.cfg
source $SCRIPT_ROOT_DIRECTORY/$TENANT_ENV_VARIABLE_SPECIFICATION/tenant_environment_input_specification.cfg

#each tenant environment existing infrastructure setup is stored in tenant_environment_resulting_state.output
source $SCRIPT_ROOT_DIRECTORY/$TENANT_ENV_VARIABLE_SPECIFICATION/tenant_environment_resulting_state.output

echo 'deploying additional resources defined in ' $SCRIPT_ROOT_DIRECTORY/$TENANT_ENV_VARIABLE_SPECIFICATION/tenant_environment_input_specification.cfg

create_vpc
