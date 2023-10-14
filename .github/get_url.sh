#!/bin/bash

set -e

url="https://developer.x-plane.com/sdk/plugin-sdk-downloads"
file="index.html"

wget -O "${file}" "${url}"

# Extract the first URL that ends in '.zip'
zip_url="http:$(grep -io '<a href=['"'"'"][^"'"'"']*['"'"'"]' "${file}" | \
                sed -e 's/^<a href=["'"'"']//i' -e 's/["'"'"']$//i' | \
                grep -i '\.zip$' | \
                head -n1)"

# Get only the filename of the zip-file
tag=$(echo ${zip_url} | sed -E 's/^.*\/([a-zA-Z0-9\,\.\-\_]+)\.zip$/\1/g')

echo ${zip_url}
echo ${tag}
