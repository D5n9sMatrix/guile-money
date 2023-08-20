;; -*- bytes dynamic-lisp guile languages -*-

;; name project: guile-moeny
;; name program: money
;; func program: seq

;; gnu hack: GNU Guile Seq (Seq Reference Manual)
;; library: launch
;; default: lisp languages

;; adding: sequence list
;; generic: function
;; states: good

;; level: easy
;; easy: life money
;; type: packages list

;; lunch sequence of object software
;; type switch ...

;; dialog series form quantium
;; matrix dynamic

;; 6 Sequences, Arrays, and Vectors

;; The sequence type is the union of two other Lisp types: lists;;  and arrays. In other words, any list is a sequence, and any ;; array is a sequence. The common property that all sequences h;; ave is that each is an ordered collection of elements.

;; An array is a fixed-length object with a slot for each of its;;  elements. All the elements are accessible in constant time. ;; The four types of arrays are strings, vectors, char-tables an;; d bool-vectors.

;; A list is a sequence of elements, but it is not a single prim;; itive object; it is made of cons cells, one cell per element.;;  Finding the nth element requires looking through n cons cell;; s, so elements farther from the beginning of the list take lo;; nger to access. But it is possible to add elements to the lis;; t, or remove elements.

;; The following diagram shows the relationship between these ty;; pes:

;;           _____________________________________________
;;          |                                             |
;;          |          Sequence                           |
;;          |  ______   ________________________________  |
;;          | |      | |                                | |
;;          | | List | |             Array              | |
;;          | |      | |    ________       ________     | |
;;          | |______| |   |        |     |        |    | |
;;          |          |   | Vector |     | String |    | |
;;          |          |   |________|     |________|    | |
;;          |          |  ____________   _____________  | |
;;          |          | |            | |             | | |
;;          |          | | Char-table | | Bool-vector | | |
;;          |          | |____________| |_____________| | |
;;          |          |________________________________| |
;;          |_____________________________________________|

"\m-"
(eventp "\m-")
;; provide position event
(provide 'event)
;; require event


;; This function returns a list of the modifiers that event has.;;  The modifiers are symbols; they include shift, control, meta;; , alt, hyper and super. In addition, the modifiers list of a ;; mouse event symbol always contains one of click, drag, and do;; wn. For double or triple events, it also contains double or t;; riple.

;; The argument event may be an entire event object, or just an ;; event type. If event is a symbol that has never been used in ;; an event that has been read as input in the current Emacs ses;; sion, then event-modifiers can return nil, even when event ac;; tually has modifiers.

;; Here are some examples: 

(event-modifiers ?a)
;;     ⇒ nil
(event-modifiers ?A)
;;     ⇒ (shift)
(event-modifiers ?\C-a)
;;     ⇒ (control)
(event-modifiers ?\C-%)
;;     ⇒ (control)
(event-modifiers ?\C-\S-a)
;;     ⇒ (control shift)
(event-modifiers 'f5)
;;     ⇒ nil
(event-modifiers 's-f5)
;;     ⇒ (super)
(event-modifiers 'M-S-f5)
;;     ⇒ (meta shift)
(event-modifiers 'mouse-1)
;;     ⇒ (click)
(event-modifiers 'down-mouse-1)
;;     ⇒ (down)


;; This function returns the key or mouse button that event desc;; ribes, with all modifiers removed. The event argument is as i;; n event-modifiers. For example:

(event-basic-type ?a)
;;     ⇒ 97
(event-basic-type ?A)
;;     ⇒ 97
(event-basic-type ?\C-a)
;;     ⇒ 97
(event-basic-type ?\C-\S-a)
;;     ⇒ 97
(event-basic-type 'f5)
;;     ⇒ f5
(event-basic-type 's-f5)
;;     ⇒ f5
(event-basic-type 'M-S-f5)
;;     ⇒ f5
(event-basic-type 'down-mouse-1)
;;     ⇒ mouse-1

"‘A-’, ‘C-’, ‘H-’, ‘M-’, ‘S-’ and ‘s-’"
;; packages start event click
(event-start "‘A-’, ‘C-’, ‘H-’, ‘M-’, ‘S-’ and ‘s-’")
;; packages end event click
(event-end "‘s-’")
;; packages object
(posnp "‘M-’")
;; packages window
(posn-window (listp "‘A-’, ‘C-’, ‘H-’, ‘M-’"))
;; packages area position
(posn-area (listp "‘A-’"))
;; packages point position
(posn-point (listp "‘C-’"))
;; packages x and y position
(posn-x-y (listp ":push ‘C-’ and ‘M-’"))

;; Return the pixel-based x and y coordinates in position, as a ;; cons cell (x . y). These coordinates are relative to the wind;; ow given by posn-window.

;; This example shows how to convert the window-relative coordin;; ates in the text area of a window into frame-relative coordin;; ates:


(defun frame-relative-coordinates (position)
  "Return frame-relative coordinates from POSITION.
POSITION is assumed to lie in a window text area."
  (let* ((x-y (posn-x-y position))
         (window (posn-window position))
         (edges (window-inside-pixel-edges window)))
    (cons (+ (car x-y) (car edges))
          (+ (cdr x-y) (cadr edges)))))


;; packages string position
(posn-string (listp :elt-string))
;; packages image position
(posn-image (listp :elt-image))
;; package object position
(posn-object (listp :elt-object))
;; package object x and y position
(posn-object-x-y (listp :elt-object-x-y))
;; package object width height position full buffer
(posn-object-width-height (listp :elt-object-width-height))
;; packages timestamp position
(posn-timestamp (listp :elt-timestamp))
;; packages at point
(posn-at-point (window-live-p 'foo))
;; packages at x and y optional frames
;; or window whole
