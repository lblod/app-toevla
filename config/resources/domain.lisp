(in-package :mu-cl-resources)

(setq *cache-model-properties-p* t)
(setq *cache-count-queries-p* t)
(setq *supply-cache-headers-p* t)

(define-resource widget ()
  :class (s-prefix "toevla:Widget")
  :has-one `((point-of-interest :via ,(s-prefix "toevla:rendersPoi")
                                :as "point-of-interest"))
  :features '(include-uri)
  :resource-base (s-url "http://data.toegankelijk.vlaanderen.be/id/widgets/")
  :on-path "widgets")

(define-resource concept-scheme ()
  :class (s-prefix "skos:ConceptScheme")
  :properties `((:title :string ,(s-prefix "skos:prefLabel")))
  :has-many `((concept :via ,(s-prefix "skos:hasTopConcept")
                         :as "top-level-nodes"))
  :features '(include-uri)
  :resource-base (s-url "http://data.toegankelijk.vlaanderen.be/id/concept-schemes/")
  :on-path "concept-schemes")

(define-resource concept ()
  :class (s-prefix "skos:Concept")
  :properties `((:title :string ,(s-prefix "skos:prefLabel"))
                (:selectable-label :string ,(s-prefix "toevla:selectableLabel"))

                (:order :number ,(s-prefix "ext:order"))
                (:htmlContent :string ,(s-prefix "ext:htmlContent"))
                (:criterion-type :string ,(s-prefix "toevla:type"))

                (:first-limit :string ,(s-prefix "toevla:firstLimit"))
                (:first-label :string ,(s-prefix "toevla:firstComment"))
                (:first-score :string ,(s-prefix "toevla:firstScore"))
                (:second-limit :string ,(s-prefix "toevla:secondLimit"))
                (:second-label :string ,(s-prefix "toevla:secondComment"))
                (:second-score :string ,(s-prefix "toevla:secondScore"))
                (:third-limit :string ,(s-prefix "toevla:thirdLimit"))
                (:third-label :string ,(s-prefix "toevla:thirdComment"))
                (:third-score :string ,(s-prefix "toevla:thirdScore")))
  :has-many `((concept :via ,(s-prefix "skos:broader")
                     :inverse t
                     :as "children")
              (file :via ,(s-prefix "toevla:belongsToTreeNode")
                    :inverse t
                    :as "images"))
  :has-one `((concept :via ,(s-prefix "skos:broader")
                        :as "parent"))
  :features '(include-uri)
  :resource-base (s-url "http://data.toegankelijk.vlaanderen.be/id/concepts/")
  :on-path "concepts")

