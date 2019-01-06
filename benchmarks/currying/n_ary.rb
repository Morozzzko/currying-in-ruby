require 'benchmark/ips'

require_relative '../../lib/curry'
require_relative '../../lib/curry/right_folded'
require_relative '../../lib/curry/idiomatic'

Benchmark.ips do |x|
  # Configure the number of seconds used during
  # the warmup phase (default 2) and calculation phase (default 5)
  x.config(time: 5, warmup: 2)

  curry_plain = Curry.new
  curry_right_folded = Curry::RightFolded.new

  source = ->(x, y, z, a, b, c) { x + y + z + a + b + c }


  x.report("currying arity = 6 (plain)") do
    curry_plain.call(source)
  end

  x.report("currying arity = 6 (right_folded") do
    curry_right_folded.call(source)
  end

  x.report("currying arity = 6 (built-in)") do
    source.curry
  end

  x.compare!
end
