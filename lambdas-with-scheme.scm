; @filename: scheme-with-lambdas.scm
;
; @description: This is an exercise in using lambdas as a method of defining functions.
;               It was written on a BiwaScheme interpreter, which is dialect of Scheme
;               that was written in JavaScript and can be run from a browser.
;
; @author: Mike Black

; Example of a non-recursive function
(define fahrenheitToCelsius
  (lambda (fahrenheit)
    (* (- fahrenheit 32) (/ 5 9) )))

; Example of a recursive unary function
; This function is not memoized, so large numbers may take some time to calculate.
(define fibonacci 
  (lambda (x)
    (if (< x 2) x ;; Base case: if x < 2, just return x
      (+ (fibonacci (- x 1))    
        (fibonacci (- x 2))))))

; Example of a recursive binary function 
(define greatestCommonFactor
  (lambda (m n)
    (if (<= n 0) m 
      (greatestCommonFactor n (mod m n))))); BiwaScheme does not seem to have the 
                                           ; usual "remainder" or "modulo"
                                           ; functions. Instead, they have "mod."

; Combines two lists
; The function uses cdr (tail) to gradually whittle down the first list
; Once it hits the base case, it returns the second list only
; Working backwards, from the base case, it begins appending the car (head)
; of the first list to the second list, eventually completely combining the two
(define concatenateLists
  (lambda (list1 list2)
    (if (null? list1) list2 ;; Base case
        (cons (car list1) (concatenateLists (cdr list1) list2)))))

; Combine the cdr (tail) of the original sentence, beginning with "jumped"
; with a new beginning of the sentence 
; Uses the previously-defined concatenateLists function
(define manateeizer
  (lambda (sentence)
  (concatenateLists '(the malevolent malingering manatee) 
    (member (car jumped) sentence))))


; Lists that will be used in the "List Manipulation" portion
; The single-word lists seem to be needed since Scheme prefers
; arguments to be sent by using the "car" function
(define sentence '(the quick brown fox jumped over the lazy dog))
(define numList '(8 6 7 5 3 0 9))
(define jumped '(jumped))
(define manatee '(manatee))


; Begin Main/Interactive portion
(display "*** Part 1 - Convert Fahrenheit to Celsius ***")
(newline)
(display "Enter a temperature in Fahrenheit: ")
(display (fahrenheitToCelsius(read)))
(display " is the same temperature in celsius, with super precision!")
(newline)
(newline)
(newline)
(display "*** Part 2 - Fibonacci Sequence ***")
(newline)
(display "Enter a number:")
(newline)
(display (fibonacci(read)))
(display " is the corresponding integer in the Fibonacci sequence.")
(newline)
(newline)
(newline)
(display "*** Part 3 - Euclid's Algorithm to Find the Greatest Common Factor ***")
(newline)
(display "Enter two numbers and I will return their greatest common factor/divisor)")
(newline)
(display "First number: ")
(define firstNum (read))
(display "Second number: ")
(define secondNum (read))
(newline)
(display (greatestCommonFactor firstNum secondNum))
(newline)
(newline)
(display "*** Part 4 - List Manipulation ***")
(newline)
(display "(This portion doesn't take user input)")
(newline)
(newline)
(display "Here is a sentence:")
(newline)
(display sentence)
(newline)
(newline)
(display "Does this sentence contain the word \"manatee\"?")
(newline)
(display (member (car manatee) sentence))
(newline)
(newline)
(display "Let's replace the \"the quick brown fox\" with something more exciting:")
(newline)
(display (manateeizer sentence))
(newline)
(newline)
(display "Here's a list of numbers:")
(newline)
(display numList)
(newline)
(newline)
(display "The \"car\" (head) of that list is:")
(newline)
(display (car numList))
(newline)
(newline)
(display "The \"cdr\" (tail) of that list is:")
(newline)
(display (cdr numList))
(newline)
(newline)
(display "Here is the portion of the list that begins with the number 5?")
(newline)
(display (member 5 numList))
(newline)
(newline)
(display "Does this list contain the number 42?")
(newline)
(display (member 42 numList))
(newline)