(define-resource point-of-interest ()
  :class (s-url "https://data.vlaanderen.be/ns/adres#AdresseerbaarObject")
  :properties `((:label :string ,(s-prefix "rdfs:label"))
                (:location-string :string ,(s-prefix "ext:locationString"))
                (:has-cash-payment :boolean ,(s-prefix "toevla:hasCashPayment"))
                (:has-payment-with-movable-electronic-payment-system :boolean ,(s-prefix "toevla:hasPaymentWithMovableElectronicPaymentSystem"))
                (:has-payment-with-fixed-electronic-payment-system :boolean ,(s-prefix "toevla:hasPaymentWithFixedElectronicPaymentSystem"))
                (:wifi-always-available :boolean ,(s-prefix "toevla:wifiAlwaysAvailable"))
                (:assistance-for-guide-dogs :boolean ,(s-prefix "toevla:assistanceForGuideDogs"))
                (:website-has-screenreader :boolean ,(s-prefix "toevla:websiteHasScreenreader"))
                (:website-supports-wcag2 :boolean ,(s-prefix "toevla:websiteSupportsWCAG2"))
                (:website-allows-text-increase :boolean ,(s-prefix "toevla:websiteAllowsTextIncrease"))
                (:website-has-accessible-contrast :boolean ,(s-prefix "toevla:websiteHasAccessibleContrast"))
                (:website-has-sign-language :boolean ,(s-prefix "toevla:websiteHasSignLanguage"))
                (:public-transport-guidance-available :boolean ,(s-prefix "toevla:publicTransportGuidanceAvailable"))
                (:wheelchair-available :boolean ,(s-prefix "toevla:wheelchairAvailable"))
                (:has-clearly-recognizable-building :boolean ,(s-prefix "toevla:hasClearlyRecognizableBuilding"))
                (:has-visible-guidelines :boolean ,(s-prefix "toevla:hasVisibleGuidelines"))
                (:has-visual-visit-preparation-plan :boolean ,(s-prefix "toevla:hasVisualVisitPreparationPlan"))
                (:has-markings-or-contrasts-on-glass-doors :boolean ,(s-prefix "toevla:hasMarkingsOrContrastsOnGlassDoors"))
                (:extra-attention-given-to-acoustics :boolean ,(s-prefix "toevla:extraAttentionGivenToAcoustics"))
                (:has-clearly-recognizable-entrance :boolean ,(s-prefix "toevla:hasClearlyRecognizableEntrance"))
                (:has-alternative-entrance-for-wheelchair :boolean ,(s-prefix "toevla:hasAlternativeEntranceForWheelchair"))
                (:has-free-entrance-for-guide :boolean ,(s-prefix "toevla:hasFreeEntranceForGuide"))
                (:accepts-museum-pass :boolean ,(s-prefix "toevla:acceptsMuseumPass"))
                (:accepts-uitpas :boolean ,(s-prefix "toevla:acceptsUitpas"))
                (:accepts-city-pass :boolean ,(s-prefix "toevla:acceptsCityPass"))
                (:accepts-edc :boolean ,(s-prefix "toevla:acceptsEdc")))
  :has-many `((experience :via ,(s-prefix "toevla:atLocation")
                          :inverse t
                          :as "experiences")
              (file :via ,(s-prefix "toevla:hasFile")
                        :as "files")
              (file :via ,(s-prefix "toevla:hasImage")
                        :as "images")
              (entrance :via ,(s-prefix "toevla:hasEntrance")
                        :as "entrances")
              (parking :via ,(s-prefix "toevla:hasParking")
                       :as "parkings")
              (toilet :via ,(s-prefix "toevla:hasToilet")
                      :as "toilets")
              (train-stop :via ,(s-prefix "toevla:hasTrainStop")
                          :as "train-stops")
              (bus-stop :via ,(s-prefix "toevla:hasBusStop")
                        :as "bus-stops")
              (tram-stop :via ,(s-prefix "toevla:hasTramStop")
                         :as "tram-stops"))
  :has-one `((route-description :via ,(s-prefix "toevla:hasPublicTransportRouteDescription")
                                :as "public-transport-route-description")
             (restaurant :via ,(s-prefix "toevla:hasRestaurant")
                         :as "restaurant")
             (widget :via ,(s-prefix "toevla:rendersPoi")
                     :inverse t
                     :as "widget")
             (shop :via ,(s-prefix "toevla:hasShop")
                   :as "shop"))
  :features '(include-uri)
  :resource-base (s-url "http://data.toegankelijk.vlaanderen.be/id/points-of-interest/")
  :on-path "points-of-interest")

(define-resource restaurant ()
  :class (s-prefix "toevla:Restaurant")
  :properties `((:has-cash-payment :boolean ,(s-prefix "toevla:hasCashPayment"))
                (:has-payment-with-movable-electronic-payment-system :boolean ,(s-prefix "toevla:hasPaymentWithMovableElectronicPaymentSystem"))
                (:has-payment-with-fixed-electronic-payment-system :boolean ,(s-prefix "toevla:hasPaymentWithFixedElectronicPaymentSystem"))
                (:amount-of-seating-places :number ,(s-prefix "toevla:amountOfSeatingPlaces"))
                (:has-space-suited-for-groups-with-mobile-limitation :boolean ,(s-prefix "toevla:hasSpaceSuitedForGroupsWithMobileLimitation"))
                (:has-menu-available-online :boolean ,(s-prefix "toevla:hasMenuAvailableOnline"))
                (:has-menu-visually-clear-to-read :boolean ,(s-prefix "toevla:hasMenuVisuallyClearToRead"))
                (:has-menu-available-in-braille :boolean ,(s-prefix "toevla:hasMenuAvailableInBraille"))
                (:has-menu-available-with-pictures :boolean ,(s-prefix "toevla:hasMenuAvailableWithPictures"))
                (:has-diet-based-meas-adjustment :boolean ,(s-prefix "toevla:hasDietBasedMeasAdjustment"))
                (:has-information-on-allergenics :boolean ,(s-prefix "toevla:hasInformationOnAllergenics"))
                (:has-children-menu :boolean ,(s-prefix "toevla:hasChildrenMenu"))
                (:has-child-seat :boolean ,(s-prefix "toevla:hasChildSeat"))
                (:most-narrow-door-width-in-consumption-space :number ,(s-prefix "toevla:mostNarrowDoorWidthInConsumptionSpace"))
                (:smallest-point-on-route-to-consumption-space :number ,(s-prefix "toevla:smallestPointOnRouteToConsumptionSpace"))
                (:highest-threshold-on-route-to-consumption-space :number ,(s-prefix "toevla:highestThresholdOnRouteToConsumptionSpace"))
                (:height-under-table-for-wheelchair-in-consumption-space :number ,(s-prefix "toevla:heightUnderTableForWheelchairInConsumptionSpace"))
                (:most-narrow-door-width-for-terrace :number ,(s-prefix "toevla:mostNarrowDoorWidthForTerrace"))
                (:smallest-point-on-route-for-tarrace :number ,(s-prefix "toevla:smallestPointOnRouteForTarrace"))
                (:highest-threshold-for-terrace :number ,(s-prefix "toevla:highestThresholdForTerrace"))
                (:height-under-tarrace-table-for-wheelchair-in-consumption-space :number ,(s-prefix "toevla:heightUnderTarraceTableForWheelchairInConsumptionSpace")))
  :resource-base (s-url "http://data.toegankelijk.vlaanderen.be/id/restaurants/")
  :on-path "restaurants")

