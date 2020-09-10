#! /bin/bash
npm install;
node ./parse.js;
node ./generateTtl.js;
echo "script generated ./generated.ttl"
