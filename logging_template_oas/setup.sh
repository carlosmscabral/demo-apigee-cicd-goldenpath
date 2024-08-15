#!/bin/bash

apigee-go-gen transform apiproxy-to-yaml -i ./template-source_rev2_2024_08_15.zip -o template.yaml

# separate policy section into a separate file and use $ref

# manually update the YAML file for proxy name, basepath

apigee-go-gen render apiproxy \
    --template ./template.yaml \
    --include ./*.tmpl \
    --set-oas spec=./openapi.yaml \
    --output ./newproxy.zip \
    --set "basepath=/face-recognition/v1" \
    --set "apiName=face-v1" \
    --validate false