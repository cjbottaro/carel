module Carel
  module Node
    class AliasedFunction
      include Node

      attr_reader :function, :as

      def initialize(function, as)
        @function = function
        @as = as
      end

    end
  end
end
