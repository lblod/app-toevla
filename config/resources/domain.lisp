(in-package :mu-cl-resources)

(define-resource tree ()
  :class (s-prefix "skos:ConceptScheme")
  :properties `((:title :string ,(s-prefix "skos:prefLabel")))
  :has-many `((tree-node :via ,(s-prefix "skos:hasTopConcept")
                         :as "top-level-nodes"))
  :resource-base (s-url "http://data.toevla.org/concept-schemes/")
  :on-path "trees")

(define-resource tree-node ()
  :class (s-prefix "skos:Concept")
  :properties `((:title :string ,(s-prefix "skos:prefLabel"))
                (:order :number ,(s-prefix "ext:order"))
                (:htmlContent :string ,(s-prefix "ext:htmlContent")))
  :has-many `((tree-node :via ,(s-prefix "skos:broader")
                     :inverse t
                     :as "children"))
  :has-one `((tree-node :via ,(s-prefix "skos:broader")
                        :as "parent"))
  :resource-base (s-url "http://data.toevla.org/tree-nodes/")
  :on-path "tree-nodes")

(define-resource point-of-interest ()
  :class (s-url "https://data.vlaanderen.be/ns/adres#AdresseerbaarObject")
  :properties `((:label :string ,(s-prefix "rdfs:label")))
  ;; :has-many `(mu-resource-has-many)
  ;; :has-one `(mu-resource-has-one)
  :resource-base (s-url "http://data.toevla.org/points-of-interest/")
  :on-path "points-of-interest")


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
