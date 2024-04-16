(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause) (else else-clause))
  )

; requires auxiliary procedures defined in eg1_1_7.scm
(define (new-sqrt-iter guess x)
  (new-if (is-good-enough guess x)
		  guess
		  (new-sqrt-iter (improve guess x) x))
  )

(define (new-sqrt x)
  (new-sqrt-iter 1.0 x))

#|
Reason why `if` has to be implemented as a special form: if you use `new-sqrt` you error out on hitting the recursion limit for simple cases like `(new-sqrt 2)` which we expect to work.
Presumably there is a way to increase this limit, but I guess you then risk a stack overflow instead?
This is because Lisp interpreters use "applicative-order evaluation". We evaluate the operator, then evaluate the operands, then substitute the operand values into the operator procedure. 
So a call to `new-if` needs to evaluate all three arguments. In particular, the else clause with the recursive `new-sqrt-iter` call causes the problem, since it then calls `new-if`, which calls `new-sqrt-iter`, which calls `new-if`, which calls ... This goes on forever, so the interpreter hits a stack overflow before it can actually evaluate anything.
The special form impelementation of `if` fixes this by only conditionally evaluating either the `then-clause` or the `else-clause`, depending on the predicate. So the stack grows by the same pattern, until the first call where `is-good-enough` evaluates to true and we simply evaluate the `then-clause`. 
|#
