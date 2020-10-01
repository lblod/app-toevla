//strip spaces on identifier columns
//relevancy columns from BR to P
//q defines relevancy make some shit up
//r defines display type 
//tags au-ba
//bb comment for data
//utility vars
const xlsx = require('xlsx');
const { v4: uuid } = require('uuid');
const fs = require("fs");

const fileName = '/data/app/toevla-latest.xlsx';
var sheetName='Moederdoc_Aad_aanvInter25-09-20';

const excel = xlsx.readFile(fileName);
var sheet=xlsx.utils.sheet_to_json(excel.Sheets[sheetName], {"header":1});

var parsedTree=[
];

//columns where the tree nodes are located fill out appropriately
var nodeColumns=[
  {column:1, parent:'root', order: -1}, 
  {column:38, parent:'', order: 0}, 
  {column:39, parent:'', order: 0}, 
  {column:40, parent:'', order: 0}, 
  {column:41, parent:'', order: 0}, 
  {column:42, parent:'', order: 0}
];

//other columns that are relavant
var infoColumns={
  relevant: 15, //relevant for parser
  relevantForScore: 16, //relevant for scoring
  compulsoryCriteria: 17,  //compulsory for scoring
  displayType: 18, //how things should be displayed
  criteriaType: 19, //title or criteria
  type: 20, //type of property bool/text... etc
  trueComment: 46,  //true comment
  falseComment:49,  //false comment
  uri: 61  //uri identifier 
};

//utility variables
var prevColumnIndex=nodeColumns[0].column;
var prevNode={};
var order=0;

//get uuid out of uri
function parseUuid(uri){
  var match=uri.match(/https:\/\/data\.toevla\.org\/id\/concepts\/(.+)/);
  return match[1];
}
//iterate over relevant rows
for(var rowIndex=7; rowIndex<sheet.length; rowIndex++){
  
  var row=sheet[rowIndex];
  if(row[infoColumns.relevant] && row[infoColumns.relevant].toLowerCase().replace(/\s/g, '')=='ja'){
    
    //iterate over relevant columns
    for(var nodeColumnIndex=0; nodeColumnIndex<nodeColumns.length; nodeColumnIndex++){
      var columnIndex=nodeColumns[nodeColumnIndex].column;
      const cell=row[columnIndex];

      if(cell){
        //init and get info columns
        var node={
          label: cell,
          parent: 'root',
          uuid: parseUuid(row[infoColumns.uri]),
          uri: row[infoColumns.uri],

          relevant: row[infoColumns.relevant], //relevant for parser
          relevantForScore: row[infoColumns.relevantForScore], //relevant for scoring
          compulsoryCriteria: row[infoColumns.compulsoryCriteria],  //compulsory for scoring
          displayType: row[infoColumns.displayType], //how things should be displayed
          criteriaType: row[infoColumns.criteriaType], //title or criteria
          type: row[infoColumns.type], //type of property bool/text... etc
          trueCommentOriginal: row[infoColumns.trueComment],  //true comment
          falseCommentOriginal: row[infoColumns.falseComment],  //false comment

          order: 0
        };
        if(row[infoColumns.type]=="Ja/Nee"){
          var trueCell=row[infoColumns.trueComment];
          var falseCell=row[infoColumns.falseComment];
          
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
