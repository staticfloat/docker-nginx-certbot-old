#!/bin/sh

SOURCE_DIR=/etc/nginx/user.conf.d
TARGET_DIR=/etc/nginx/nginx.conf.d

echo "symlinking scripts from ${SOURCE_DIR} to ${TARGET_DIR}"

if [ ! -d "$SOURCE_DIR" ]; then
    echo "no ${SOURCE_DIR}, nothing to do."
else
    for conf in ${SOURCE_DIR}/*.conf; do
        echo "symlinking ${conf} to ${TARGET_DIR}"
        ln -s ${SOURCE_DIR}/${conf} ${TARGET_DIR}
    done
fi
