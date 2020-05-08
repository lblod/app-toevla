import { app, query, errorHandler } from 'mu';

app.post('/', function( req, res ) {
  var data={
    //client/building
    "id": "d001",
    "title": "Test Info",
    "category": "Test Category",
    "rating": "Test Rating",
    "theme": "",
    "criteriaGroups":[{
      "title":"Om er te geraken",
      "criteria": [{
        "title":"Test Criteria Title",
        "id":"c001",
        "description":"Test Criteria Description",
        "status":"",
        "criteriaItems":[{
          "title":"Test Criteria Item Title",
          "id":"ci001",
          "status": "true",
          "contents":`
            Test Criteria Item Contets, Test Criteria Item Contets, Test Criteria Item Contets.
          `,
          "criteriaSubItems":[]
        }]
      },{
        "title":"Openbaar vervoer",
        "id":"c002",
        "description":"Deze locatie is bereikbaar met het openbaar vervoer.",
        "status":"true",
        "criteriaItems":[{
          "title":"Halte aanwezig binnen 500 m",
          "id":"ci002",
          "status": "true",
          "contents":`
          <ul>
          <li>Station Gent-Sint-Pieters op 1,3 km</li>
          <li>Tram 1, Halte Veergrep op 500m</li>
          <li>Bus, Halte Gent Sint-Pieters Plein op 170 m</li>
          </ul>
          <p><a href="https://www.delijn.be/nl/routeplanner/">De Lijn routeplanner</a></p>
          `,
          "criteriaSubItems":[]
        },{
          "title":"Toegankelijke halte",
          "id":"ci003",
          "status": "",
          "contents":``,
          "criteriaSubItems":[]
        },{
          "title":"Rolstoelvriendelijk pad naar inkom",
          "id":"ci004",
          "status": "",
          "contents":`Obstakels op de openbare weg:`,
          "criteriaSubItems":[{
            "title": "Hoogste drempel: 15 cm (details ligging)",
            "id": "csi001",
            "status": ""
          },{
            "title": "Rolstoelvriendelijke ondergrond: bolle kasseien (Sint-Pietersplein)",
            "id": "csi002",
            "status": ""
          },{
            "title": "Lang hellend vlak (straat Kantienberg)",
            "id": "csi003",
            "status": ""
          }]
        }]
      }]
    }]
  };
  res.send(JSON.stringify(data));
});

app.use(errorHandler);

