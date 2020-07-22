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
  def user_groups do
    [
      # // PUBLIC
      %GroupSpec{
        name: "public",
        useage: [:read,:write,:read_for_write],
        access: %AlwaysAccessible{}, # TODO: Should be only for logged in users
        graphs: [ %GraphSpec{
                    graph: "http://mu.semte.ch/graphs/public",
                    constraint: %ResourceConstraint{
                      resource_types: [
                        "http://www.w3.org/2004/02/skos/core#ConceptScheme",
                        "http://www.w3.org/2004/02/skos/core#Concept",
                        "https://data.vlaanderen.be/ns/adres#AdresseerbaarObject",
                        "http://schema.org/Parking",
                        "http://toevla.org/ns/generic/Entrance",
                        "https://linkedgeodata.org/ontology/Toilets",
                        "http://toevla.org/ns/generic/Area",
                        "http://toevla.org/ns/generic/Experience",
                        "http://toevla.org/ns/generic/ExperienceTreeNodeScore",
                        "http://toevla.org/ns/generic/Path"
                      ]
                    } }
                ] },
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
