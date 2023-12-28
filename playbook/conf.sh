#!/bin/sh
file_path="/opt/nexus/sonatype-work/nexus3/admin.password"
your_variable=$(cat "$file_path")
new_pass="$1" http_port="$2" https_port="$3"


curl -u admin:$your_variable -X PUT \
   -H "Content-Type: text/plain" \
   -d "$new_pass" \
   "http://localhost:"$nexus_port"/service/rest/v1/security/users/admin/change-password"



curl -u admin:"$new_pass" -X POST \
   -H "Content-Type: application/json" \
   -d '{
     "name": "stage",
     "online": true,
     "storage": {
       "blobStoreName": "default",
       "strictContentTypeValidation": true,
       "writePolicy": "ALLOW"
     },
     "docker": {
       "v1Enabled": false,
       "forceBasicAuth": true
     }
   }' \
   "http://localhost:"$nexus_port"/service/rest/v1/repositories/docker/hosted"


curl -u admin:"$new_pass" -X PUT \
  -H "Content-Type: application/json" \
  -d '{
    "name": "stage",
    "online": true,
    "storage": {
      "blobStoreName": "default",
      "strictContentTypeValidation": true,
      "writePolicy": "ALLOW",
      "latestPolicy": false
    },
    "docker": {
      "v1Enabled": false,
      "forceBasicAuth": true,
      "httpPort": "'"${http_port}"'",
      "httpsPort": "'"${https_port}"'",
      "subdomain": null
    },
    "component": {
      "proprietaryComponents": false
    },
    "format": "docker",
    "type": "hosted"
  }' \
  "http://localhost:"$nexus_port"/service/rest/v1/repositories/docker/hosted/test"
