#! /bin/bash
CLEAR_TREE_TIMESTAMP=`date +%Y%m%d%H%M%S`;
npm install;
node ./parse.js;
node ./generateTtl.js;
echo "script generated ./generated.ttl"
NEW_TREE_TIMESTAMP=`date +%Y%m%d%H%M%S`;
echo "Creating clear migrations";
cp ./clear_migration_template.sparql /data/app/config/migrations/$CLEAR_TREE_TIMESTAMP-clear-old-tree.sparql
cp /data/app/generated.ttl /data/app/config/migrations/$NEW_TREE_TIMESTAMP-new-tree.ttl
echo "http://mu.semte.ch/graphs/public" > /data/app/config/migrations/$NEW_TREE_TIMESTAMP-new-tree.graph
echo ""
echo "Created migrations:
 - ./config/migrations/$CLEAR_TREE_TIMESTAMP-clear-old-tree.sparql
 - ./config/migrations/$NEW_TREE_TIMESTAMP-new-tree.ttl
 - ./config/migrations/$NEW_TREE_TIMESTAMP-new-tree.graph"
