require 'benchmark/ips'

require_relative '../../lib/curry'
require_relative '../../lib/curry/right_folded'

Benchmark.ips do |x|
  # Configure the number of seconds used during
  # the warmup phase (default 2) and calculation phase (default 5)
  x.config(time: 5, warmup: 2)

  curry_plain = Curry.new
  curry_right_folded = Curry::RightFolded.new

  source = ->(x, y) { x + y }

  curried_plain = curry_plain.call(source)
  curried_right_folded = curry_right_folded.call(source)
  curried_ruby = source.curry

  x.report("applying curried binary (plain)") do
    curried_plain.call(2).call(3)
  end

  x.report("applying curried binary (right_folded)") do
    curried_right_folded.call(2).call(3)
  end

  x.report("applying curried binary (built-in)") do
    curried_ruby.call(2).call(3)
  end

  x.compare!
end


