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
  curry_idiomatic = Curry::Idiomatic.new

  source = ->(x, y, z, a, b, c) { x + y + z + a + b + c }

  curried_plain = curry_plain.call(source)
  curried_right_folded = curry_right_folded.call(source)
  curried_idiomatic = curry_idiomatic.call(source)
  curried_ruby = source.curry

  x.report("applying curried arity = 6 (plain)") do
    curried_plain.call(2).call(3).call(4).call(5).call(6).call(7)
  end

  x.report("applying curried arity = 6 (right_folded)") do
    curried_right_folded.call(2).call(3).call(4).call(5).call(6).call(7)
  end

  x.report("applying curried arity = 6 (idiomatic, step-by-step)") do
    curried_idiomatic.call(2).call(3).call(4).call(5).call(6).call(7)
  end

  x.report("applying curried arity = 6 (idiomatic, half)") do
    curried_idiomatic.call(2, 3, 4).call(5, 6, 7)
  end

  x.report("applying curried arity = 6 (idiomatic, full)") do
    curried_idiomatic.call(2, 3, 4, 5, 6, 7)
  end

  x.report("applying curried arity = 6 (built-in)") do
    curried_ruby.call(2).call(3).call(4).call(5).call(6).call(7)
  end

  x.compare!
end


