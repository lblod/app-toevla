const fs = require("fs");

const file=fs.readFileSync('./parsedTree.json');

const tree=JSON.parse(file);

const prefixes = `@prefix cms: <http://mu.semte.ch/vocabulary/cms/>.
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
`;


const museaConceptScheme = `
tvcs:musea a skos:ConceptScheme;
  skos:prefLabel "Musea";
  mu:uuid "eed8f203-443b-424c-afa8-0c90bab621e2".
`;

let treeContent = "";

tree.forEach(e => {
  // console.log(`Processing row ${e.row}`);
  if(e.parent == 'root') {
    // We are a top concept
    treeContent += `
tvcs:musea skos:hasTopConcept <${e.uri}>.`;
  } else {
    // lower-level concept
    treeContent += `
<${e.uri}> skos:broader <${e.parent}>.
`;
  }

  // lower-level concept
  treeContent+=`
<${e.uri}> a skos:Concept;
  mu:uuid "${e.uuid}";
  skos:prefLabel "${e.label}";
  ext:order ${e.order};
  
  toevla:relevant "${e.relevant}";
  toevla:relevantForScore "${e.relevantForScore}";
  toevla:compulsoryCriteria "${e.compulsoryCriteria}";
  toevla:displayType "${e.displayType}";
  toevla:criteriaType "${e.criteriaType}";
  toevla:type "${e.type}";
  ${e.infoForUserEntry
    ? "toevla:dataEntryComment \"\"\"" + e.infoForUserEntry + "\"\"\";"
    : ""}

  toevla:firstLimit "${e.firstLimit}";
  toevla:firstComment "${e.firstComment}";
  toevla:firstScore "${e.firstScore}";
  toevla:secondLimit "${e.secondLimit}";
  toevla:secondComment "${e.secondComment}";
  toevla:secondScore "${e.secondScore}";
  toevla:thirdLimit "${e.thirdLimit}";
  toevla:thirdComment "${e.thirdComment}";
  toevla:thirdScore "${e.thirdScore}";

  toevla:isCriteriumForMentallyChallenged ${(e.criteriumForMentallyChallenged && "true") || "false"};
  toevla:isCriteriumForHearingImpaired ${(e.criteriumForHearingImpaired && "true") || "false"};
  toevla:isCriteriumForDeaf ${(e.criteriumForDeaf && "true") || "false"};
  toevla:isCriteriumForVisuallyImpaired ${(e.criteriumForVisuallyImpaired && "true") || "false"};
  toevla:isCriteriumForBlind ${(e.criteriumForBlind && "true") || "false"};
  toevla:isCriteriumForBobilityProblems ${(e.criteriumForBobilityProblems && "true") || "false"};
  toevla:isCriteriumForWheelchair ${(e.criteriumForWheelchair && "true") || "false"};
  toevla:isCriteriumForAutism ${(e.criteriumForAutism && "true") || "false"}.
`;

  if( e.conceptScheme ) {
    treeContent += `
<${e.uri}> toevla:fromConceptScheme <${e.conceptScheme.uri}>.
<${e.conceptScheme.uri}> a skos:ConceptScheme;
  mu:uuid "${e.conceptScheme.uuid}";
  skos:hasTopConcept
    <${e.tag1.uri}>,
    <${e.tag2.uri}>,
    <${e.tag3.uri}>.
<${e.tag1.uri}> a skos:Concept;
  skos:prefLabel "${e.firstComment}";
  ext:order 1;
  toevla:selectableLabel "${e.firstLimit}";
  toevla:score "${e.firstScore}";
  mu:uuid "${e.tag1.uuid}".
<${e.tag2.uri}> a skos:Concept;
  skos:prefLabel "${e.secondComment}";
  toevla:selectableLabel "${e.secondLimit}";
  toevla:score "${e.secondScore}";
  ext:order 2;
  mu:uuid "${e.tag2.uuid}".
<${e.tag3.uri}> a skos:Concept;
  skos:prefLabel "${e.thirdComment}";
  ext:order 3;
  toevla:selectableLabel "${e.thirdLimit}";
  toevla:score "${e.thirdScore}";
  mu:uuid "${e.tag3.uuid}".
`;
  }

});

const ttlOutput = `${prefixes}
${museaConceptScheme}
${treeContent}`;

fs.writeFileSync('/data/app/generated.ttl', ttlOutput);
