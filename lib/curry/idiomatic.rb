class Curry
  class Idiomatic
    # Only works with functions with fixed number of arguments
    def call(fun)
      arity = real_arity(fun)

      if arity < 2
        fun
      else
        result = ->(*applied_args) {
          if applied_args.count >= arity
            fun.call(*applied_args)
          else
            -> (*rest) { result.call(*applied_args, *rest) }
          end
        }
      end
    end

    private

    # FIXME: work with negative arity (= dynamic argument count)
    def real_arity(fun)
      fun.arity
    end
  end
end
