const ExcelJS = require('exceljs');
const { v4: uuid } = require('uuid');
const fs = require('fs');

const columns = {
  nodeURI: 'BJ',
  tag1URI: "BT",
  tag2URI: "BU",
  tag3URI: "BV",
  conceptSchemeURI: "BW",
  criteriumType: 'U'
};

const baseURIs = {
  nodeURI: 'https://data.toevla.org/id/concepts/',
  tagURI: 'https://data.toevla.org/id/concepts/',
  conceptSchemeURI: 'https://data.toevla.org/id/concept-schemes/'
};

async function main(){
  const fileName='/data/app/toevla-latest.xlsx';
  const sheetName='IMPORT';

  var workbook = new ExcelJS.Workbook();
  await workbook.xlsx.readFile(fileName);
  var worksheet=workbook.getWorksheet(sheetName);

  var range={start: 5, end: 332};

  for(var i=range.start; i<range.end; i++){
    ensureNodeURI( worksheet, i );
    ensureTagURIs( worksheet, i );
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

/**
 * Ensures the tree-node's URI is set.
 */
function ensureNodeURI( worksheet, row ) {
  ensureCellURI( {
    cellId: columns["nodeURI"] + row,
    baseURI: baseURIs["nodeURI"],
    worksheet
  });
}

/**
 * Ensures the tag URIs are set for multiple-choice URIs.
 */
function ensureTagURIs( worksheet, row ) {
  const criteriumType =
        worksheet
        .getCell(columns.criteriumType + row)
        .text;
  
  if( criteriumType == "Keuzelijst" ) {
    ensureCellURI( {
      cellId: columns["conceptSchemeURI"] + row,
      baseURI: baseURIs["conceptSchemeURI"],
      worksheet
    });
    for( const tag of ["tag1URI", "tag2URI", "tag3URI"] ) {
      // we need to ensure we have the four other columns in the sheet
      ensureCellURI( {
        cellId: columns[tag] + row,
        baseURI: baseURIs["tagURI"],
        worksheet
      });
    }
  }
}

function setCellHyperlink( cell, content ) {
  cell.value = {
    text: content,
    hyperlink: content,
    tooltip: content
  };
}

function ensureCellURI( { cellId, baseURI, worksheet } ) {
  const cell = worksheet.getCell( cellId );
    
  if( cell.text == '' ) {
    const id = uuid();
    setCellHyperlink( cell, baseURI + id );
  }
}
