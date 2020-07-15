(in-package :mu-cl-resources)

(define-resource tree ()
  :class (s-prefix "skos:ConceptScheme")
  :properties `((:title :string ,(s-prefix "skos:prefLabel")))
  :has-many `((tree-node :via ,(s-prefix "skos:hasTopConcept")
                         :as "top-level-nodes"))
  :features '(include-uri)
  :resource-base (s-url "http://data.toevla.org/concept-schemes/")
  :on-path "trees")

(define-resource tree-node ()
  :class (s-prefix "skos:Concept")
  :properties `((:title :string ,(s-prefix "skos:prefLabel"))
                (:order :number ,(s-prefix "ext:order"))
                (:htmlContent :string ,(s-prefix "ext:htmlContent"))
                (:positive-template-string :string ,(s-prefix "toevla:positiveTemplate"))
                (:negative-template-string :string ,(s-prefix "toevla:negativeTemplate")))
  :has-many `((tree-node :via ,(s-prefix "skos:broader")
                     :inverse t
                     :as "children"))
  :has-one `((tree-node :via ,(s-prefix "skos:broader")
                        :as "parent"))
  :features '(include-uri)
  :resource-base (s-url "http://data.toevla.org/tree-nodes/")
  :on-path "tree-nodes")

(define-resource point-of-interest ()
  :class (s-url "https://data.vlaanderen.be/ns/adres#AdresseerbaarObject")
  :properties `((:label :string ,(s-prefix "rdfs:label"))
                (:has-movable-electronic-payment-system :boolean ,(s-prefix "toevla:hasMovableElectronicPaymentSystem"))
                (:wifi-always-available :boolean ,(s-prefix "toevla:wifiAlwaysAvailable"))
                (:assistance-for-guide-dogs :boolean ,(s-prefix "toevla:assistanceForGuideDogs"))
                (:website-has-screenreader :boolean ,(s-prefix "toevla:websiteHasScreenreader"))
                (:website-supports-wcag2 :boolean ,(s-prefix "toevla:websiteSupportsWCAG2"))
                (:website-allows-text-increase :boolean ,(s-prefix "toevla:websiteAllowsTextIncrease"))
                (:public-transport-guidance-available :boolean ,(s-prefix "toevla:publicTransportGuidanceAvailable"))
                (:wheelchair-available :boolean ,(s-prefix "toevla:wheelchairAvailable"))
                (:website-has-accessible-contrast :boolean ,(s-prefix "toevla:websiteHasAccessibleContrast"))
                (:website-has-sign-language :boolean ,(s-prefix "toevla:websiteHasSignLanguage"))
                (:has-clearly-recognizable-building :boolean ,(s-prefix "toevla:hasClearlyRecognizableBuilding"))
                (:has-visible-guidelines :boolean ,(s-prefix "toevla:hasVisibleGuidelines"))
                (:has-markings-or-contrasts-on-glass-doors :boolean ,(s-prefix "toevla:hasMarkingsOrContrastsOnGlassDoors"))
                (:extra-attention-given-to-acoustics :boolean ,(s-prefix "toevla:extraAttentionGivenToAcoustics"))
                (:has-clearly-recognizable-entrance :boolean ,(s-prefix "toevla:hasClearlyRecognizableEntrance"))
                (:has-alternative-entrance-for-wheelchair :boolean ,(s-prefix "toevla:hasAlternativeEntranceForWheelchair")))
  :has-many `((experience :via ,(s-prefix "toevla:atLocation")
                          :inverse t
                          :as "experiences")
              (entrance :via ,(s-prefix "toevla:hasEntrance")
                        :as "entrances")
              (parking :via ,(s-prefix "toevla:hasParking")
                       :as "parkings"))
  ;; :has-one `(mu-resource-has-one)
  :resource-base (s-url "http://data.toevla.org/points-of-interest/")
  :on-path "points-of-interest")

