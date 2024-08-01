#!/bin/bash

websites=(
    "https://google.com"
    "https://facebook.com"
    "https://twitter.com"
)

log_file="website_status.log"

> $log_file

for site in "${websites[@]}"; do
    response=$(curl -s -o /dev/null -w "%{http_code}" $site)
    if [ $response -eq 200 ]; then
        echo "$site is UP" | tee -a $log_file
    else
        echo "$site is DOWN" | tee -a $log_file
    fi
done

echo "Results have been recorded in $log_file"
