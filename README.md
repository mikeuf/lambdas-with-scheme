# Lambdas With Scheme

Scheme is a Lisp-based language that was developed at MIT. It's useful for "functional programming" as opposed to the more-familiar "imperative programming."  

An introduction to Scheme is available from Wikibooks:  
https://en.wikibooks.org/wiki/Scheme_Programming

An online Scheme interpreter is available here:  
https://repl.it/@mikeuf/WillingScratchyDecompilers  

Additionally, you can download Edwin, a Scheme text editor from MIT here:  
https://www.gnu.org/software/mit-scheme/  

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

Notice that the addition operator ("+") appears before the operands in the list.  

Another example:  
f(x, y) = x² + y²  

Is represented in Scheme as:  
((lambda (x y) (+ (* x x)(* y y)))5 5) ⇒ 50  

## How to Run the Program
This program was written in BiwaScheme, a dialect of Scheme that was created with JavaScript.

### Typical Output 

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

5

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
``` 