(define-resource shop ()
  :class (s-prefix "toevla:Shop")
  :properties `((:has-cash-payment :boolean ,(s-prefix "toevla:hasCashPayment"))
                (:has-payment-with-movable-electronic-payment-system :boolean ,(s-prefix "toevla:hasPaymentWithMovableElectronicPaymentSystem"))
                (:has-payment-with-fixed-electronic-payment-system :boolean ,(s-prefix "toevla:hasPaymentWithFixedElectronicPaymentSystem"))
                (:smallest-point-on-route :number ,(s-prefix "toevla:smallestPointOnRoute"))
                (:highest-threshold :number ,(s-prefix "toevla:highestThreshold"))
                (:most-narrow-doorwidth :number ,(s-prefix "toevla:mostNarrowDoorwidth"))
                (:access-control-width :number ,(s-prefix "toevla:accessControlWidth"))
                (:height-of-lowered-counter :number ,(s-prefix "toevla:heightOfLoweredCounter")))
  :resource-base (s-url "http://data.toegankelijk.vlaanderen.be/id/shops/")
  :on-path "shops")

(define-resource file ()
  :class (s-prefix "nfo:FileDataObject")
  :properties `((:name :string ,(s-prefix "nfo:fileName"))
                (:order :number ,(s-prefix "ext:order"))
                (:label :string ,(s-prefix "rdfs:label"))
                (:format :string ,(s-prefix "dct:format"))
                (:size :number ,(s-prefix "nfo:fileSize"))
                (:extension :string ,(s-prefix "dbpedia:fileExtension"))
                (:created :datetime ,(s-prefix "nfo:fileCreated")))
  :has-one `((file :via ,(s-prefix "nie:dataSource")
                   :inverse t
                   :as "download")
             (experience-tree-node-score :via ,(s-prefix "toevla:belongsToExperienceTreeNodeScore")
                                         :as "experience-tree-node-score")
             (point-of-interest :via ,(s-prefix "toevla:hasFile")
                                :inverse t
                                :as "point-of-interest"))
  :resource-base (s-url "http://data.example.com/files/")
  :features `(include-uri)
  :on-path "files")

(define-resource route-description ()
  :class (s-prefix "toevla:RouteDescription")
  :properties `((:has-flemish-sign-language :boolean ,(s-prefix "toevla:hasFlemishSignLanguage"))
                (:has-detailed-description :boolean ,(s-prefix "toevla:hasDetailedDescription"))
                (:has-screenreader :boolean ,(s-prefix "toevla:hasScreenreader")))
  :resource-base (s-url "http://data.toegankelijk.vlaanderen.be/id/route-descriptions/")
  :on-path "route-descriptions")

(define-resource train-stop ()
  :class (s-prefix "toevla:TrainStop")
  :properties `((:distance-from-location :number ,(s-prefix "toevla:distanceFromLocation"))
                (:stop-name :string ,(s-prefix "toevla:stopName")))
  :resource-base (s-url "http://data.toegankelijk.vlaanderen.be/id/train-stops/")
  :on-path "train-stops")