(define-resource parking ()
  :class (s-prefix "schema:Parking")
  :properties `((:is-part-of-location :boolean ,(s-prefix "toevla:isPartOfLocation"))
                (:has-drive-on-possibility :boolean ,(s-prefix "toevla:hasDriveOnPossibility"))
                (:is-well-lit :boolean ,(s-prefix "toevla:isWellLit"))
                (:has-detailed-route-description :boolean ,(s-prefix "toevla:hasDetailedRouteDescription"))
                (:detailed-route-description-has-screen-reader :boolean ,(s-prefix "toevla:detailedRouteDescriptionHasScreenReader"))
                (:detailed-route-description-is-available-in-flemish-sign-language :boolean ,(s-prefix "toevla:detailedRouteDescriptionIsAvailableInFlemishSignLanguage"))
                (:number-of-wheelchair-friendly-spots :boolean ,(s-prefix "toevla:numberOfWheelchairFriendlySpots"))
                (:on-public-domain :boolean ,(s-prefix "toevla:onPublicDomain"))
                (:has-wheelchair-friendly-terrain :boolean ,(s-prefix "toevla:hasWheelchairFriendlyTerrain"))
                (:parking-space-length :number ,(s-prefix "toevla:parkingSpaceLength"))
                (:parking-space-width :number ,(s-prefix "toevla:parkingSpaceWidth"))
                (:max-vehicle-height :number ,(s-prefix "toevla:maxVehicleHeight")))
  ;; :has-many `(mu-resource-has-many)
  :has-one `((path :via ,(s-prefix "toevla:pathToEntrance")
                   :as "path-to-entrance"))
  :resource-base (s-url "http://data.toevla.org/parkings/")
  :on-path "parkings")

(define-resource path ()
  :class (s-prefix "toevla:Path")
  :properties `((:has-wheelchair-friendly-terrain :boolean ,(s-prefix "toevla:hasWheelchairFriendlyTerrain"))
                (:narrowest-point :number ,(s-prefix "toevla:narrowestPoint"))
                (:highest-threshold :number ,(s-prefix "toevla:highestThreshold"))
                (:amount-of-thresholds :number ,(s-prefix "toevla:numberOfThresholds"))
                (:amount-of-stairs :number ,(s-prefix "toevla:amountOfStairs"))
                (:amount-of-slopes :number ,(s-prefix "toevla:amountOfSlopes"))
                (:has-ramp :boolean ,(s-prefix "toevla:hasRamp")))
  ;; :has-one `(mu-resource-has-one)
  :resource-base (s-url "http://data.toevla.org/paths/")
  :on-path "paths")

(define-resource entrance ()
  :class (s-prefix "toevla:Entrance")
  :properties `((:has-visible-guidelines :boolean ,(s-prefix "toevla:hasVisibleGuidelines"))
                (:has-manned-desk :boolean ,(s-prefix "toevla:hasMannedDesk"))
                (:has-teleloop-at-counter :boolean ,(s-prefix "toevla:hasTeleloopAtCounter"))
                (:highest-threshold :number ,(s-prefix "toevla:highestThreshold"))
                (:amount-of-stairs :number ,(s-prefix "toevla:amountOfStairs"))
                (:amount-of-slopes :number ,(s-prefix "toevla:amountOfSlopes"))
                (:has-entrance-gutters :boolean ,(s-prefix "toevla:hasRamps"))
                (:has-revolving-door :boolean ,(s-prefix "toevla:hasRevolvingDoor"))
                (:door-width :number ,(s-prefix "toevla:doorWidth"))
                (:has-entrance-check :number ,(s-prefix "toevla:hasEntranceCheck")) ; todo fix in semantic model
                (:turning-radius-at-door :number ,(s-prefix "toevla:turningRadiusAtDoor"))
                (:force-for-opening-door :number ,(s-prefix "toevla:forceForOpeningDoor"))
                (:has-lowered-counter :number ,(s-prefix "toevla:hasLoweredCounter"))) ; todo fix in semantic model
  :has-one `((point-of-interest :via ,(s-prefix "toevla:hasEntrance")
                                :inverse t
                                :as "point-of-interest"))
  :resource-base (s-url "http://data.toevla.org/entrances/")
  :on-path "entrances")

(define-resource experience ()
  :class (s-prefix "toevla:Experience")
  :properties `((:title :string ,(s-prefix "dct:title")))
  ;; :has-many `(mu-resource-has-many)
  :has-one `((point-of-interest :via ,(s-prefix "toevla:atLocation")
                                :as "point-of-interest"))
  :has-many `((experience-tree-node-score :via ,(s-prefix "toevla:scoreSubject")
                                          :inverse t
                                          :as "experience-tree-node-scores"))
  :resource-base (s-url "http://data.toevla.org/experiences/")
  :on-path "experiences")

(define-resource experience-tree-node-score ()
  :class (s-prefix "toevla:ExperienceTreeNodeScore")
  :properties `((:score :string ,(s-prefix "dct:title")))
  :has-one `((experience :via ,(s-prefix "toevla:scoreSubject")
                         :as "experience")
             (tree-node :via ,(s-prefix "toevla:scoreTopic")
                        :as "tree-node"))
  :resource-base (s-url "http://data.toevla.org/experience-tree-node-scores/")
  :on-path "experience-tree-node-scores")



;;;;
;; NOTE
;; docker-compose stop; docker-compose rm; docker-compose up
;; after altering this file.

;; Describe your resources here

;; The general structure could be described like this:
;;
;; (define-resource <name-used-in-this-file> ()
;;   :class <class-of-resource-in-triplestore>
;;   :properties `((<json-property-name-one> <type-one> ,<triplestore-relation-one>)
;;                 (<json-property-name-two> <type-two> ,<triplestore-relation-two>>))
;;   :has-many `((<name-of-an-object> :via ,<triplestore-relation-to-objects>
;;                                    :as "<json-relation-property>")
;;               (<name-of-an-object> :via ,<triplestore-relation-from-objects>
;;                                    :inverse t ; follow relation in other direction
;;                                    :as "<json-relation-property>"))
;;   :has-one `((<name-of-an-object :via ,<triplestore-relation-to-object>
;;                                  :as "<json-relation-property>")
;;              (<name-of-an-object :via ,<triplestore-relation-from-object>
;;                                  :as "<json-relation-property>"))
;;   :resource-base (s-url "<string-to-which-uuid-will-be-appended-for-uri-of-new-items-in-triplestore>")
;;   :on-path "<url-path-on-which-this-resource-is-available>")


