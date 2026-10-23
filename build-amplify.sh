#!/bin/bash
# Script to package web assets for AWS Amplify manual deployment
echo "Packaging EventHub for AWS Amplify..."
cd src/main/webapp
zip -r ../../../amplify-deploy.zip . -x "WEB-INF/*" -x "META-INF/*" -x "*.DS_Store*"
cd ../../..
echo "Done! Deployment zip created at: amplify-deploy.zip"
