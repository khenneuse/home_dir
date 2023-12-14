#!/bin/bash

declare -a FUNCTIONS=(
    "api-createEntitiesInSalesforce"
    "api-createOpportunityOnNewRequest"
    "api-getCRMOpportunityDataByOpportunityIds"
    "api-syncSalesforceActionToFB")


for FUNCTION_NAME in "${FUNCTIONS[@]}"; do
    echo $FUNCTION_NAME
  # gcloud functions deploy $FUNCTION_NAME \
  #   --runtime nodejs16 \
  #   --update-secrets 'SF_CLIENT_ID=SF_CLIENT_ID:latest,SF_CLIENT_SECRET=SF_CLIENT_SECRET:latest,SF_USERNAME=SF_USERNAME:latest,SF_PASSWORD=SF_PASSWORD:latest,SF_SECURITY_TOKEN=SF_SECURITY_TOKEN:latest'

done
