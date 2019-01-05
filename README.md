# Curry

My attempt at writing my own currying in Ruby

Currently it provides 2 ways of currying. I'm not sure about terminology so please write me an email with a better name.

Two ways of currying:

* Plain, simple, and slow. Generates a new lambda until you can apply the function
* Right-folded. Relatively threadsafe (not tested), a bit more performant

I'll write benchmarks for that and check it out


# Benchmarks

## Currying

Benchmarks are located in [benchmarks/currying](benchmarks/currying). I tested a process of currying on two kinds of functions:

* arity = 2, [Results](https://benchmark.fyi/3b)
* arity = 6, [Results](https://benchmark.fyi/3d)

Results indicate that both currying methods are equally performant, and the built-in `#curry` is ~20% slower


## Applying

* arity = 2, [Results](https://benchmark.fyi/39)
* arity = 6, [Results](https://benchmark.fyi/3a)

Same here, falls within error. However, the built-in `#curry` method is less performant than the in-house version. Which is odd
