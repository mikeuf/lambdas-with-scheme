# Lambdas With Scheme

Scheme is a Lisp-based language that was developed at MIT. It's useful for "functional programming" as opposed to the more-familiar "imperative programming."

## About Lambdas (λ)
A lambda (λ) is a common notation that is used to define functions, similar to the "f(x)" notation from algebra. It was originally popularized by Alonzo Church who used it to develop [Lambda Calculus](https://en.wikipedia.org/wiki/Lambda_calculus).

**Example:** 
In alegbra, we could define f(x) as:
f(x) = x + 5

If we let x = 5, then f(x) = 10.

We can represent the same function with a λ, leaving us with:
λx.x + 5

In Scheme, this can be represented as:
`(lambda (x) (+ x 5))`

Notice that the addition operator ("+") appears before the operands in the list.
