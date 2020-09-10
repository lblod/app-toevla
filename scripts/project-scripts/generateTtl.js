const fs = require("fs");

const file=fs.readFileSync('./parsedTree.json');

var tree=JSON.parse(file);

var output=`
@prefix cms: <http://mu.semte.ch/vocabulary/cms/>.
@prefix dct: <http://purl.org/dc/terms/>.
@prefix skos: <http://www.w3.org/2004/02/skos/core#>.
@prefix ext: <http://mu.semte.ch/vocabularies/ext/>.
@prefix rm: <http://mu.semte.ch/vocabularies/logical-delete/>.
@prefix typedLiterals: <http://mu.semte.ch/vocabularies/typed-literals/>.
@prefix mu: <http://mu.semte.ch/vocabularies/core/>.
@prefix xsd: <http://www.w3.org/2001/XMLSchema#>.
@prefix app: <http://mu.semte.ch/app/>.
@prefix owl: <http://www.w3.org/2002/07/owl#>.
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>.
@prefix dc: <http://purl.org/dc/elements/1.1/>.
@prefix tvcs: <http://data.toevla.org/concept-schemes/>.
@prefix toevla: <http://toevla.org/ns/generic/>.

tvcs:musea a  skos:ConceptScheme;
  skos:prefLabel "Musea";
  mu:uuid "eed8f203-443b-424c-afa8-0c90bab621e2".
`;

tree.forEach(e => {
  if(e.parent=='root'){
    output+=`
tvcs:musea skos:hasTopConcept <`+e.uri+`>.
<`+e.uri+`> a skos:Concept;
  mu:uuid "`+e.uuid+`";
  skos:prefLabel "`+e.label+`";
  ext:order `+e.order+`.    
`;
  }
  else{
    output+=`
<`+e.uri+`> a skos:Concept;
  mu:uuid "`+e.uuid+`";
  skos:prefLabel "`+e.label+`";
  ext:order `+e.order+`;`;
    e.trueComment?output+=`
  toevla:positiveTemplate "`+e.trueComment+`";`:false;
    e.falseComment?output+=`
  toevla:negativeTemplate "`+e.falseComment+`";`:false;
    output+=`
  skos:broader <`+e.parent+`>.
  `;
  }
});

fs.writeFileSync('./generated.ttl', output);