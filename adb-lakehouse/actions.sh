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
    -var="azure_subscription_id=$ARM_SUBSCRIPTION_ID"
    -var="azure_tenant_id=$ARM_TENANT_ID"
    -var="azure_client_id=$ARM_CLIENT_ID"
    -var="azure_client_secret=$ARM_CLIENT_SECRET"
    -var="account_id=$DATABRICKS_ACCOUNT_ID"
    -var="databricks_client_id=$DATABRICKS_CLIENT_ID"
    -var="databricks_client_secret=$DATABRICKS_CLIENT_SECRET"
)

if [[ -n "$DEPLOYMENT_CONFIG" ]]; then
    while IFS= read -r line; do
        line=$(echo "$line" | sed 's/^[[:space:]]*//;s/[[:space:]]*$//')
        if [[ -n "$line" ]]; then
            VAR_ARGS+=("-var=\"$line\"")
        fi
    done <<< "$DEPLOYMENT_CONFIG"
fi

printf "%s\n" "${VAR_ARGS[@]}"

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


