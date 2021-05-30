const fs = require("fs");

const file = fs.readFileSync('./parsedTree.json');

const tree = JSON.parse(file);

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
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#>.
@prefix dc: <http://purl.org/dc/elements/1.1/>.
@prefix tvcs: <http://data.toevla.org/concept-schemes/>.
@prefix toevla: <http://toevla.org/ns/generic/>.
`;

function targetAudienceURIs(node) {
  const uris = [];
  if (node.criteriumForMentallyChallenged) {
    uris.push("http://data.toevla.org/id/concepts/453e7d14-6ee0-4725-8bd9-1d274d798a2b");
  }
  if (node.criteriumForHearingImpaired) {
    uris.push("http://data.toevla.org/id/concepts/b9f179a0-c9ca-4d95-ac9e-aa7966dda505");
  }
  if (node.criteriumForDeaf) {
    uris.push("http://data.toevla.org/id/concepts/7dbd554a-a036-4262-ad7b-bf5ae96008d2");
  }
  if (node.criteriumForVisuallyImpaired) {
    uris.push("http://data.toevla.org/id/concepts/8d156887-14d0-4da7-a107-537439c27bf7");
  }
  if (node.criteriumForBlind) {
    uris.push("http://data.toevla.org/id/concepts/efb78c6f-c197-4828-9862-b132a6210646");
  }
  if (node.criteriumForBobilityProblems) {
    uris.push("http://data.toevla.org/id/concepts/0f550980-4eb4-4858-951b-b749d5788c46");
  }
  if (node.criteriumForWheelchair) {
    uris.push("http://data.toevla.org/id/concepts/f41ec9b9-1f94-4796-9e62-6ba1a723aff9");
  }
  return uris;
}

/**
 * A codelist which represents a simplified version of the full target
 * audience.
 */
function simplifiedTargetAudienceURIs(node) {
  const uris = [];
  // VISUAL
  if (node.criteriumForBlind || node.criteriumForVisuallyImpaired) {
    uris.push("http://data.toevla.org/id/concepts/a20ef5c0-79e1-48e1-bc49-b6a9d79dfbd5");
  }
  // AUDITIVE
  if (node.criteriumForHearingImpaired || node.criteriumForDeaf) {
    uris.push("http://data.toevla.org/id/concepts/878f5bda-ca55-4497-96ac-31f501ff593e");
  }
  // MOBILE
  if (node.criteriumForWheelchair || node.criteriumForMobilityProblems) {
    uris.push("http://data.toevla.org/id/concepts/01e2cb23-94de-4c07-b851-cd2f1a41856a");
  }
  // AUTISM
  if (node.criteriumForAutism || node.criteriumForMentallyChallenged) {
    uris.push("http://data.toevla.org/id/concepts/75b78030-ac38-42f2-8d71-67129f5e5ff1");
  }
  return uris;
}

const museaConceptScheme = `
tvcs:musea a skos:ConceptScheme;
  skos:prefLabel "Musea";
  mu:uuid "eed8f203-443b-424c-afa8-0c90bab621e2".
`;

let treeContent = "";

tree.forEach(e => {
  // console.log(`Processing row ${e.row}`);
  if (e.parent == 'root') {
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
  treeContent += `
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
  ${e.hyperlinkForUserEntry
      ? `rdfs:seeAlso <${e.hyperlinkForUserEntry}>;`
      : ""}
  ${targetAudienceURIs(e).length == 0
      ? ""
      : "toevla:hasTargetAudience "
      + targetAudienceURIs(e)
        .map((u) => "<" + u + ">")
        .join(", ")
      + ";"}

  ${simplifiedTargetAudienceURIs(e).length == 0
      ? ""
      : "toevla:hasSimplifiedTargetAudience "
      + simplifiedTargetAudienceURIs(e)
        .map((u) => "<" + u + ">")
        .join(", ")
      + ";"}

  toevla:firstLimit "${e.firstLimit}";
  toevla:firstComment "${e.firstComment}";
  toevla:firstScore "${e.firstScore}";
  toevla:secondLimit "${e.secondLimit}";
  toevla:secondComment "${e.secondComment}";
  toevla:secondScore "${e.secondScore}";
  toevla:thirdLimit "${e.thirdLimit}";
  toevla:thirdComment "${e.thirdComment}";
  toevla:thirdScore "${e.thirdScore}".
`;

  if (e.conceptScheme) {
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
