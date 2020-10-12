const ExcelJS = require('exceljs');
const { v4: uuid } = require('uuid');
const fs = require('fs');

async function main(){
  var fileName='/data/app/toevla-latest.xlsx';
  var sheetName='IMPORT';

  var workbook = new ExcelJS.Workbook();
  await workbook.xlsx.readFile(fileName);
  var worksheet=workbook.getWorksheet(sheetName);

  var baseUrl='https://data.toevla.org/id/concepts/';
  var range={start: 5, end: 332};

  var cell;
  
  for(var i=range.start; i<range.end; i++){
    cell=worksheet.getCell('BJ'+i);
    var id=uuid();
    
    if(cell.text==''){
      cell.value = {
        text: baseUrl+id,
        hyperlink: baseUrl+id,
        tooltip: baseUrl+id
      };
    }
  }

  try {
    await workbook.xlsx.writeFile(fileName);
  } catch(e) {
    console.log(e);
  }
}
try {
  main();
} catch(e) {
  console.log(e);
}
