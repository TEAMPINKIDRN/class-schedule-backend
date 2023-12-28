#!/bin/bash

S3_BUCKET="s3://databases-backups56/backup-dump-files/"
LOCAL_DIR="/root/dumpfiles"
MAX_FILES=10

uploaded_files=$(aws s3 ls ${S3_BUCKET}/ | awk '{print $4}')

for dump_file in ${LOCAL_DIR}/*.sql; do
    filename=$(basename ${dump_file})

    if ! echo "${uploaded_files}" | grep -q "${filename}"; then
        aws s3 cp ${dump_file} ${S3_BUCKET}/

        echo "${filename} uploaded to S3"

        uploaded_files=$(aws s3 ls ${S3_BUCKET}/ | awk '{print $4}')

        current_count=$(echo "${uploaded_files}" | wc -l)

        if [ "${current_count}" -gt "${MAX_FILES}" ]; then
            files_to_delete=$(echo "${uploaded_files}" | sort | head -n $((${current_count} - ${MAX_FILES})))
            for file_to_delete in ${files_to_delete}; do
                aws s3 rm ${S3_BUCKET}/${file_to_delete}
                echo "Deleted older file: ${file_to_delete}"
            done
        fi
    else
        echo "${filename} already uploaded to S3"
    fi
done