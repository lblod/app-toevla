//utility vars
const xlsx = require('xlsx');
const { v4: uuid } = require('uuid');
const fs = require("fs");
const { SSL_OP_SSLEAY_080_CLIENT_DH_BUG } = require('constants');

const fileName = './toevla-latest.xlsx';
var sheetName='Moederdoc_29-06-2020';

const excel = xlsx.readFile(fileName);
var sheet=xlsx.utils.sheet_to_json(excel.Sheets[sheetName]);

var parsedTree=[
];

//columns where the tree nodes are located fill out appropriately
var nodeColumns=[
  {column:1, parent:'root', order: -1}, 
  {column:25, parent:'', order: 0}, 
  {column:26, parent:'', order: 0}, 
  {column:27, parent:'', order: 0}, 
  {column:28, parent:'', order: 0}, 
  {column:29, parent:'', order: 0},
  {column:30, parent:'', order: 0},
  {column:31, parent:'', order: 0}
];

//other columns that are relavant
var infoColumns={type: 20, trueComment: 35, falseComment:37, uri: 48, relevant: 49};

//utility variables
var prevColumnIndex=nodeColumns[0].column;
var prevNode={};
var order=0;

//get uuid out of uri
function parseUuid(uri){
  var match=uri.match(/https:\/\/data\.toevla\.org\/id\/concepts\/(.+)/);
  return match[1];
}

//iterate over relevant columns
for(var rowIndex=6; rowIndex<sheet.length; rowIndex++){
  var row=sheet[rowIndex];

  if(row['__EMPTY_'+infoColumns.relevant]=='V'){
    
    for(var nodeColumnIndex=0; nodeColumnIndex<nodeColumns.length; nodeColumnIndex++){
      var columnIndex=nodeColumns[nodeColumnIndex].column;
      cell=row['__EMPTY_'+columnIndex];

      if(cell){
        //init and get info columns
        var node={
          label: cell,
          parent: 'root',
          uuid: parseUuid(row['__EMPTY_'+infoColumns.uri]),
          uri: row['__EMPTY_'+infoColumns.uri],
          order: 0
        };
        if(row['__EMPTY_'+infoColumns.type]=="Ja/Nee"){
          var trueCell=row['__EMPTY_'+infoColumns.trueComment];
          var falseCell=row['__EMPTY_'+infoColumns.falseComment];
          
          if(trueCell && trueCell!='' && trueCell!='geen weergave'){
            node.trueComment=trueCell;
          }
          
          if(falseCell && falseCell!='' && falseCell!='geen weergave'){
            node.falseComment=falseCell;
          }
        }

        //parse tree structure
        if(columnIndex>prevColumnIndex){
          node.parent=prevNode.uri;
          nodeColumns[nodeColumnIndex].parent=prevNode.uri;

          nodeColumns[nodeColumnIndex].order=0;
          node.order=nodeColumns[nodeColumnIndex].order;
        }
        else if(columnIndex<prevColumnIndex){
          node.parent=nodeColumns[nodeColumnIndex].parent;
          
          nodeColumns[nodeColumnIndex].order++;
          node.order=nodeColumns[nodeColumnIndex].order;
        }
        else if(columnIndex==prevColumnIndex){
          node.parent=nodeColumns[nodeColumnIndex].parent;
          
          nodeColumns[nodeColumnIndex].order++;
          node.order=nodeColumns[nodeColumnIndex].order;
        }

        parsedTree.push(node);
        
        prevNode=node;
        prevColumnIndex=columnIndex;
      }
    }
  }
}
var toDisk=JSON.stringify(parsedTree, null, 2);

fs.writeFileSync("./parsedTree.json", toDisk);