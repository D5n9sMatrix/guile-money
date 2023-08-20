;; -*- bytes dynamic-lisp guile languages lisp -*-

;; name project: guile-money
;; name program: money
;; func program: access-event

;; gnu hack: GNU Guile Access Event (Access Event Reference Manual)
;; scroll bar: event ratio
;; scroll bar: scale ratio total

;; multiples: effect
;; total: result
;; num: topic

;; buffer: position
;; handy: scaling
;; whole: foreach

;; start file
;; stream roku films and tv


"?\C-@"
(stringp "?\C-@")
`("foo", :elt-start)
`("foo", :elt-state)
;; intersection
`("the Lisp reader" :and "the Lisp printer")
;; read syntax
(current-buffer)
;; signal descriptive string
"#<"
;; closing string
">"
;; scroll bar scale
`("scroll-bar-event-ratio", 
  :elt-start-ratio)
`("scroll-bar-scale",
  :elt-start-scale)
      
(defvar elt-start
  4
  "Printing can produce text that cannot be read. For example, buffers, windows, frames, subprocesses and markers print as text that starts with ‘#’; if you try to read this text, you get an error. There is no way to read those data types.")

(defvar elt-state
  4
  "One object can have multiple textual representations. For example, ‘1’ and ‘01’ represent the same integer, and ‘(a b)’ and ‘(a . (b))’ represent the same list. Reading will accept any of the alternatives, but printing must choose one of them.")

(defvar elt-easy
  4
  "    Comments can appear at certain points in the middle of an object’s read sequence without affecting the result of reading it.")

;; 20.2 Input Streams

;; Most of the Lisp functions for reading text take an input str;; eam as an argument. The input stream specifies where or how t;; o get the characters of the text to be read. Here are the pos;; sible types of input stream: 





"?\C-@"
(message "%s" (read t))

;; will in batch mode read a Lisp expression from standard input;;  and print the result to standard output.


;; Here is an example of reading from a stream that is a buffer,;;  showing where point is located before and after:



;; ---------- Buffer: foo ----------
;; This∗ is the contents of foo.
;; ---------- Buffer: foo ----------


(read (get-buffer "foo"))
;;     ⇒ is

(read (get-buffer "foo"))
;;     ⇒ the


;; ---------- Buffer: foo ----------
;; This is the∗ contents of foo.
;; ---------- Buffer: foo ----------



;; Note that the first read skips a space. Reading skips any amo;; unt of whitespace preceding the significant text.

;; Here is an example of reading from a stream that is a marker,;;  initially positioned at the beginning of the buffer shown. T;; he value read is the symbol This.





;; ---------- Buffer: foo ----------
;; This is the contents of foo.
;; ---------- Buffer: foo ----------



;; ⇒ #<marker at 1 in foo>

;; ⇒ This

;; ⇒ #<marker at 5 in foo>   ;; Before the first space.


;; Here we read from the contents of a string: 

;; ⇒ (When in)



;; The following example reads from the minibuffer. The prompt i;; s: ‘Lisp expression: ’. (That is always the prompt used when ;; you read from the stream t.) The user’s input is shown follow;; ing the prompt.

;; ⇒ 23

;; ---------- Buffer: Minibuffer ----------
;; Lisp expression: 23 RET
;; ---------- Buffer: Minibuffer ----------




;; ⇒ (88 89 40 41)


;; ⇒ useless-stream



;; Now we read using the stream thus constructed:




;; ⇒ XY


;;  ⇒ (40 41)


;; Note that the open and close parentheses remain in the list. ;; The Lisp reader encountered the open parenthesis, decided tha;; t it ended the input, and unread it. Another attempt to read ;; from the stream at this point would read ‘()’ and return nil.

"`()`"
`("nil", :return nil)



;; 20.3 Input Functions

;; This section describes the Lisp functions and variables that ;; pertain to reading.

;; In the functions below, stream stands for an input stream (se;; e the previous section). If stream is nil or omitted, it defa;; ults to the value of standard-input.

;; An end-of-file error is signaled if reading encounters an unt;; erminated list, vector, or string.



;; Function: read &optional stream ¶

;;    This function reads one textual Lisp expression from strea;; m, returning it as a Lisp object. This is the basic Lisp inpu;; t function.


;; Function: read-from-string string &optional start end ¶

;;     This function reads the first textual Lisp expression fro;; m the text in string. It returns a cons cell whose CAR is tha;; t expression, and whose CDR is an integer giving the position;;  of the next remaining character in the string (i.e., the fir;; st one not read).