;; An example setup with a catalog, dataset, themes would be:
;;
;; (define-resource catalog ()
;;   :class (s-prefix "dcat:Catalog")
;;   :properties `((:title :string ,(s-prefix "dct:title")))
;;   :has-many `((dataset :via ,(s-prefix "dcat:dataset")
;;                        :as "datasets"))
;;   :resource-base (s-url "http://webcat.tmp.semte.ch/catalogs/")
;;   :on-path "catalogs")

;; (define-resource dataset ()
;;   :class (s-prefix "dcat:Dataset")
;;   :properties `((:title :string ,(s-prefix "dct:title"))
;;                 (:description :string ,(s-prefix "dct:description")))
;;   :has-one `((catalog :via ,(s-prefix "dcat:dataset")
;;                       :inverse t
;;                       :as "catalog"))
;;   :has-many `((theme :via ,(s-prefix "dcat:theme")
;;                      :as "themes"))
;;   :resource-base (s-url "http://webcat.tmp.tenforce.com/datasets/")
;;   :on-path "datasets")

;; (define-resource distribution ()
;;   :class (s-prefix "dcat:Distribution")
;;   :properties `((:title :string ,(s-prefix "dct:title"))
;;                 (:access-url :url ,(s-prefix "dcat:accessURL")))
;;   :resource-base (s-url "http://webcat.tmp.tenforce.com/distributions/")
;;   :on-path "distributions")

;; (define-resource theme ()
;;   :class (s-prefix "tfdcat:Theme")
;;   :properties `((:pref-label :string ,(s-prefix "skos:prefLabel")))
;;   :has-many `((dataset :via ,(s-prefix "dcat:theme")
;;                        :inverse t
;;                        :as "datasets"))
;;   :resource-base (s-url "http://webcat.tmp.tenforce.com/themes/")
;;   :on-path "themes")

;;
