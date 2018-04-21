
; BEGIN PART 1

;BOR  ; "Binary OR" takes two arguments x,y, returns x OR y; non-recursive
     ; examples:
     ; (BOR #t #f) Value: #t
     ; (BOR #f #f) Value: #f

; if they are both #f, then #f, otherwise #t
(define BOR
  (lambda (arg1 arg2)
    (if (eqv? arg1 arg2) 
      (if (eqv? arg1 #f) #f #t) #t)))


;BAND ; "Binary AND" takes two arguments x,y, returns x AND y; non-recursive
     ; examples:
     ; (BAND #t #f) Value: #f
     ; (BAND #t #t) Value: #t

; if they are both #t, then #t, otherwise #f
(define BAND
  (lambda (arg1 arg2)
    (if (eqv? arg1 arg2)
      (if (eqv? arg1 #t) #t #f) #f)))


;pos? ; "positive?" takes one argument, returns true if positive number, 
     ; false otherwise
     ; examples:
     ; (pos? 1)   Value: #t
     ; (pos? -2)  Value: #f
     ; (pos? 0)   Value: #f

(define pos?
  (lambda (arg1)
    (cond
      ((positive? arg1) #t)
      (else #f))))


;in?  ; takes two arguments item, list; returns true if item is in list, 
     ; false otherwise
     ; examples:
     ; (in? 'x '(b c x d))   Value: #t
     ; (in? 'x '(b c d e f)) Value: #f


(define in?
  (lambda (arg1 arg2)
    (cond
      ((member arg1 arg2) #t)
      (else #f))))


;reduce ; takes two arguments binary op, list; returns result of applying op 
     ; to entire list
     ; examples:
     ; (reduce + '(1 2 3 4 5))         Value: 15
     ; (reduce + '(2))                 Value: 2
     ; (reduce BOR '(#t #t #f #t #f))  Value: #t
     ; (reduce BAND '(#t #t #f #t #f)) Value: #f
     ; (reduce BAND '(#t))             Value: #t
     ; (reduce BAND '(#f))             Value: #f
     ; (reduce BOR '(#f))              Value: #f
     ; (reduce BOR '(#t))              Value: #t

(define reduce
  (lambda (op arg)
    (if (null? (cdr arg))
      (car arg)
      (op (car arg)(reduce op (cdr arg))))))


;filter ; takes two arguments pred, list; returns list of items passing pred test
     ; examples:
     ; (filter pos? '(1 3 -3 5 -6 7))  Value: (1 3 5 7)
     ; (filter pos? '(-1 -2 -3))       Value: ()
     ; (filter pos? '(1 2 3 4))        Value: (1 2 3 4)

(define filter
  (lambda (op arg)
    (cond
      ((null? arg)    ())
      ((op (car arg)) (cons (car arg) (filter op(cdr arg))))
      (else           (filter op (cdr arg))))))


; BEGIN PART 2

(define det-list '(a an the))

(define det?
  (lambda (word)
    (cond
      ((member word det-list) #t)
      (else #f))))


(define noun-list '(apple bicycle car cow dog fox motorcycle path pie road truck))

(define noun?
  (lambda (word)
    (cond
      ((member word noun-list) #t)
      (else #f))))


(define adj-list '(black brown fast hairy hot quick red slow))

(define adj?
  (lambda (word)
    (cond
      ((member word adj-list) #t)
      (else #f))))


(define verb-list '(commutes destroys drives eats jumps makes occupies rides stops travels walks))

(define verb?
  (lambda (word)
    (cond
      ((member word verb-list) #t)
      (else #f))))


(define prep-list '(around at of on over to under))
(define prep?
  (lambda (word)
    (cond
      ((member word prep-list) #t)
      (else #f))))


; What are the results? Explain in some detail how the results are calculated.

; A: It uses map to run the det? function against each element of the list.
; For the first line, there are no determinents, so it returns #f. 
; It then uses reduce to evaluate the list of booleans, which are all #f
; and therefore reduced to a single #f.
; For the second line, "the" and "a" are determinants, so they map to #t.
; The #t's combine with #f's to result in #t because
; it is using OR boolean logic.


; if 1/4 >= adjectives/length ==> #t, else #f
(define OK
  (lambda (arg)
    (cond
      ((>= (/ 1 4) (/ (count adj? arg)(length arg)))  #t)
      (else #f))))


; BEGIN PART 3

;det  ; one argument - a list
     ; returns the cdr of the list if the first word in the list is a determiner
     ; otherwise, it returns an empty list '()

(define det
  (lambda (arg)
    (cond
      ((det? (car arg)) (cdr arg))
      (else '()))))


;noun ; one argument - a list
     ; returns the cdr of the list if the first word in the list is a noun
     ; otherwise, it returns an empty list '()

(define noun
  (lambda (arg)
    (cond
      ((noun? (car arg)) (cdr arg))
      (else '()))))

;verb ; one argument - a list
     ; returns the cdr of the list if the first word in the list is a verb
     ; otherwise, it returns an empty list '()

(define verb
  (lambda (arg)
    (cond
      ((verb? (car arg)) (cdr arg))
      (else '()))))

;adj  ; one argument - a list
     ; returns the cdr of the list if the first word in the list is an adjective
     ; otherwise, it returns an empty list '()
     ;

(define adj
  (lambda (arg)
    (cond
      ((adj? (car arg)) (cdr arg))
      (else '()))))

;prep ; one argument - a list
     ; returns the cdr of the list if the first word in the list is a
     ;preposition
     ; otherwise, it returns an empty list '()
     ;
     ; examples:
     ; (adj '(hairy red dog))        ; Value: (red dog)
     ; (det '(red car))              ; Value: ()
     ; (adj (adj '(hairy red dog)))  ; Value: (dog)
     ; (noun (det '(a dog $)))       ; Value: ($)

(define prep
  (lambda (arg)
    (cond
      ((prep? (car arg)) (cdr arg))
      (else '()))))


; BEGIN PART 4

; <nounphrase1>  ->  [<det>] <nounphrase2>
(define nounphrase1
  (lambda (arg)
  ; enable for debugging
  ; (display "\nnounphrase1")
  ; (display arg)
  ; (display ")")
    (cond
      ((equal? arg ()) ())
      ((det? (car arg)) (nounphrase2 (cdr arg)))
      (else (nounphrase2 arg)))))


; <nounphrase2>  ->  <adj> <nounphrase2>
; <nounphrase2>  ->  <noun>
(define nounphrase2
  (lambda (arg)
  ; enable for debugging
  ; (display "\nnounphrase2")
  ; (display arg)
  ; (display ")")
    (cond
      ((equal? arg ()) ())
      ((adj? (car arg)) (nounphrase2 (cdr arg)))
      ((noun? (car arg)) (cdr arg))
      ((verb? (car arg)) (verbphrase arg))
      ; swap else statements for debugging
      ; (else (cons #f arg)))))
      (else #f))))


; <verbphrase>   ->  <verb> [<preposition>] [<nounphrase1>]
(define verbphrase
  (lambda (arg)
  ; enable for debugging
  ; (display "\nverbphrase")
  ; (display arg)
  ; (display ")")
    (cond
      ((equal? arg ()) ())
      ((verb? (car arg)) (verbphrase (cdr arg)))
      ((prep? (car arg)) (verbphrase (cdr arg)))
      ((det? (car arg)) (nounphrase1 arg))
      ((adj? (car arg)) (nounphrase1 arg))
      ((noun? (car arg)) (nounphrase1 arg))
      ; swap else statements for debugging
      ; (else (cons #f arg)))))
      (else #f))))


; <sentence>     ->  <nounphrase1> <verbphrase>
(define sentence
  (lambda (arg)
  ; enable for debugging
  ; (display "\nsentence")
  ; (display arg)
  ; (display ")")
    (verbphrase (nounphrase1 arg))))


