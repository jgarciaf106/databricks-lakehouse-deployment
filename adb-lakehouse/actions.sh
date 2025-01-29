#!/bin/bash

PLAN_FILE="tfplan"
COMMON_ARGS=(
    -no-color
    -input=false
)

INIT_VARS=(
    -backend-config="resource_group_name=$BACKEND_RG_NAME"
    -backend-config="storage_account_name=$BACKEND_SA_NAME"
    -backend-config="container_name=$BACKEND_CONTAINER_NAME"
    -backend-config="key=$BACKEND_KEY"
)

VAR_ARGS=(
    -var="azure_subscription_id=$AZURE_SUBSCRIPTION_ID"
    -var="azure_tenant_id=$AZURE_TENANT_ID"
    -var="azure_client_id=$AZURE_CLIENT_ID"
    -var="azure_client_secret=$AZURE_CLIENT_SECRET"
    -var="account_id=$DATABRICKS_ACCOUNT_ID"
    -var="databricks_workspace_name=andresg-az-lab-ws"
    -var="environment_name=dev"
    -var="location=eastus2"
    -var="managed_resource_group_name=andresg.mrg"
    -var="metastore_name=andresg-az-lab-ms"
    -var="project_name=andresg-az-lab"
    -var="resource_group_name=andresg.rg"
    -var="private_subnet_address_prefixes=[\"16.0.1.0/24\"]"
    -var="public_subnet_address_prefixes=[\"16.0.2.0/24\"]"
    -var="vnet_address_space=16.0.0.0/22"
    -var="storage_account_names=[\"andresgazlabadls\"]"
    -var="tags={\"owner\" : \"andres.garcia@databricks.com\"}"
    -var="dev_team=[\"andres.garcia@databricks.com\"]"
)

case "$1" in
fmt)
    terraform fmt -check
    ;;
init)
    # shellcheck disable=SC2068
    terraform init "${COMMON_ARGS[0]}" ${INIT_VARS[@]}
    ;;
validate)
    terraform validate "${COMMON_ARGS[0]}"
    ;;
plan)
    terraform plan "${COMMON_ARGS[0]}" "${VAR_ARGS[@]}" -lock=false -out="$PLAN_FILE"
    ;;
apply)
    terraform apply "${COMMON_ARGS[0]}" "$PLAN_FILE"
    ;;
destroy)
    terraform destroy "${COMMON_ARGS[0]}" "${VAR_ARGS[@]}"  -auto-approve -lock=false
    ;;
*)
    echo "Invalid argument. Use 'fmt', 'init', 'validate', 'plan', 'apply', 'destroy'."
    exit 1
    ;;
esac


