#!/bin/sh
cd "$(dirname "$0")"
pwd

ls -la

## Gather information
SPARQL_ENDPOINT="http://db:8890/sparql"
TEMPLATE_FILE="$1.sparql"
TARGET_FILE="execution.sparql"
CONTENT="$2"
# see https://stackoverflow.com/questions/407523/escape-a-string-for-a-sed-replace-pattern
ESCAPED_CONTENT=$(printf '%s\n' "$CONTENT" | sed -e 's/[\/&]/\\&/g')

## Fill in the template
rm -f $TARGET_FILE
cp $TEMPLATE_FILE $TARGET_FILE
sed -i -e "s/REPLACE/$ESCAPED_CONTENT/g" $TARGET_FILE

## Echo the target query
cat $TARGET_FILE

## Send the target query
# see https://stackoverflow.com/questions/46708726/how-to-send-a-sparql-curl-request-based-on-a-query-file

curl -vv --data-urlencode "query@$TARGET_FILE" -H 'Content-Type: application/x-www-form-urlencoded' -H 'mu-auth-sudo: true' $SPARQL_ENDPOINT
