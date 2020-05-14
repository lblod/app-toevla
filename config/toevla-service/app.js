import { app, query, errorHandler } from 'mu';

app.get('/', function( req, res ) {
  let data={};

  if(req.query.dataResource=='http://toevla.org/id/musea/2398')
  {
    data=
    {
      "id": "82e55143-7f3d-48db-b550-04612edd74c2",
      "title": "ToegankelijkheidsInfo",
      "category": "Toegankelijk Museum",
      "rating": "Basis niveau",
      "theme": "",
      "criteriaGroups": [
        {
          "id": "54bac1c5-fe02-49ad-8a84-4aaa911d4a39",
          "title": "Om er te geraken",
          "criteria": [
            {
              "title": "Openbaar vervoer",
              "id": "a272f8d5-83e5-47ee-be4b-c68f8ce295ef",
              "description": "\n        <p class=\"au-w-info\">\n          Deze locatie is bereikbaar met het openbaar vervoer.\n        </p>\n        ",
              "status": "true",
              "criteriaItems": [
                {
                  "title": "Halte aanwezig binnen 500 m",
                  "id": "d8ecb29c-c26b-49c8-a8f6-a74408c35b30",
                  "status": "true",
                  "contents": "\n            <ul>\n              <li>Station Gent-Sint-Pieters op 1,3 km</li>\n              <li>Tram 1, Halte Veergrep op 500m</li>\n              <li>Bus, Halte Gent Sint-Pieters Plein op 170 m</li>\n            </ul>\n            <p><a href=\"https://www.delijn.be/nl/routeplanner/\">De Lijn routeplanner</a></p>\n          ",
                  "criteriaSubItems": []
                },
                {
                  "title": "Toegankelijke halte",
                  "id": "e96fed51-2a1d-4b56-823f-97547708ab82",
                  "status": "",
                  "contents": "\n            <p class=\"au-w-info-text\">Geen extra info beschikbaar.</p>\n          ",
                  "criteriaSubItems": []
                },
                {
                  "title": "Rolstoelvriendelijk pad naar inkom",
                  "id": "c5880db9-c128-4124-bc7e-6d65998abfca",
                  "status": "",
                  "contents": "\n            <p>Obstakels op de openbare weg:</p>\n            <ul class=\"au-w-criterium-list\">\n              \n              \n              \n            </ul>\n          ",
                  "criteriaSubItems": [
                    {
                      "title": "Hoogste drempel: 15 cm (details ligging)",
                      "id": "2909c261-7106-45f1-a129-738fda546080",
                      "status": ""
                    },
                    {
                      "title": "Rolstoelvriendelijke ondergrond: bolle kasseien (Sint-Pietersplein)",
                      "id": "0e0fdd52-fda3-4b15-985d-837aa2dfa0c1",
                      "status": ""
                    },
                    {
                      "title": "Lang hellend vlak (straat Kantienberg)",
                      "id": "d7689302-71af-42c9-abc1-2337478963fb",
                      "status": ""
                    }
                  ]
                },
                {
                  "title": "Omschrijving bereikbaarheid met OV (zonder voorleesfunctie)",
                  "id": "76496ea8-959e-4c97-bfaa-d56475d2883b",
                  "status": "",
                  "contents": "\n            <p><a href=\"https://dewereldvankina.stad.gent/toegankelijkheid-routebeschrijvingen\">Toegankelijkheid routebeschrijving</a></p>\n          ",
                  "criteriaSubItems": []
                }
              ]
            },
            {
              "title": "Voorbehouden parkeerplaats",
              "id": "3f33a9e1-ad19-4693-ba95-c0bf247b8e24",
              "description": "\n        <p class=\"au-w-info au-w-info--icon\">\n          <svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 48 48\"  class=\"au-w-icon au-w-icon--alert\">\n            <path d=\"M9.82394213,24.1189444 L13.193581,27.4885162 C12.2698102,28.8463472 11.7290139,30.4845787 11.7290139,32.2471343 C11.7290139,36.9239213 15.5339213,40.7288287 20.2107083,40.7288287 C21.9731296,40.7288287 23.6113611,40.187831 24.969125,39.2643287 L24.969125,39.2643287 L28.3386968,42.6337662 C26.0981782,44.3896088 23.2779282,45.4392477 20.2107083,45.4392477 C12.924794,45.4392477 7.01852778,39.5330486 7.01852778,32.2471343 C7.01852778,29.1800486 8.06816667,26.3595301 9.82394213,24.1189444 L9.82394213,24.1189444 Z M18.8036713,4.76278704 C19.6360787,4.02033333 20.8515278,3.89688194 21.8161134,4.45721296 C21.8161134,4.45721296 33.6287801,11.3194722 33.6475093,11.332831 C34.2573148,11.7138588 34.6542523,12.3102384 34.7981111,12.9656921 C35.0707245,13.9222222 34.8692685,14.9926713 34.1641389,15.7956759 L34.1641389,15.7956759 L29.2144699,21.4328866 L38.2085648,20.9322338 C38.9516898,20.8915532 39.6789051,21.1734977 40.1993611,21.7075139 C40.7195486,22.2413958 40.9833681,22.9743171 40.9226829,23.7175093 L40.9226829,23.7175093 L39.8356528,37.0551597 C39.7258287,38.4035926 38.597044,39.4252384 37.2674745,39.4252384 C37.1971898,39.4252384 37.1262338,39.4224861 37.0551435,39.416713 C35.6351505,39.3007801 34.5777245,38.0559954 34.6935231,36.6360694 L34.6935231,36.6360694 L35.5404306,26.2477593 L32.0590208,26.4416968 C32.9190185,28.1936458 33.4026875,30.1638333 33.4026875,32.2472014 C33.4026875,35.7441181 32.0398218,38.9205579 29.8191736,41.2812384 L29.8191736,41.2812384 L26.4857176,37.947581 C27.8558333,36.440588 28.6922014,34.4397894 28.6922014,32.2472014 C28.6922014,27.5704144 24.8873611,23.7655069 20.2106412,23.7655069 C18.0180532,23.7655069 16.0171204,24.601875 14.5101273,25.972125 L14.5101273,25.972125 L11.1764699,22.6384676 C13.0461644,20.8797384 15.4279236,19.6599259 18.0750463,19.2282153 L18.0750463,19.2282153 L24.4588056,11.9577407 L20.8422639,9.85759028 L16.4675602,13.7599028 C15.4044954,14.7085116 13.7738495,14.6151343 12.8254421,13.5520694 C11.8771019,12.4888704 11.9702106,10.8582917 13.0333426,9.91001852 L13.0333426,9.91001852 Z M35.4216111,2.02148148 C37.8062569,2.02148148 39.7391875,3.95481481 39.7391875,6.33946065 C39.7391875,8.72424074 37.8062569,10.6573727 35.4216111,10.6573727 C33.0366296,10.6573727 31.1036319,8.72424074 31.1036319,6.33946065 C31.1036319,3.95481481 33.0366968,2.02148148 35.4216111,2.02148148 Z\"/>\n          </svg>\n          Er is minstens één voorbehouden parkeerplaats met rolstoelvriendelijke ondergrond bij het uitstappen.\n        </p>\n        ",
              "status": "true",
              "criteriaItems": [
                {
                  "title": "2 voorbehouden plaatsen",
                  "id": "e9f18e8b-95c1-4130-b41e-d280f43dbb8e",
                  "status": "true",
                  "contents": "\n            <p>Er zijn 2 aangepaste parkeerplaatsen dicht bij de alternatieve inkom ; onder het Sint-Pietersplein (op 50 m)  is een ruime ondergrondse parkeergelegenheid met aangepaste parkeerplaatsen.</p>\n            <ul class=\"au-w-criterium-list\">\n              \n            </ul>\n            <h4 class=\"au-w-criterium-subtitle\">\n              <svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 44 44\" class=\"au-w-icon au-w-icon--faded\" aria-hidden=\"true\">\n                <path d=\"M27.5,3.66666667 L30.855,7.33333333 L36.6666667,7.33333333 C38.6925,7.33333333 40.3333333,8.97416667 40.3333333,11 L40.3333333,11 L40.3333333,33 C40.3333333,35.0258333 38.6925,36.6666667 36.6666667,36.6666667 L36.6666667,36.6666667 L7.33333333,36.6666667 C5.3075,36.6666667 3.66666667,35.0258333 3.66666667,33 L3.66666667,33 L3.66666667,11 C3.66666667,8.97416667 5.3075,7.33333333 7.33333333,7.33333333 L7.33333333,7.33333333 L13.145,7.33333333 L16.5,3.66666667 L27.5,3.66666667 Z M22,12.8333333 C16.94,12.8333333 12.8333333,16.94 12.8333333,22 C12.8333333,27.06 16.94,31.1666667 22,31.1666667 C27.06,31.1666667 31.1666667,27.06 31.1666667,22 C31.1666667,16.94 27.06,12.8333333 22,12.8333333 Z M22,16.1333333 C25.2400705,16.1333333 27.8666667,18.7599295 27.8666667,22 C27.8666667,25.2400705 25.2400705,27.8666667 22,27.8666667 C18.7599295,27.8666667 16.1333333,25.2400705 16.1333333,22 C16.1333333,18.7599295 18.7599295,16.1333333 22,16.1333333 Z\"/>\n              </svg>\n              Foto's:\n            </h4>\n            <ul class=\"au-w-list-image\">\n              <li class=\"au-w-list-image__item\">\n                <AuImage>\n                  <img src=\"https://embed-dev.toevla.org/assets/img/kinaP1.jpg\" alt=\"\">\n                </AuImage>\n              </li>\n              <li class=\"au-w-list-image__item\">\n                <AuImage>\n                  <img src=\"https://embed-dev.toevla.org/assets/img/kinaP2.jpg\" alt=\"\">\n                </AuImage>\n              </li>\n            </ul>\n          ",
                  "criteriaSubItems": [
                    {
                      "title": "Eigen parkeerterrein",
                      "id": "7117ed43-741f-4fdd-a27f-eadcba4af039",
                      "status": ""
                    }
                  ]
                },
                {
                  "title": "Rolstoelvriendelijke ondergrond",
                  "id": "70f28492-6fea-4c1e-a627-45071c4af949",
                  "status": "true",
                  "contents": "\n            <ul class=\"au-w-criterium-list\">\n              \n            </ul>\n          ",
                  "criteriaSubItems": [
                    {
                      "title": "Bolle kasseien",
                      "id": "18c9af7f-9501-4b39-9f23-db607b3d1bc8",
                      "status": ""
                    }
                  ]
                },
                {
                  "title": "Naast elkaar parkeren: breedte 400 cm",
                  "id": "d59b38c5-8711-46c7-ac1d-dfbc1c4a2bc7",
                  "status": "true",
                  "contents": "",
                  "criteriaSubItems": []
                },
                {
                  "title": "Max voertuig-hoogte 210 cm",
                  "id": "355f21fe-7da6-470c-ae1f-258b242f4556",
                  "status": "true",
                  "contents": "",
                  "criteriaSubItems": []
                },
                {
                  "title": "Rolstoelvriendelijk pad naar de inkom",
                  "id": "ac27b9ac-ea4c-4368-b45c-5c5f8e7e6000",
                  "status": "",
                  "contents": "\n            <p>Obstakels op de openbare weg:</p>\n            <ul class=\"au-w-criterium-list\">\n              \n            </ul>\n          ",
                  "criteriaSubItems": [
                    {
                      "title": "Bolle kasseien",
                      "id": "2188d601-31b5-4756-a15c-288aa7ed98d5",
                      "status": ""
                    }
                  ]
                },
                {
                  "title": "Voorrijdmogelijkheid",
                  "id": "a74299c7-a24a-4a2f-91d6-e19930dd65be",
                  "status": "true",
                  "contents": "",
                  "criteriaSubItems": []
                },
                {
                  "title": "Goede verlichting op de route",
                  "id": "f85d1313-5dbf-44b0-8e43-29e464a38bdd",
                  "status": "true",
                  "contents": "",
                  "criteriaSubItems": []
                }
              ]
            },
            {
              "title": "Fietsenstalling",
              "id": "7cb7bacf-8ddc-4e1b-a461-3955ec0a0773",
              "description": "",
              "status": "",
              "criteriaItems": [
                {
                  "title": "Niet overdekt",
                  "id": "483012d7-d80a-4c7d-a39c-58bec6f27d25",
                  "status": "",
                  "contents": "",
                  "criteriaSubItems": []
                },
                {
                  "title": "Aangepast",
                  "id": "567c90f9-39fb-487a-a6c5-78485b589f23",
                  "status": "",
                  "contents": "\n            <p>Op de binnenkoer </p>\n          ",
                  "criteriaSubItems": []
                },
                {
                  "title": "Rolstoelvriendelijk pad naar inkom",
                  "id": "da2c01d2-accc-44d9-ae29-c4249f04f405",
                  "status": "",
                  "contents": "\n            <p>Naar alternatieve ingang</p>\n          ",
                  "criteriaSubItems": []
                }
              ]
            }
          ]
        },
        {
          "id": "8db4d4d7-ea4f-4424-bb31-806eef40384a",
          "title": "Algemene info en infrastructuur",
          "criteria": [
            {
              "title": "Museum - Bezoekersinfo",
              "id": "c2e4a4bc-bbc5-4bf5-a24e-380d9d60f3f0",
              "description": "\n        <p class=\"au-w-info\">\n          Algemene Info & Tegemoetkomingen.\n        </p>\n        ",
              "status": "true",
              "criteriaItems": [
                {
                  "title": "Begeleiding van aan het openbaar vervoer mogelijk",
                  "id": "9c398648-5952-4384-a9b4-0eabba3d816a",
                  "status": "",
                  "contents": "\n            <p>Enkel bij groepen, op aanvraag</p>\n          ",
                  "criteriaSubItems": []
                },
                {
                  "title": "Tegemoetkoming toegangsprijs",
                  "id": "4e89f9da-0a76-4ab1-898b-1c133b5fe3d5",
                  "status": "true",
                  "contents": "\n            <ul class=\"au-w-criterium-list\">\n              \n              \n              \n              \n              \n            </ul>\n          ",
                  "criteriaSubItems": [
                    {
                      "title": "Begeleider gratis",
                      "id": "b418cb9a-279e-4326-b627-e7bc9afd19ad",
                      "status": "true"
                    },
                    {
                      "title": "Museumpas",
                      "id": "743d37ec-0568-4d17-b88e-dd5e44114600",
                      "status": "true"
                    },
                    {
                      "title": "Uitpas (punten scannen)",
                      "id": "018a44e0-52d5-445c-8760-16460e6c6e62",
                      "status": "true"
                    },
                    {
                      "title": "City Pas Gent",
                      "id": "8ddfc309-7b8f-440f-93f4-5fc053b17cf8",
                      "status": "true"
                    },
                    {
                      "title": "EDC (European Disability Card) toegestaan",
                      "id": "d7c4d33a-ed71-4375-b89d-9ac1bd3bd748",
                      "status": "true"
                    }
                  ]
                },
                {
                  "title": "Rolstoel ter beschikking",
                  "id": "4d6f6ea3-01af-427d-9351-2439dc9eb8de",
                  "status": "",
                  "contents": "\n            <p class=\"au-w-info-text\">Geen extra info beschikbaar.</p>\n          ",
                  "criteriaSubItems": []
                },
                {
                  "title": "Wifi beschikbaar",
                  "id": "1e7e7285-75a0-4a9e-ae80-fee14e1c23d1",
                  "status": "true",
                  "contents": "",
                  "criteriaSubItems": []
                },
                {
                  "title": "Assistentiehonden : er zijn geen voorzieningen aanwezig",
                  "id": "2c25285f-3e54-43c9-a5b9-efb4b12f1324",
                  "status": "",
                  "contents": "",
                  "criteriaSubItems": []
                },
                {
                  "title": "Elektronische betaalmogelijkheid niet verplaatsbaar",
                  "id": "36f952dc-fbfe-4431-9a2b-05fe9dcee56e",
                  "status": "",
                  "contents": "",
                  "criteriaSubItems": []
                },
                {
                  "title": "Website",
                  "id": "127a7eea-5dc7-4b32-a10d-278019f0b25d",
                  "status": "true",
                  "contents": "\n            <ul class=\"au-w-criterium-list\">\n              \n              \n              \n            </ul>\n          ",
                  "criteriaSubItems": [
                    {
                      "title": "WAI-WCAG 2.0 norm behaald",
                      "id": "029d8285-29eb-4a72-a889-f6849160d34d",
                      "status": "true"
                    },
                    {
                      "title": "Tekstvergroting mogelijk",
                      "id": "c061fe27-58cd-4040-bf56-ad6d6a9baad9",
                      "status": "true"
                    },
                    {
                      "title": "Contrasten",
                      "id": "af881cb3-3bc5-420c-9aa9-d17ef30ac336",
                      "status": "true"
                    }
                  ]
                }
              ]
            },
            {
              "title": "Inkom",
              "id": "1029adf7-825b-4a92-86dd-eb4844252fb0",
              "description": "\n        <p class=\"au-w-info au-w-info--icon\">\n          <svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 48 48\"  class=\"au-w-icon au-w-icon--alert\">\n            <path d=\"M9.82394213,24.1189444 L13.193581,27.4885162 C12.2698102,28.8463472 11.7290139,30.4845787 11.7290139,32.2471343 C11.7290139,36.9239213 15.5339213,40.7288287 20.2107083,40.7288287 C21.9731296,40.7288287 23.6113611,40.187831 24.969125,39.2643287 L24.969125,39.2643287 L28.3386968,42.6337662 C26.0981782,44.3896088 23.2779282,45.4392477 20.2107083,45.4392477 C12.924794,45.4392477 7.01852778,39.5330486 7.01852778,32.2471343 C7.01852778,29.1800486 8.06816667,26.3595301 9.82394213,24.1189444 L9.82394213,24.1189444 Z M18.8036713,4.76278704 C19.6360787,4.02033333 20.8515278,3.89688194 21.8161134,4.45721296 C21.8161134,4.45721296 33.6287801,11.3194722 33.6475093,11.332831 C34.2573148,11.7138588 34.6542523,12.3102384 34.7981111,12.9656921 C35.0707245,13.9222222 34.8692685,14.9926713 34.1641389,15.7956759 L34.1641389,15.7956759 L29.2144699,21.4328866 L38.2085648,20.9322338 C38.9516898,20.8915532 39.6789051,21.1734977 40.1993611,21.7075139 C40.7195486,22.2413958 40.9833681,22.9743171 40.9226829,23.7175093 L40.9226829,23.7175093 L39.8356528,37.0551597 C39.7258287,38.4035926 38.597044,39.4252384 37.2674745,39.4252384 C37.1971898,39.4252384 37.1262338,39.4224861 37.0551435,39.416713 C35.6351505,39.3007801 34.5777245,38.0559954 34.6935231,36.6360694 L34.6935231,36.6360694 L35.5404306,26.2477593 L32.0590208,26.4416968 C32.9190185,28.1936458 33.4026875,30.1638333 33.4026875,32.2472014 C33.4026875,35.7441181 32.0398218,38.9205579 29.8191736,41.2812384 L29.8191736,41.2812384 L26.4857176,37.947581 C27.8558333,36.440588 28.6922014,34.4397894 28.6922014,32.2472014 C28.6922014,27.5704144 24.8873611,23.7655069 20.2106412,23.7655069 C18.0180532,23.7655069 16.0171204,24.601875 14.5101273,25.972125 L14.5101273,25.972125 L11.1764699,22.6384676 C13.0461644,20.8797384 15.4279236,19.6599259 18.0750463,19.2282153 L18.0750463,19.2282153 L24.4588056,11.9577407 L20.8422639,9.85759028 L16.4675602,13.7599028 C15.4044954,14.7085116 13.7738495,14.6151343 12.8254421,13.5520694 C11.8771019,12.4888704 11.9702106,10.8582917 13.0333426,9.91001852 L13.0333426,9.91001852 Z M35.4216111,2.02148148 C37.8062569,2.02148148 39.7391875,3.95481481 39.7391875,6.33946065 C39.7391875,8.72424074 37.8062569,10.6573727 35.4216111,10.6573727 C33.0366296,10.6573727 31.1036319,8.72424074 31.1036319,6.33946065 C31.1036319,3.95481481 33.0366968,2.02148148 35.4216111,2.02148148 Z\"/>\n          </svg>\n          De inkombreedte is minstens 85 cm met max 1 trede van 10 cm.\n        </p>\n        ",
              "status": "true",
              "criteriaItems": [
                {
                  "title": "Rolstoelvriendelijke inkom",
                  "id": "04ec263d-402e-47ac-9685-4347df0ce9bf",
                  "status": "true",
                  "contents": "\n            <ul class=\"au-w-criterium-list\">\n              \n                  \n              \n              \n              \n            </ul>\n            <h4 class=\"au-w-criterium-subtitle\">\n              <svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 44 44\" class=\"au-w-icon au-w-icon--faded\" aria-hidden=\"true\">\n                <path d=\"M27.5,3.66666667 L30.855,7.33333333 L36.6666667,7.33333333 C38.6925,7.33333333 40.3333333,8.97416667 40.3333333,11 L40.3333333,11 L40.3333333,33 C40.3333333,35.0258333 38.6925,36.6666667 36.6666667,36.6666667 L36.6666667,36.6666667 L7.33333333,36.6666667 C5.3075,36.6666667 3.66666667,35.0258333 3.66666667,33 L3.66666667,33 L3.66666667,11 C3.66666667,8.97416667 5.3075,7.33333333 7.33333333,7.33333333 L7.33333333,7.33333333 L13.145,7.33333333 L16.5,3.66666667 L27.5,3.66666667 Z M22,12.8333333 C16.94,12.8333333 12.8333333,16.94 12.8333333,22 C12.8333333,27.06 16.94,31.1666667 22,31.1666667 C27.06,31.1666667 31.1666667,27.06 31.1666667,22 C31.1666667,16.94 27.06,12.8333333 22,12.8333333 Z M22,16.1333333 C25.2400705,16.1333333 27.8666667,18.7599295 27.8666667,22 C27.8666667,25.2400705 25.2400705,27.8666667 22,27.8666667 C18.7599295,27.8666667 16.1333333,25.2400705 16.1333333,22 C16.1333333,18.7599295 18.7599295,16.1333333 22,16.1333333 Z\"/>\n              </svg>\n              Foto's:\n            </h4>\n            <ul class=\"au-w-list-image\">\n              <li class=\"au-w-list-image__item\">\n                <AuImage>\n                  <img src=\"https://embed-dev.toevla.org/assets/img/kinaI1.jpg\" alt=\"\">\n                </AuImage>\n              </li>\n              <li class=\"au-w-list-image__item\">\n                <AuImage>\n                  <img src=\"https://embed-dev.toevla.org/assets/img/kinaI2.jpg\" alt=\"\">\n                </AuImage>\n              </li>\n            </ul>\n          ",
                  "criteriaSubItems": [
                    {
                      "title": "Bereikbaar",
                      "id": "3bc2c738-1135-4b19-bd27-0ff97ccf0cc8",
                      "status": "true"
                    },
                    {
                      "title": "Deurbreedte > 90 cm",
                      "id": "13f75ed8-16cb-40ec-a7cc-61791c89bd53",
                      "status": "true"
                    },
                    {
                      "title": "Draairuimte aan de deur",
                      "id": "ecb3aead-e7dd-4851-9fa1-48c7efa3c8e9",
                      "status": "true"
                    },
                    {
                      "title": "Geen tourniquetdeur",
                      "id": "b415f351-5500-4a44-9dd6-199ceef308e6",
                      "status": "true"
                    },
                    {
                      "title": "Verlaagde balie",
                      "id": "f84a9cd4-771a-4f39-8e8b-c1bc70eaa33c",
                      "status": ""
                    }
                  ]
                },
                {
                  "title": "Via Alternatieve toegang, deurbreedte 90+90cm",
                  "id": "61925f93-773b-4d62-838b-1d75b4677814",
                  "status": "true",
                  "contents": "",
                  "criteriaSubItems": [
                    {
                      "title": "Op de hoek met de Kantienberg.",
                      "id": "a8efc20c-b4de-4627-a0cc-3af47fb4da55",
                      "status": "true"
                    }
                  ]
                },
                {
                  "title": "Toegangscontrole",
                  "id": "edaf441d-ea36-4fe4-bb6e-2cd7563375c3",
                  "status": "true",
                  "contents": "",
                  "criteriaSubItems": []
                },
                {
                  "title": "Toegang duidelijk herkenbaar",
                  "id": "982bd158-43c5-482c-8438-262ac4e23c73",
                  "status": "true",
                  "contents": "",
                  "criteriaSubItems": []
                },
                {
                  "title": "Gids- en/of geleidelijnen",
                  "id": "981f16b6-6dd3-4a2f-9762-aaf775928eda",
                  "status": "true",
                  "contents": "\n            <p>Inkom tot balie. Traphal, tot 2de V. Vogelzaal 2de V.</p>\n          ",
                  "criteriaSubItems": []
                },
                {
                  "title": "Extra aandacht voor akoestiek",
                  "id": "47845c01-37af-4be3-96e7-8bd1e4382406",
                  "status": "true",
                  "contents": "\n            <p>2de V (Vogelzaal).</p>\n          ",
                  "criteriaSubItems": []
                },
                {
                  "title": "Bemande balie",
                  "id": "5f00bcc9-d6c6-433b-8cd5-d764a6ec9d1d",
                  "status": "true",
                  "contents": "\n            <p>Permanent iemand aanwezig.</p>\n          ",
                  "criteriaSubItems": []
                },
                {
                  "title": "Ringleiding aan de balie",
                  "id": "982c069e-704b-4367-a6a7-5dd2403d44e5",
                  "status": "",
                  "contents": "",
                  "criteriaSubItems": []
                }
              ]
            },
            {
              "title": "Toilet",
              "id": "254f3460-c27f-47e9-b9f1-ffa582e8a5f2",
              "description": "\n        <p class=\"au-w-info au-w-info--icon\">\n          <svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 48 48\"  class=\"au-w-icon au-w-icon--alert\">\n            <path d=\"M9.82394213,24.1189444 L13.193581,27.4885162 C12.2698102,28.8463472 11.7290139,30.4845787 11.7290139,32.2471343 C11.7290139,36.9239213 15.5339213,40.7288287 20.2107083,40.7288287 C21.9731296,40.7288287 23.6113611,40.187831 24.969125,39.2643287 L24.969125,39.2643287 L28.3386968,42.6337662 C26.0981782,44.3896088 23.2779282,45.4392477 20.2107083,45.4392477 C12.924794,45.4392477 7.01852778,39.5330486 7.01852778,32.2471343 C7.01852778,29.1800486 8.06816667,26.3595301 9.82394213,24.1189444 L9.82394213,24.1189444 Z M18.8036713,4.76278704 C19.6360787,4.02033333 20.8515278,3.89688194 21.8161134,4.45721296 C21.8161134,4.45721296 33.6287801,11.3194722 33.6475093,11.332831 C34.2573148,11.7138588 34.6542523,12.3102384 34.7981111,12.9656921 C35.0707245,13.9222222 34.8692685,14.9926713 34.1641389,15.7956759 L34.1641389,15.7956759 L29.2144699,21.4328866 L38.2085648,20.9322338 C38.9516898,20.8915532 39.6789051,21.1734977 40.1993611,21.7075139 C40.7195486,22.2413958 40.9833681,22.9743171 40.9226829,23.7175093 L40.9226829,23.7175093 L39.8356528,37.0551597 C39.7258287,38.4035926 38.597044,39.4252384 37.2674745,39.4252384 C37.1971898,39.4252384 37.1262338,39.4224861 37.0551435,39.416713 C35.6351505,39.3007801 34.5777245,38.0559954 34.6935231,36.6360694 L34.6935231,36.6360694 L35.5404306,26.2477593 L32.0590208,26.4416968 C32.9190185,28.1936458 33.4026875,30.1638333 33.4026875,32.2472014 C33.4026875,35.7441181 32.0398218,38.9205579 29.8191736,41.2812384 L29.8191736,41.2812384 L26.4857176,37.947581 C27.8558333,36.440588 28.6922014,34.4397894 28.6922014,32.2472014 C28.6922014,27.5704144 24.8873611,23.7655069 20.2106412,23.7655069 C18.0180532,23.7655069 16.0171204,24.601875 14.5101273,25.972125 L14.5101273,25.972125 L11.1764699,22.6384676 C13.0461644,20.8797384 15.4279236,19.6599259 18.0750463,19.2282153 L18.0750463,19.2282153 L24.4588056,11.9577407 L20.8422639,9.85759028 L16.4675602,13.7599028 C15.4044954,14.7085116 13.7738495,14.6151343 12.8254421,13.5520694 C11.8771019,12.4888704 11.9702106,10.8582917 13.0333426,9.91001852 L13.0333426,9.91001852 Z M35.4216111,2.02148148 C37.8062569,2.02148148 39.7391875,3.95481481 39.7391875,6.33946065 C39.7391875,8.72424074 37.8062569,10.6573727 35.4216111,10.6573727 C33.0366296,10.6573727 31.1036319,8.72424074 31.1036319,6.33946065 C31.1036319,3.95481481 33.0366968,2.02148148 35.4216111,2.02148148 Z\"/>\n          </svg>\n          Je kan met de rolstoel binnen nl. max drempel van 5cm, deurbreedte van min 85 cm, draairuimte (diameter) minstens 120 cm.\n        </p>\n        ",
              "status": "true",
              "criteriaItems": [
                {
                  "title": "Rolstoelvriendelijk toilet",
                  "id": "de961b50-b85e-4c64-82b1-a3db233a3fca",
                  "status": "true",
                  "contents": "\n            <ul class=\"au-w-criterium-list\">\n              \n                </ul>\n              </AuCriteriaSubitem>\n              \n              \n              \n              \n              \n              \n              \n            </ul>\n          ",
                  "criteriaSubItems": [
                    {
                      "title": "Bereikbaar",
                      "id": "8ce14c4e-4289-4af1-ad94-299f3167c989",
                      "status": "true"
                    },
                    {
                      "title": "Deurbreedte 88cm",
                      "id": "9753506b-b464-420e-858e-2b3104262c98",
                      "status": "true"
                    },
                    {
                      "title": "Onvoldoende of geen draairuimte aan de deur",
                      "id": "b2a5d1f4-f05a-48b8-8a78-5e9fd07d2355",
                      "status": ""
                    },
                    {
                      "title": "Ruimte voor toiletpot 80 cm",
                      "id": "ed49be87-140c-482f-ab1e-2033d1972dcb",
                      "status": "true"
                    },
                    {
                      "title": "Ruimte naast toiletpot 90 cm",
                      "id": "f6e9a43a-ea3c-4152-bbc9-57fc9738d259",
                      "status": "true"
                    },
                    {
                      "title": "Draairuimte in het toilet 150cm",
                      "id": "d51e1a2c-8645-4e79-b505-2336ec758559",
                      "status": "true"
                    },
                    {
                      "title": "Steunbeugels, 2",
                      "id": "e2539aaf-d3e5-41a9-a40a-c937e7f011b9",
                      "status": "true"
                    },
                    {
                      "title": "Beperkt onderrijdbare wastafel",
                      "id": "5d740d1c-61b1-40b7-a68e-2755d2f08c2c",
                      "status": "true"
                    }
                  ]
                },
                {
                  "title": "Verzorgingstafel kinderen",
                  "id": "5c7faa7c-cedc-4ab1-a8ac-040d042d9cb2",
                  "status": "true",
                  "contents": "",
                  "criteriaSubItems": []
                }
              ]
            },
            {
              "title": "Museum - Circulatie in het gebouw",
              "id": "ed1230fc-7802-4711-8bbc-bb77c98ca150",
              "description": "\n        <p class=\"au-w-info\">\n          Je kan het merendeel van de bedoelde activiteiten uitvoeren, met jouw beperking.\n        </p>\n        ",
              "status": "true",
              "criteriaItems": [
                {
                  "title": "Rolstoelvriendelijke circulatie",
                  "id": "0192128b-a789-41cd-a6a5-eeaa2bbc8f63",
                  "status": "true",
                  "contents": "",
                  "criteriaSubItems": []
                },
                {
                  "title": "Alles op gelijkvloers",
                  "id": "bd0f1f8d-d103-401d-9686-71b155dab814",
                  "status": "",
                  "contents": "\n            <p class=\"au-w-info-text\">Geen extra info beschikbaar.</p>\n          ",
                  "criteriaSubItems": []
                },
                {
                  "title": "Rolstoelvriendelijke lift, 148 x 112 cm",
                  "id": "b2c000b1-2687-4a79-a6e8-b507cd0f172b",
                  "status": "true",
                  "contents": "\n            <h4 class=\"au-w-criterium-subtitle\">\n              <svg xmlns=\"http://www.w3.org/2000/svg\" viewBox=\"0 0 44 44\" class=\"au-w-icon au-w-icon--faded\" aria-hidden=\"true\">\n                <path d=\"M27.5,3.66666667 L30.855,7.33333333 L36.6666667,7.33333333 C38.6925,7.33333333 40.3333333,8.97416667 40.3333333,11 L40.3333333,11 L40.3333333,33 C40.3333333,35.0258333 38.6925,36.6666667 36.6666667,36.6666667 L36.6666667,36.6666667 L7.33333333,36.6666667 C5.3075,36.6666667 3.66666667,35.0258333 3.66666667,33 L3.66666667,33 L3.66666667,11 C3.66666667,8.97416667 5.3075,7.33333333 7.33333333,7.33333333 L7.33333333,7.33333333 L13.145,7.33333333 L16.5,3.66666667 L27.5,3.66666667 Z M22,12.8333333 C16.94,12.8333333 12.8333333,16.94 12.8333333,22 C12.8333333,27.06 16.94,31.1666667 22,31.1666667 C27.06,31.1666667 31.1666667,27.06 31.1666667,22 C31.1666667,16.94 27.06,12.8333333 22,12.8333333 Z M22,16.1333333 C25.2400705,16.1333333 27.8666667,18.7599295 27.8666667,22 C27.8666667,25.2400705 25.2400705,27.8666667 22,27.8666667 C18.7599295,27.8666667 16.1333333,25.2400705 16.1333333,22 C16.1333333,18.7599295 18.7599295,16.1333333 22,16.1333333 Z\"/>\n              </svg>\n              Foto's:\n            </h4>\n            <ul class=\"au-w-list-image\">\n              <li class=\"au-w-list-image__item\">\n                <AuImage>\n                  <img src=\"https://embed-dev.toevla.org/assets/img/kinaC1.jpg\" alt=\"\">\n                </AuImage>\n              </li>\n            </ul>\n          ",
                  "criteriaSubItems": []
                },
                {
                  "title": "Alles Bereikbaar",
                  "id": "28c5197a-143d-4de0-b083-5596b60ca7a7",
                  "status": "true",
                  "contents": "\n            <p>Obstakels op de route:</p>\n ",
                  "criteriaSubItems": [
                    {
                      "title": "Meerdere hellende vlakken, 5",
                      "id": "b88f1da8-a570-4b1a-a491-b8724ab0cfb8",
                      "status": "true"
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          "id": "7b1a3de5-ab1b-4aae-8248-49b970a94449",
          "title": "Beleving",
          "criteria": [
            {
              "title": "Museum - Beleving",
              "id": "4056eee7-1d1f-4a54-8e13-799ebffe2193",
              "description": "\n        <p class=\"au-w-info\">\n          Je kan genieten van volgende voorzieningen.\n        </p>\n        <ul class=\"au-w-criterium-section-list\">\n          ",
              "status": "true",
              "criteriaItems": [
                {
                  "title": "Rondleidingen",
                  "id": "992dc11c-7889-436f-8041-3d8abaad3c99",
                  "status": "true",
                  "contents": "\n              <ul class=\"au-w-criterium-list\">\n                \n                \n                \n                \n                \n                \n                \n                \n                \n              </ul>\n            ",
                  "criteriaSubItems": [
                    {
                      "title": "Voor personen met een visuele beperking",
                      "id": "f8616325-4cb2-43b5-bdc8-812e0f8c0855",
                      "status": "true"
                    },
                    {
                      "title": "Voor personen met een auditieve beperking",
                      "id": "020c681d-31d5-4f25-a26a-bd5002cdafbf",
                      "status": ""
                    },
                    {
                      "title": "Voor personen met een mentale beperking",
                      "id": "543697fc-1c3f-4e28-ac6b-37337bc7049d",
                      "status": "true"
                    },
                    {
                      "title": "Leeftijdaangepast: ouderen",
                      "id": "34348271-a0a0-40d6-a2bb-53c2c7f0e963",
                      "status": "true"
                    },
                    {
                      "title": "Leeftijdaangepast: kindvriendelijk",
                      "id": "d69a1bec-fb5c-43a4-b802-4f6a03b608f7",
                      "status": "true"
                    },
                    {
                      "title": "Met beeldentolk",
                      "id": "44344857-4a93-4ad6-8261-57e5a06266a7",
                      "status": ""
                    },
                    {
                      "title": "Met Tolk Vlaamse Gebarentaal (VGT)",
                      "id": "b98df6cb-bc65-43ea-a693-2b65b7b1f954",
                      "status": ""
                    },
                    {
                      "title": "Op rustige momenten",
                      "id": "310f4b03-5cf7-4e2d-8e10-a7b4d28efb37",
                      "status": "true"
                    },
                    {
                      "title": "Bezoek op maat mogelijk",
                      "id": "69646c6a-62a7-458e-829c-43b2c8066e41",
                      "status": "true"
                    }
                  ]
                },
                {
                  "title": "Museum route en zalen",
                  "id": "4b92e76a-bc17-4753-988d-947b1dedd440",
                  "status": "true",
                  "contents": "\n              <ul class=\"au-w-criterium-list\">\n                \n                \n                \n                \n                \n                \n              </ul>\n            ",
                  "criteriaSubItems": [
                    {
                      "title": "Duidelijke bewegwijzering op de route",
                      "id": "a91cef83-0d07-422e-88e6-bf673c6b03ed",
                      "status": "true"
                    },
                    {
                      "title": "Zalenplan/Museumplan/schema",
                      "id": "7d57cd8f-6902-4e23-9ca8-0da756009097",
                      "status": "true"
                    },
                    {
                      "title": "Aanbevolen traject",
                      "id": "54bbd70f-0515-43a2-ba29-37528d4af7c2",
                      "status": ""
                    },
                    {
                      "title": "Alternatief voor niet toegankelijke ruimten",
                      "id": "b302f3a7-adaa-47bd-9636-389babcc9353",
                      "status": ""
                    },
                    {
                      "title": "Meerdere rust- en zitmogelijkheden",
                      "id": "5662fddb-4dab-4cbc-a41a-c4e0460b7c9a",
                      "status": "true"
                    },
                    {
                      "title": "Extra aandacht voor akoestiek",
                      "id": "d40f664b-f125-4bd4-9a14-eda2cd9a3944",
                      "status": "true"
                    }
                  ]
                },
                {
                  "title": "Vitrinetafels, computerschermen",
                  "id": "38253fe1-52be-4b01-839f-fa2083378cbe",
                  "status": "true",
                  "contents": "\n              <ul class=\"au-w-criterium-list\">\n                \n                \n              </ul>\n            ",
                  "criteriaSubItems": [
                    {
                      "title": "Meerdere onderrijdbare elementen",
                      "id": "6f809d1c-9646-447a-8fb6-972ea8184516",
                      "status": "true"
                    },
                    {
                      "title": "Goede verlichting",
                      "id": "f8430981-e56f-44d4-b207-0a68e8c4f407",
                      "status": "true"
                    }
                  ]
                },
                {
                  "title": "Teksten/borden/panelen",
                  "id": "10f06d92-cfee-4662-bf55-d63fca03e7e0",
                  "status": "true",
                  "contents": "\n              <ul class=\"au-w-criterium-list\">\n                \n                \n                \n                \n              </ul>\n            ",
                  "criteriaSubItems": [
                    {
                      "title": "Contrast",
                      "id": "04ae56ff-fc48-4024-915a-6f7978a39cc8",
                      "status": "true"
                    },
                    {
                      "title": "Geen reflexie",
                      "id": "ffba3dd5-6ce0-4300-baf5-ca8c65485fa6",
                      "status": "true"
                    },
                    {
                      "title": "Braille",
                      "id": "32e60f95-0496-4dca-b83f-53a740210508",
                      "status": "true"
                    },
                    {
                      "title": "Grootletterschrift",
                      "id": "c02b2ee1-ce76-4791-88f8-f1bea6e71a84",
                      "status": "true"
                    }
                  ]
                },
                {
                  "title": "Audiogids",
                  "id": "fee0b2fb-4926-4c52-b230-6926f10f1e6d",
                  "status": "",
                  "contents": "\n              <ul class=\"au-w-criterium-list\">\n                \n              </ul>\n            ",
                  "criteriaSubItems": [
                    {
                      "title": "In meerdere talen",
                      "id": "6494579e-450a-4f70-8693-2617962f1e1c",
                      "status": "true"
                    }
                  ]
                },
                {
                  "title": "Virtuele technologie",
                  "id": "ba306583-7719-4f08-8eea-925f87b8c6b0",
                  "status": "true",
                  "contents": "",
                  "criteriaSubItems": []
                },
                {
                  "title": "Multisensorieel - zintuigen",
                  "id": "bb93e25a-c693-40c6-942c-0e24bde5bb7d",
                  "status": "true",
                  "contents": "\n              <ul class=\"au-w-criterium-list\">\n                \n                \n                \n                \n              </ul>\n            ",
                  "criteriaSubItems": [
                    {
                      "title": "Voel-elementen",
                      "id": "15d7cfc7-b3c9-4ae3-9f93-4602230d5c61",
                      "status": "true"
                    },
                    {
                      "title": "Geur-elementen",
                      "id": "8bffb0bd-b130-4dba-afe2-4550f0979655",
                      "status": "true"
                    },
                    {
                      "title": "Doe-elementen",
                      "id": "3fb95853-e071-4c78-bdae-9be778e8dbb2",
                      "status": "true"
                    },
                    {
                      "title": "Luister-elementen",
                      "id": "a805b113-fd07-4a41-91dc-b0af4b4f3f78",
                      "status": "true"
                    }
                  ]
                },
                {
                  "title": "Andere belevingselementen",
                  "id": "39e4d5fe-e382-4431-84f3-cbb13ced1bec",
                  "status": "true",
                  "contents": "\n              <p>Alle op kinderhoogte en rolstoelhoogte.</p>\n            ",
                  "criteriaSubItems": []
                }
              ]
            },
            {
              "title": "Wisselende expo",
              "id": "7c2b6034-fc4b-40fd-8890-a63452315886",
              "description": "",
              "status": "true",
              "criteriaItems": [
                {
                  "title": "Rolstoelvriendelijke circulatie",
                  "id": "09b3b03a-5e81-4ceb-83c0-275f00b87d87",
                  "status": "true",
                  "contents": "",
                  "criteriaSubItems": []
                },
                {
                  "title": "Audiogids",
                  "id": "ecf39a5e-07b6-4bc8-9f5c-9463c868f82a",
                  "status": "true",
                  "contents": "\n                <ul class=\"au-w-criterium-list\">\n                  \n                </ul>\n              ",
                  "criteriaSubItems": [
                    {
                      "title": "In meerdere talen",
                      "id": "e0e70cc3-73a3-471d-b993-a0727c0f31ec",
                      "status": "true"
                    }
                  ]
                },
                {
                  "title": "Beleving",
                  "id": "6c4f2399-dab9-42af-baa3-527b34ccbce7",
                  "status": "true",
                  "contents": "\n                <p>De leefwereld van Jan Van Eyck, gericht op Kinderen</p>\n                <p>Extra Aangepast Toilet aanwezig vlakbij deze expo-ruimte </p>\n              ",
                  "criteriaSubItems": []
                }
              ]
            },
            {
              "title": "Eet- en drinkgelegenheid",
              "id": "c700e417-f3c5-449c-8b39-ac53b42da140",
              "description": "",
              "status": "true",
              "criteriaItems": [
                {
                  "title": "Rolstoelvriendelijke eet- en drinkgelegenheid",
                  "id": "3728b4d6-0efb-4830-8c0a-bbe4b38b68c6",
                  "status": "true",
                  "contents": "\n            <ul class=\"au-w-criterium-list\">\n              \n              \n              \n            </ul>\n          ",
                  "criteriaSubItems": [
                    {
                      "title": "Bereikbaar",
                      "id": "0e8e7921-960a-4b9e-bd60-dfc9093610fc",
                      "status": "true"
                    },
                    {
                      "title": "Alles op gelijkvloers",
                      "id": "d9ddc141-f99b-4e53-a6ef-d225aa0b33b8",
                      "status": "true"
                    },
                    {
                      "title": "Tafel(s): onderrijdbaar",
                      "id": "9937db7e-c245-4362-9e00-4b984ae40b9a",
                      "status": "true"
                    }
                  ]
                },
                {
                  "title": "Elektronische betaalmogelijkheid niet verplaatsbaar",
                  "id": "cb0adbea-eb5b-4e60-b91a-f5c0fe964f97",
                  "status": "true",
                  "contents": "",
                  "criteriaSubItems": []
                },
                {
                  "title": "Geschikt voor grote groepen (met mobiele beperking)",
                  "id": "6150c5df-8190-45ac-98a3-bb65a024ca4b",
                  "status": "true",
                  "contents": "",
                  "criteriaSubItems": []
                },
                {
                  "title": "Goed verlichte zones",
                  "id": "93d3b881-215a-41be-af83-21c0425e5280",
                  "status": "true",
                  "contents": "",
                  "criteriaSubItems": []
                },
                {
                  "title": "Menukaart ",
                  "id": "5aa4a5c5-20fc-4116-af30-992d0063de6d",
                  "status": "true",
                  "contents": "\n            <ul class=\"au-w-criterium-list\">\n              \n            </ul>\n          ",
                  "criteriaSubItems": [
                    {
                      "title": "Duidelijk leesbaar (contrast, lettertype)",
                      "id": "c8bde29a-741d-47a5-9a92-8c63c7655f6f",
                      "status": "true"
                    }
                  ]
                },
                {
                  "title": "Extra's voor kinderen aanwezig",
                  "id": "b11edee6-bdf6-41b0-bc76-465060d7f1ae",
                  "status": "true",
                  "contents": "",
                  "criteriaSubItems": [
                    {
                      "title": "Kinderbuggy's beschikbaar",
                      "id": "c217311f-4ccd-4ede-9e45-bb797a5630e9",
                      "status": "true"
                    },
                    {
                      "title": "Gebruik van microgolfoven mogelijk",
                      "id": "acacc6be-35e9-44ca-ae45-6acfc041339e",
                      "status": ""
                    }
                  ]
                }
              ]
            },
            {
              "title": "Terras bij verbruiksruimte",
              "id": "8344aac6-0c8e-40d2-a863-10fae2a40656",
              "description": "\n        <p class=\"au-w-info-text\">Geen extra info beschikbaar.</p>\n    ",
              "status": "",
              "criteriaItems": []
            }
          ]
        }
      ]
    }
  
  
  
  
  
  
  
  }
  else if(req.query.dataResource=='http://toevla.org/id/test'){
    data={
      //client/building
      "id": "TestId",
      "title": "TestTitle",
      "category": "TestCategory",
      "rating": "TestRating",
      "theme": "",
      "criteriaGroups":[{
        "id": "CriteriaGroupTestId",
        "title":"CriteriaGroupTestTitle",
        "criteria": [{
          "title":"CriteriaTestTitle",
          "id":"CriteriaTestId",
          "description":"CriteriaTestDescription",
          "status":"true",
          "criteriaItems":[{
            "title":"CriteriaItemTestTitle",
            "id":"CriteriaItemTestId",
            "status": "",
            "contents":`CriteriaItemTestContent`,
            "criteriaSubItems":[{
              "title": "CriteriaSubItemTestTitle",
              "id": "CriteriaSubItemTestId",
              "status": "true"
            }]
          }]
        }]
      }]
    }
  }
  res.send(JSON.stringify(data));
});

app.use(errorHandler);

