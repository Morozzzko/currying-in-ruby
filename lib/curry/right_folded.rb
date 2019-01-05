class Curry
  class RightFolded
    # Only works with functions with fixed number of arguments
    def call(fun)
      arity = real_arity(fun)

      if arity < 2
        fun
      else
        -> (x) {
          arguments = [x]
          reduce_arity(fun, arity - 1, arguments)
        }
      end
    end

    private

    # FIXME: work with negative arity (= dynamic argument count)
    def real_arity(fun)
      fun.arity
    end

    def reduce_arity(fun, new_arity, arguments)
      if new_arity.zero?
        fun.call(*arguments)
      else
        -> (x) {
          arguments << x
          reduce_arity(fun, new_arity - 1, arguments)
        }
      end
    end
  end
end
