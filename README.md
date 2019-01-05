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

* arity = 2, [Results](https://benchmark.fyi/35)
* arity = 6, [Results](https://benchmark.fyi/36)

Results show that result is pretty much similar and falls within an error, so the process of currying is equally performant.

## Applying

* arity = 2, [Results](https://benchmark.fyi/37)
* arity = 6, [Results](https://benchmark.fyi/38)

Same here, falls within error.
