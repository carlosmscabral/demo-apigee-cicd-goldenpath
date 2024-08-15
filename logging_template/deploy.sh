#!/bin/bash

project=cabral-apigee
apigeecli prefs set -o $project
token=$(gcloud auth print-access-token)
apigeecli token cache -t $token
ENV=dev
PROXY_NAME=novo-proxy
SA=apigee-proxy-service-account@cabral-apigee.iam.gserviceaccount.com

apigeecli apis create bundle -e $ENV -n $PROXY_NAME --sa $SA -p newproxy.zip --wait --ovr