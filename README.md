# Lambdas with Scheme
This is an exercise in using lambdas as a method of defining functions as well as practice with tail recursion. It was written in [BiwaScheme](https://www.biwascheme.org/). This is dialect of Scheme that was written in JavaScript and can be run from a common web browser.

## Table of Contents
**[How to Run this Program](#how-to-run-this-program)**  
**[Typical Output](#typical-output)**  
**[About Scheme](#about-scheme)**  
**[About Lambdas (λ)](#about-lambdas-λ)**

## How to Run this Program  
This program was written in BiwaScheme, a dialect of Scheme that was created with JavaScript. To run it, you'll need access to a BiwaScheme interpreter.  

An online BiwaScheme interpreter should be available here:  
https://repl.it/@mikeuf/WillingScratchyDecompilers  

Simply copy and paste the code into the interpeter and click the "run" button.  

Alternatively, you can download Edwin, a Scheme text editor from MIT here:  
https://www.gnu.org/software/mit-scheme/   

**Note:** The code in this program may require light modification before it can execute within a "vanilla" Scheme environment. In particular, the use of "mod" may need to be changed to "remainder" or "modulo" in the greatestCommonFactor function.  


## Typical Output 

```
*** Part 1 - Convert Fahrenheit to Celsius ***
Enter a temperature in Fahrenheit:  72
22.22222222222222 is the same temperature in celsius, with super precision!


*** Part 2 - Fibonacci Sequence ***
Enter a number:
 8
21 is the corresponding integer in the Fibonacci sequence.


*** Part 3 - Euclid's Algorithm to Find the Greatest Common Factor ***
Enter two numbers and I will return their greatest common factor/divisor)
First number:  65
Second number:  30

5 is the greatest common factor/divisor.


*** Part 4 - List Manipulation ***
(This portion doesn't take user input)

Here is a sentence:
(the quick brown fox jumped over the lazy dog)

Does this sentence contain the word "manatee"?
#f

Let's replace the "the quick brown fox" with something more exciting:
(the malevolent malingering manatee jumped over the lazy dog)

Here's a list of numbers:
(8 6 7 5 3 0 9)

The "car" (head) of that list is:
8

The "cdr" (tail) of that list is:
(6 7 5 3 0 9)

Here is the portion of the list that begins with the number 5?
(5 3 0 9)

Does this list contain the number 42?
#f

So long, and thanks for all the numbers!
~FIN~
``` 


## About Scheme
Scheme is a Lisp-based language that was developed at MIT. It's useful for "functional programming" as opposed to the more-familiar "imperative programming."  

An introduction to Scheme is available from Wikibooks:  
https://en.wikibooks.org/wiki/Scheme_Programming


## About Lambdas (λ)
A lambda (λ) is a common notation that is used to define functions, similar to the "f(x)" notation from algebra. It was originally popularized by Alonzo Church who used it to develop [Lambda Calculus](https://en.wikipedia.org/wiki/Lambda_calculus).

In alegbra, we could define f(x) as:  
f(x) = x + 5  

If we let x = 5, then f(x) = 10.  

We can represent the same function with a λ, leaving us with:  
λx.x + 5  


### Lambdas in Scheme
In Scheme, this can be represented as:  
(lambda (x) (+ x 5))  

If we provide 5 as an input value, we can evaluate this as:  
((lambda (x) (+ x 5))5) ⇒ 10  

Notice that the addition operator ("+") appears before the operands in the list. This is because the arithmetic operators are functions, which take the form of "(functionName args)."

Another example:  
f(x, y) = x² + y²  

Is represented in Scheme as:  
((lambda (x y) (+ (* x x)(* y y)))5 5) ⇒ 50  