(define-resource tram-stop ()
  :class (s-prefix "toevla:TramStop")
  :properties `((:distance-from-location :number ,(s-prefix "toevla:distanceFromLocation"))
                (:stop-name :string ,(s-prefix "toevla:stopName")))
  :resource-base (s-url "http://data.toegankelijk.vlaanderen.be/id/tram-stops/")
  :on-path "tram-stops")

(define-resource bus-stop ()
  :class (s-prefix "toevla:BusStop")
  :properties `((:distance-from-location :number ,(s-prefix "toevla:distanceFromLocation"))
                (:stop-name :string ,(s-prefix "toevla:stopName")))
  :resource-base (s-url "http://data.toegankelijk.vlaanderen.be/id/bus-stops/")
  :on-path "bus-stops")

(define-resource toilet ()
  :class (s-url "https://linkedgeodata.org/ontology/Toilets")
  :properties `((:has-simple-and-logical-route :boolean ,(s-prefix "toevla:hasSimpleAndLogicalRoute"))
                (:has-synthetic-speech-in-elevator :boolean ,(s-prefix "toevla:hasSyntheticSpeechInElevator"))
                (:has-clear-signalization-in-building :boolean ,(s-prefix "toevla:hasClearSignalizationInBuilding"))
                (:has-baby-nurturing-table :boolean ,(s-prefix "toevla:hasBabyNurturingTable"))
                (:smallest-point-on-route :number ,(s-prefix "toevla:smallestPointOnRoute"))
                (:highest-threshold-on-route :number ,(s-prefix "toevla:highestThresholdOnRoute"))
                (:amount-of-thresholds :number ,(s-prefix "toevla:amountOfThresholds"))
                (:amount-of-stairs :number ,(s-prefix "toevla:amountOfStairs"))
                (:amount-of-slopes :number ,(s-prefix "toevla:amountOfSlopes"))
                (:has-ramps :boolean ,(s-prefix "toevla:hasRamps"))
                (:amount-of-plateau-elevators :number ,(s-prefix "toevla:amountOfPlateauElevators"))
                (:type-of-elevator :string ,(s-prefix "toevla:typeOfElevator"))
                (:door-width :number ,(s-prefix "toevla:doorWidth"))
                (:turning-radius-at-door :number ,(s-prefix "toevla:turningRadiusAtDoor"))
                (:space-in-front-of-toilet :number ,(s-prefix "toevla:spaceInFrontOfToilet"))
                (:space-next-to-toilet :number ,(s-prefix "toevla:spaceNextToToilet"))
                (:turning-radius :number ,(s-prefix "toevla:turningRadius"))
                (:amount-of-support-braces :boolean ,(s-prefix "toevla:amountOfSupportBraces"))
                (:has-washbasin :boolean ,(s-prefix "toevla:hasWashbasin"))
                (:can-ride-under-washbasin :boolean ,(s-prefix "toevla:canRideUnderWashbasin"))
                (:free-height-under-washbasin :number ,(s-prefix "toevla:freeHeightUnderWashbasin"))
                (:free-depth-under-washbasin :number ,(s-prefix "toevla:freeDepthUnderWashbasin"))
                (:free-width-under-washbasin :number ,(s-prefix "toevla:freeWidthUnderWashbasin")))
  :has-one `((area :via ,(s-prefix "toevla:sizeOfElevator")
                   :as "size-of-elevator")
             (area :via ,(s-prefix "toevla:sizeOfPlateauElevator")
                   :as "size-of-plateau-elevator")
             (area :via ,(s-prefix "toevla:sizeOfToiletRoom")
                   :as "size-of-toilet-room"))
  :resource-base (s-url "http://data.toegankelijk.vlaanderen.be/id/toilets/")
  :on-path "toilets")



(define-resource area ()
  :class (s-prefix "toevla:Area")
  :properties `((:width :number ,(s-prefix "toevla:widthInCm"))
                (:height :number ,(s-prefix "toevla:heightInCm")))
  :resource-base (s-url "http://data.toegankelijk.vlaanderen.be/id/area-sizes/")
  :on-path "areas")

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
  :resource-base (s-url "http://data.toegankelijk.vlaanderen.be/id/parkings/")
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
  :resource-base (s-url "http://data.toegankelijk.vlaanderen.be/id/paths/")
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
                (:height-of-lowered-counter :number ,(s-prefix "toevla:hasLoweredCounter"))) ; todo fix in semantic model
  :has-one `((point-of-interest :via ,(s-prefix "toevla:hasEntrance")
                                :inverse t
                                :as "point-of-interest"))
  :resource-base (s-url "http://data.toegankelijk.vlaanderen.be/id/entrances/")
  :on-path "entrances")

