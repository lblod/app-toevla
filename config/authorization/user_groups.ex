alias Acl.Accessibility.Always, as: AlwaysAccessible
alias Acl.Accessibility.ByQuery, as: AccessByQuery
alias Acl.GraphSpec.Constraint.Resource.AllPredicates, as: AllPredicates
alias Acl.GraphSpec.Constraint.Resource.NoPredicates, as: NoPredicates
alias Acl.GraphSpec.Constraint.ResourceFormat, as: ResourceFormatConstraint
alias Acl.GraphSpec.Constraint.Resource, as: ResourceConstraint
alias Acl.GraphSpec, as: GraphSpec
alias Acl.GroupSpec, as: GroupSpec
alias Acl.GroupSpec.GraphCleanup, as: GraphCleanup

defmodule Acl.UserGroups.Config do
  @known_resource_types [
    "http://www.w3.org/2004/02/skos/core#ConceptScheme",
    "http://www.w3.org/2004/02/skos/core#Concept",
    "https://data.vlaanderen.be/ns/adres#AdresseerbaarObject",
    "http://schema.org/Parking",
    "http://toevla.org/ns/generic/Entrance",
    "http://toevla.org/ns/generic/GuidedTour",
    "http://toevla.org/ns/generic/Auditorium",
    "https://linkedgeodata.org/ontology/Toilets",
    "http://toevla.org/ns/generic/Area",
    "http://toevla.org/ns/generic/Experience",
    "http://toevla.org/ns/generic/Route",
    "http://toevla.org/ns/generic/TreeNodeScore",
    "http://toevla.org/ns/generic/Scorable",
    "http://toevla.org/ns/generic/Path",
    "http://toevla.org/ns/generic/RouteDescription",
    "http://toevla.org/ns/generic/TrainStop",
    "http://toevla.org/ns/generic/BusStop",
    "http://toevla.org/ns/generic/TramStop",
    "http://toevla.org/ns/generic/Restaurant",
    "http://toevla.org/ns/generic/Shop",
    "http://toevla.org/ns/generic/Widget"
  ]

  @museum_types [
    "https://data.vlaanderen.be/ns/adres#AdresseerbaarObject",
    "http://schema.org/Parking",
    "http://toevla.org/ns/generic/Entrance",
    "http://toevla.org/ns/generic/GuidedTour",
    "http://toevla.org/ns/generic/Auditorium",
    "https://linkedgeodata.org/ontology/Toilets",
    "http://toevla.org/ns/generic/Area",
    "http://toevla.org/ns/generic/Experience",
    "http://toevla.org/ns/generic/Route",
    "http://toevla.org/ns/generic/TreeNodeScore",
    "http://toevla.org/ns/generic/Scorable",
    "http://toevla.org/ns/generic/Path",
    "http://toevla.org/ns/generic/RouteDescription",
    "http://toevla.org/ns/generic/TrainStop",
    "http://toevla.org/ns/generic/BusStop",
    "http://toevla.org/ns/generic/TramStop",
    "http://toevla.org/ns/generic/Restaurant",
    "http://toevla.org/ns/generic/Shop",
    "http://toevla.org/ns/generic/Widget",
    "http://www.semanticdesktop.org/ontologies/2007/03/22/nfo#FileDataObject"
  ]

  @session_types [
    "http://mu.semte.ch/vocabularies/session/Session"
  ]

  @account_types [
    "http://xmlns.com/foaf/0.1/Person",
    "http://xmlns.com/foaf/0.1/OnlineAccount",
    "http://mu.semte.ch/vocabularies/ext/Role",
    "http://mu.semte.ch/vocabularies/ext/ValidatorRole",
    "http://mu.semte.ch/vocabularies/ext/DataEntryRole"
  ]

  @shared_readonly [
    "http://www.w3.org/2004/02/skos/core#ConceptScheme",
    "http://www.w3.org/2004/02/skos/core#Concept"
  ]

  @file_types [
    "http://www.semanticdesktop.org/ontologies/2007/03/22/nfo#FileDataObject"
  ]

  def user_groups do
    [
      # Accounts
      %GroupSpec{
        name: "account",
        # TODO: remove :write and ensure writing happens through custom
        # service
        useage: [:read],
        access: %AccessByQuery{
          query: "PREFIX ext: <http://mu.semte.ch/vocabularies/ext/>
                  PREFIX mu: <http://mu.semte.ch/vocabularies/core/>
                  PREFIX musession: <http://mu.semte.ch/vocabularies/session/>
                  SELECT ?id WHERE {
                    <SESSION_ID> ext:hasAccount/mu:uuid ?id.
                  }",
          vars: ["id"]
        },
        graphs: [
          %GraphSpec{
            graph: "http://data.toevla.org/accounts/",
            constraint: %ResourceConstraint{
              resource_types: @account_types ++ @session_types
            }
          }
        ]
      },

      # Museum
      %GroupSpec{
        name: "museum",
        useage: [:read, :write, :read_for_write],
        access: %AccessByQuery{
          query: "PREFIX ext: <http://mu.semte.ch/vocabularies/ext/>
                  PREFIX mu: <http://mu.semte.ch/vocabularies/core/>
                  PREFIX musession: <http://mu.semte.ch/vocabularies/session/>
                  SELECT ?id WHERE {
                    <SESSION_ID> ext:hasRole/ext:actsOn/mu:uuid ?id.
                  }",
          vars: ["id"]
        },
        graphs: [
          %GraphSpec{
            graph: "http://data.toevla.org/musea/",
            constraint: %ResourceConstraint{
              resource_types: @museum_types
            }
          }
        ]
      },

      # Inter
      %GroupSpec{
        name: "inter",
        useage: [:read, :write, :read_for_write],
        access: %AccessByQuery{
          query: "PREFIX ext: <http://mu.semte.ch/vocabularies/ext/>
                  PREFIX mu: <http://mu.semte.ch/vocabularies/core/>
                  PREFIX musession: <http://mu.semte.ch/vocabularies/session/>
                  SELECT * WHERE {
                    <SESSION_ID> ext:hasRole/a ext:ValidatorRole.
                  }",
          vars: []
        },
        graphs: [
          %GraphSpec{
            graph: "http://data.toevla.org/inter",
            constraint: %ResourceConstraint{
              resource_types: @account_types ++ @museum_types
            }
          }
        ]
      },

      # Shared knowledge
      %GroupSpec{
        name: "shared",
        useage: [:read],
        access: %AlwaysAccessible{},
        graphs: [
          %GraphSpec{
            graph: "http://mu.semte.ch/graphs/shared", # TODO: can become public in the future
            constraint: %ResourceConstraint{
              resource_types: [
                "http://www.w3.org/2004/02/skos/core#ConceptScheme",
                "http://www.w3.org/2004/02/skos/core#Concept"
              ]
            }
          }
        ]
      },

      # OLD PUBLIC
      %GroupSpec{
        name: "public",
        useage: [:read],
        access: %AccessByQuery{
          query: "PREFIX ext: <http://mu.semte.ch/vocabularies/ext/>
                  PREFIX mu: <http://mu.semte.ch/vocabularies/core/>
                  PREFIX musession: <http://mu.semte.ch/vocabularies/session/>
                  SELECT ?s WHERE {
                    ?s ?p ?o.
                    FILTER NOT EXISTS {
                      <SESSION_ID> ext:hasAccount ?account.
                    }
                  } LIMIT 1",
          vars: []
        },
        graphs: [
          %GraphSpec{
            graph: "http://mu.semte.ch/graphs/public",
            constraint: %ResourceConstraint{
              resource_types: @known_resource_types
            }
          }
        ]
      },

      %GroupSpec{
        name: "thumbnails",
        useage: [:read, :write, :read_for_write],
        access: %AccessByQuery{
          query: "PREFIX ext: <http://mu.semte.ch/vocabularies/ext/>
                  PREFIX mu: <http://mu.semte.ch/vocabularies/core/>
                  PREFIX musession: <http://mu.semte.ch/vocabularies/session/>
                  SELECT ?s WHERE {
                    ?s ?p ?o.
                    FILTER NOT EXISTS {
                      <SESSION_ID> ext:hasAccount ?account.
                    }
                  } LIMIT 1",
          vars: []
        },
        graphs: [
          %GraphSpec{
            graph: "http://mu.semte.ch/graphs/public",
            constraint: %ResourceConstraint{
              resource_types: @file_types
            }
          }
        ]
      },

      # // CLEANUP
      #
      %GraphCleanup{
        originating_graph: "http://mu.semte.ch/application",
        useage: [:write],
        name: "clean"
      }
    ]
  end
end
