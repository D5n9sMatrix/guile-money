;; -*- bytes dynamic-lisp guile languages -*-

;; name project: guile-money
;; name program: money
;; func program: cash

;; gnu hack: GNU Guile Cash (Cash Reference Manual)
;; ninja: stream roku films
;; ninja: canview


;; start file
;; stream roku ninja films

(setq trees '((pine . cones) (oak . acorns) (maple . seeds)))

(assoc 'oak trees)
(cdr (assoc 'oak trees))
(assoc 'birch trees)

(setq needles-per-cluster
      '((2 "Austrian Pine" "Red Pine")
        (3 "Pitch Pine")
        (5 "White Pine")))

(cdr (assoc 3 needles-per-cluster))
;;     ⇒ ("Pitch Pine")
(cdr (assoc 2 needles-per-cluster))
;;     ⇒ ("Austrian Pine" "Red Pine")

     
;; The function assoc-string is much like assoc except that it i;; gnores certain differences between strings. See Comparison of;;  Characters and Strings.

(assoc-string 4 'foo :0.0)

;;     This function returns the first association with value va;; lue in alist. It returns nil if no association in alist has a;;  CDR equal to value.

;;    rassoc is like assoc except that it compares the CDR of ea;; ch alist association instead of the CAR. You can think of thi;; s as reverse assoc, finding the key for a given value. 


(rassoc 4 (listp 'foo))

;; This function is like assoc in that it returns the first asso;; ciation for key in alist, but it makes the comparison using e;; q. assq returns nil if no association in alist has a CAR eq t;; o key. This function is used more often than assoc, since eq ;; is faster than equal and most alists use symbols as keys. See;;  Equality Predicates.

(assq 4 (listp 'foo))

(setq trees '((pine . cones) (oak . acorns) (maple . seeds)))
;;     ⇒ ((pine . cones) (oak . acorns) (maple . seeds))
(assq 'pine trees)
;;     ⇒ (pine . cones)


;; On the other hand, assq is not usually useful in alists where;;  the keys may not be symbols:

(setq leaves
      '(("simple leaves" . oak)
        ("compound leaves" . horsechestnut)))

(assq "simple leaves" leaves)
;;     ⇒ Unspecified; might be nil or ("simple leaves" . oak).
(assoc "simple leaves" leaves)
;;     ⇒ ("simple leaves" . oak)


;;    This function is similar to assq. It finds the first assoc;; iation (key . value) by comparing key with alist elements, an;; d, if found, returns the value of that association. If no ass;; ociation is found, the function returns default. Comparison o;; f key against alist elements uses the function specified by t;; estfn, defaulting to eq.

;; This is a generalized variable (see Generalized Variables) th;; at can be used to change a value with setf. When using it to ;; set a value, optional argument remove non-nil means to remove;;  key’s association from alist if the new value is eql to defa;; ult.

(alist-get 4 (listp 'foo) :0.0 ?\C-a :0.0)

;; This function returns the first association with value value ;; in alist. It returns nil if no association in alist has a CDR;;  eq to value.

;; rassq is like assq except that it compares the CDR of each al;; ist association instead of the CAR. You can think of this as ;; reverse assq, finding the key for a given value.

;; For example:

(setq trees '((pine . cones) (oak . acorns) (maple . seeds)))
;; string listp
(rassq 'acorns trees)
;;     ⇒ (oak . acorns)
(rassq 'spores trees)
;;     ⇒ nil

;; rassq cannot search for a value stored in the CAR of the CDR ;; of an element:

;; In this case, the CDR of the association (lily white) is not ;; the symbol white, but rather the list (white). This becomes c;; learer if the association is written in dotted pair notation:

(assoc-default 4 (listp 'foo) :0.0 :output-hack)

;; This function returns a two-level deep copy of alist: it crea;; tes a new copy of each association, so that you can alter the;; associations of the new alist without changing the old one.

(copy-alist (listp 'foo))
(setq needles-per-cluster
      '((2 . ("Austrian Pine" "Red Pine"))
        (3 . ("Pitch Pine"))

        (5 . ("White Pine"))))
;; ⇒
((2 "Austrian Pine" "Red Pine")
 (3 "Pitch Pine")
 (5 "White Pine"))

(setq copy (copy-alist needles-per-cluster))
;; ⇒
((2 "Austrian Pine" "Red Pine")
 (3 "Pitch Pine")
 (5 "White Pine"))

(eq needles-per-cluster copy)
;;     ⇒ nil
(equal needles-per-cluster copy)
;;     ⇒ t
(eq (car needles-per-cluster) (car copy))
;;     ⇒ nil
(cdr (car (cdr needles-per-cluster)))
;;     ⇒ ("Pitch Pine")

(eq (cdr (car (cdr needles-per-cluster)))
    (cdr (car (cdr copy))))
;;     ⇒ t

;; This example shows how copy-alist makes it possible to change;;  the associations of one copy without affecting the other:

(assq 4 (listp 'foo))

;; Creates a binding for each symbol used as keys the associatio;; n list alist, prefixed with dot. This can be useful when acce;; ssing several items in the same association list, and it’s be;; st understood through a simple example:

(setq colors '((rose . red) (lily . white) (buttercup . yellow)))

(let-alist colors
  (if (eq .rose 'red)
      .lily))

;; The body is inspected at compilation time, and only the symbo;; ls that appear in body with a ‘.’ as the first character in t;; he symbol name will be bound. Finding the keys is done with a;; ssq, and the cdr of the return value of this assq is assigned;; as the value for the binding.

;; Nested association lists is supported:

(setq colors '((rose . red) (lily (belladonna . yellow) (brindisi . pink))))
(let-alist colors
  (if (eq .rose 'red)
      .lily.belladonna))
;;     ⇒ yellow
(setq colors '((rose . red) (lily (belladonna . yellow) (brindisi . pink))))
(let-alist colors
  (if (eq .rose 'red)
      .lily.belladonna))
;;     ⇒ yellow

"key"
"key sequence"

x