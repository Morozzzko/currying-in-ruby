require 'benchmark/ips'

require_relative '../../lib/curry'

Benchmark.ips do |x|
  # Configure the number of seconds used during
  # the warmup phase (default 2) and calculation phase (default 5)
  x.config(time: 5, warmup: 2)

  curry_dynamic = Curry::Dynamic.new
  curry_static = Curry::Static.new
  curry_idiomatic = Curry::Idiomatic.new

  source = ->(x, y) { }

  curried_dynamic = curry_dynamic.call(source)
  curried_static = curry_static.call(source)
  curried_idiomatic = curry_idiomatic.call(source)
  curried_ruby = source.curry

  x.report("applying curried binary (dynamic)") do
    curried_dynamic.call(2).call(3)
  end

  x.report("applying curried binary (static)") do
    curried_static.call(2).call(3)
  end

  x.report("applying curried binary (idiomatic, step-by-step)") do
    curried_idiomatic.call(2).call(3)
  end

  x.report("applying curried binary (idiomatic, full)") do
    curried_idiomatic.call(2).call(3)
  end

  x.report("applying curried binary (built-in)") do
    curried_ruby.call(2).call(3)
  end

  x.compare!
end