(define-resource experience ()
  :class (s-prefix "toevla:Experience")
  :properties `((:title :string ,(s-prefix "dct:title"))
                (:has-multiple-elements-to-drive-under :boolean ,(s-prefix "toevla:hasMultipleElementsToDriveUnder"))
                (:has-good-lighting :boolean ,(s-prefix "toevla:hasGoodLighting"))
                (:has-magnifying-glass :boolean ,(s-prefix "toevla:hasMagnifyingGlass"))
                (:brochure-has-accessible-contrast :boolean ,(s-prefix "toevla:brochureHasAccessibleContrast"))
                (:brochure-is-available-in-braille :boolean ,(s-prefix "toevla:brochureIsAvailableInBraille"))
                (:brochure-is-available-in-large-print :boolean ,(s-prefix "toevla:brochureIsAvailableInLargePrint"))
                (:signs-have-accessible-contrast :boolean ,(s-prefix "toevla:signsHaveAccessibleContrast"))
                (:signs-have-no-reflection :boolean ,(s-prefix "toevla:signsHaveNoReflection"))
                (:signs-have-braille :boolean ,(s-prefix "toevla:signsHaveBraille"))
                (:signs-in-large-print :boolean ,(s-prefix "toevla:signsInLargePrint"))
                (:audio-guide-only-in-dutch :boolean ,(s-prefix "toevla:audioGuideOnlyInDutch"))
                (:audio-guide-available-in-multiple-languages :boolean ,(s-prefix "toevla:audioGuideAvailableInMultipleLanguages"))
                (:has-movie-guide :boolean ,(s-prefix "toevla:hasMovieGuide"))
                (:has-virtual-technology :boolean ,(s-prefix "toevla:hasVirtualTechnology"))
                (:has-touch-elements :boolean ,(s-prefix "toevla:hasTouchElements"))
                (:has-smell-elements :boolean ,(s-prefix "toevla:hasSmellElements"))
                (:has-actionable-elements :boolean ,(s-prefix "toevla:hasActionableElements"))
                (:has-listening-elements :boolean ,(s-prefix "toevla:hasListeningElements"))
                (:has-places-of-silence :boolean ,(s-prefix "toevla:hasPlacesOfSilence"))
                (:other-elements :string ,(s-prefix "toevla:otherElements")))
  ;; :has-many `(mu-resource-has-many)
  :has-one `((point-of-interest :via ,(s-prefix "toevla:atLocation")
                                :as "point-of-interest")
             (route :via ,(s-prefix "toevla:hasCirculation")
                    :as "circulation")
             (guided-tour :via ,(s-prefix "toevla:guidedTour")
                          :as "guided-tour")
             (auditorium :via ,(s-prefix "toevla:hasAuditorium")
                         :as "auditorium"))
  :has-many `((experience-tree-node-score :via ,(s-prefix "toevla:scoreSubject")
                                          :inverse t
                                          :as "experience-tree-node-scores"))
  :resource-base (s-url "http://data.toegankelijk.vlaanderen.be/id/experiences/")
  :on-path "experiences")

