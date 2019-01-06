# Curry

My attempt at writing custom `curry` function in Ruby.

I've designed three ways to curry a function:

* Dynamic
* Static
* Idiomatic

Dynamic currying works from the leftmost argument, fixing arguments one-by-one and generating a new function after every call.

Static currying is the classical currying: it turns a N-ary function into N unary functions. Practically, it generates N lambdas, each of those fixes their own argument.

Idiomatic currying gets its name because it works like Ruby's built-in currying. Unlike dynamic and static currying, which only allow us to pass only one argument at a time, idiomatic currying enables us to pass multiple arguments to the `#call`.

# Not implemented

I haven't implemented currying for procs with variable number of arguments (i.e. negative arity).

Feel free to send PRs!

# Benchmarks

All benchmarks were run for functions of arity 2 and 6. Target function has no body to eliminate all calculation overhead.

In those benchmarks, I compare peformance of 4 types of currying:

* Static
* Dynamic
* Idiomatic
* Built-in

## Currying

Currying is a process that takes some time, so I wanted to measure it.

* [Results for arity = 2](https://benchmark.fyi/3f)
* [Results for arity = 6](https://benchmark.fyi/3g)

The results above indicate that performance of dynamic, static and idiomatic currying is virtually the same, as the difference falls within error and can be ignored. However, the built-in `#curry` method is 23% slower than custom methods.

I still don't know why, and I'll have to try again after adding support for functions with variable arity.

## Applying
