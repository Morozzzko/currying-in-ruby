#!/usr/bin/env ruby
require 'benchmark/ips'

require_relative '../../lib/curry'

Benchmark.ips do |x|
  # Configure the number of seconds used during
  # the warmup phase (default 2) and calculation phase (default 5)
  x.config(time: 5, warmup: 2)

  curry_dynamic = Curry::Dynamic.new
  curry_static = Curry::Static.new

  source = ->(x, y) { x + y }


  x.report("currying binary (dynamic)") do
    curry_dynamic.call(source)
  end

  x.report("currying binary (static") do
    curry_static.call(source)
  end

  x.report("currying binary (built-in)") do
    source.curry
  end

  x.compare!
end