(define-resource auditorium ()
  :class (s-prefix "toevla:Auditorium")
  :properties `((:has-accessible-seating :boolean ,(s-prefix "toevla:hasAccessibleSeating"))
                (:extra-attention-given-to-acoustics :boolean ,(s-prefix "toevla:extraAttentionGivenToAcoustics"))
                (:has-teleloop :boolean ,(s-prefix "toevla:hasTeleloop")))
  :resource-base (s-url "http://data.toegankelijk.vlaanderen.be/id/auditoria/")
  :on-path "auditoria")

(define-resource guided-tour ()
  :class (s-prefix "toevla:GuidedTour")
  :properties `((:has-support-for-visual-handicap :boolean ,(s-prefix "toevla:hasSupportForVisualHandicap"))
                (:has-support-for-auditive-handicap :boolean ,(s-prefix "toevla:hasSupportForAuditiveHandicap"))
                (:has-support-for-mental-handicap :boolean ,(s-prefix "toevla:hasSupportForMentalHandicap"))
                (:is-dementia-friendly :boolean ,(s-prefix "toevla:isDementiaFriendly"))
                (:is-autism-friendly :boolean ,(s-prefix "toevla:isAutismFriendly"))
                (:has-adaptations-for-elderly :boolean ,(s-prefix "toevla:hasAdaptationsForElderly"))
                (:has-adaptations-for-children :boolean ,(s-prefix "toevla:hasAdaptationsForChildren"))
                (:has-image-interpreter :boolean ,(s-prefix "toevla:hasImageInterpreter"))
                (:has-flemish-sign-language-interpreter :boolean ,(s-prefix "toevla:hasFlemishSignLanguageInterpreter"))
                (:is-available-on-quiet-moments :boolean ,(s-prefix "toevla:isAvailableOnQuietMoments"))
                (:is-available-tailor-made :boolean ,(s-prefix "toevla:isAvailableTailorMade")))
  :resource-base (s-url "http://data.toegankelijk.vlaanderen.be/id/guided-tours/")
  :on-path "guided-tours")

(define-resource route ()
  :class (s-prefix "toevla:Route")
  :properties `((:is-simple-and-logical :boolean ,(s-prefix "toevla:isSimpleAndLogical"))
                (:has-clear-signalization-in-building :boolean ,(s-prefix "toevla:hasClearSignalizationInBuilding"))
                (:has-synthetic-speech-in-elevator :boolean ,(s-prefix "toevla:hasSyntheticSpeechInElevator"))
                (:is-only-on-ground-floor :boolean ,(s-prefix "toevla:isOnlyOnGroundFloor"))
                (:smallest-point-on-route :number ,(s-prefix "toevla:smallestPointOnRoute"))
                (:highest-threshold-on-route :number ,(s-prefix "toevla:highestThresholdOnRoute"))
                (:amount-of-thresholds :number ,(s-prefix "toevla:amountOfThresholds"))
                (:amount-of-stairs :number ,(s-prefix "toevla:amountOfStairs"))
                (:amount-of-slopes :number ,(s-prefix "toevla:amountOfSlopes"))
                (:has-ramps :boolean ,(s-prefix "toevla:hasRamps"))
                (:amount-of-plateau-elevators :number ,(s-prefix "toevla:amountOfPlateauElevators"))
                (:type-of-elevator :string ,(s-prefix "toevla:typeOfElevator"))
                (:has-clear-signalization-on-route :boolean ,(s-prefix "toevla:hasClearSignalizationOnRoute"))
                (:has-venue-plan :boolean ,(s-prefix "toevla:hasVenuePlan"))
                (:has-plan-for-advised-path :boolean ,(s-prefix "toevla:hasPlanForAdvisedPath"))
                (:has-alternative-path-for-hard-to-access-spaces :boolean ,(s-prefix "toevla:hasAlternativePathForHardToAccessSpaces"))
                (:has-multiple-resting-and-sitting-opportunities :boolean ,(s-prefix "toevla:hasMultipleRestingAndSittingOpportunities"))
                (:has-extra-attention-for-acoustics :boolean ,(s-prefix "toevla:hasExtraAttentionForAcoustics")))
  :has-one `((area :via ,(s-prefix "toevla:sizeOfElevator")
                   :as "size-of-elevator")
             (area :via ,(s-prefix "toevla:sizeOfPlateauElevator")
                   :as "size-of-plateau-elevator"))
  :resource-base (s-url "http://data.toegankelijk.vlaanderen.be/id/routes/")
  :on-path "routes")


(define-resource experience-tree-node-score ()
  :class (s-prefix "toevla:ExperienceTreeNodeScore")
  :properties `((:score :url ,(s-prefix "toevla:score"))
                (:comment :string ,(s-prefix "rdfs:comment"))
                (:entry-visited :boolean ,(s-prefix "ext:entryWasVisited")))
  :has-one `((experience :via ,(s-prefix "toevla:scoreSubject")
                         :as "experience")
             (concept :via ,(s-prefix "toevla:scoreTopic")
                      :as "tree-node")
             (concept :via ,(s-prefix "toevla:selectedConcept")
                      :as "selected-concept"))
  :has-many `((file :via ,(s-prefix "toevla:belongsToExperienceTreeNodeScore")
                    :inverse t
                    :as "images"))
  :resource-base (s-url "http://data.toegankelijk.vlaanderen.be/id/experience-tree-node-scores/")
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