;;    If start is supplied, then reading begins at index start i;; n the string (where the first character is at index 0). If yo;; u specify end, then reading is forced to stop just before tha;; t index, as if the rest of the string were not there.

;; For example:
;; GNU Cyrillic language Refrence Manual
;; stream learn Cyrillic language 
; Read starting at the first character.
;; ⇒ ((list 512) . 10)
;; Read starting at the second character.
;;  ⇒ (list . 5)
;; Read starting at the seventh character,
;;   and stopping at the ninth.
;;     ⇒ (11 . 8)

;; output functions

;; running function

;; Function: print object &optional stream ¶

;; The print function is a convenient way of printing. It output;; s the printed representation of object to stream, printing in;;  addition one newline before object and another after it. Quo;; ting characters are used. print returns object. For example:

(progn (print 'The\ cat\ in)
       (print "then hat")
       (print "came back"))
;;     -|
;;     -| The\ cat\ in
;;     -|
;;     -| "the hat"
;;     -|
;;     -| " came back"
;;     ⇒ " came back"


;; Function: prin1 object &optional stream overrides ¶

;; This function outputs the printed representation of object to;;  stream. It does not print newlines to separate output as pri;; nt does, but it does use quoting characters just like print. ;; It returns object.

(progn (prin1 'Then\ cat\ in)
       (prin1 "then hat")
       (prin1 "came back"))

;;    -| The\ cat\ in"the hat"" came back"
;;     ⇒ " came back"



;; Function: princ object &optional stream ¶

;;     This function outputs the printed representation of objec;; t to stream. It returns object.

;; This function is intended to produce output that is readable ;; by people, not by read, so it doesn’t insert quoting characte;; rs and doesn’t put double-quotes around the contents of strin;; gs. It does not add any spacing between calls.

(progn
  (princ 'The\ cat)
  (princ " in the \"hat\""))
;;     -| The cat in the "hat"
;;     ⇒ " in the \"hat\""


;; Function: prin1-to-string object &optional noescape overrides ¶

;;     This function returns a string containing the text that p;; rin1 would have printed for the same argument.




;;     ⇒ "foo"

;;     ⇒ "#<marker at 2773 in strings.texi>"



;; If overrides is non-nil, it should either be t
;; (which tells prin1 to use the defaults for all printer related
;; variables), or a list of settings.  See Overriding Output Var;; iables, for details.


;; If noescape is non-nil, that inhibits use of quoting characte;; rs in the output. (This argument is supported in Emacs versio;; ns 19 and later.)



;; ⇒ "\"foo\""

;; ⇒ "foo"

;; Macro: with-output-to-string body… ¶

;;    This macro executes the body forms with standard-output se;; t up to feed output into a string. Then it returns that strin;; g.

;; For example, if the current buffer name is ‘foo’,

(with-output-to-string
  (prin1 "The buffer is ")
  (prin1 (buffer-name)))


;; Variable: print-escape-newlines ¶

;;     If this variable is non-nil, then newline characters in s;; trings are printed as ‘\n’ and formfeeds are printed as ‘\f’.;;  Normally these characters are printed as actual newlines and;;  formfeeds.

;; This variable affects the print functions prin1 and print tha;; t print with quoting. It does not affect princ. Here is an ex;; ample using prin1:

(prin1 "a\nb")
;;      -| "a
;;      -| b"
;;      ⇒ "a
;; b"

(let ((print-escape-newlines t))
  (prin1 "a\nb"))
;;      -| "a\nb"
;;      ⇒ "a
;; b"

;; Variable: print-length ¶

;;     The value of this variable is the maximum number of eleme;; nts to print in any list, vector or bool-vector. If an object;;  being printed has more than this many elements, it is abbrev;; iated with an ellipsis.

;; If the value is nil (the default), then there is no limit.



(setq print-length 2)
;;     ⇒ 2

(print '(1 2 3 4 5))
;;     -| (1 2 ...)
;;     ⇒ (1 2 ...)


;; Variable: print-unreadable-function ¶

;;    By default, Emacs prints unreadable objects as ‘#<...>"’. ;; For instance: 

"#<...>"

;; If this variable is non-nil, it should be a function that wil;; l be called to handle printing of these objects. The function;;  will be called with two arguments: the object and the noesca;; pe flag used by the printing functions (see Output Functions).

;; The function should return either nil (print the object as us;; ual), or a string (which will be printed), or any other objec;; t (don’t print the object). For instance:



  
