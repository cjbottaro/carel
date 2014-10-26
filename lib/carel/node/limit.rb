module Carel
  module Node
    class Limit
      include Node

      attr_reader :n

      def initialize(n)
        @n = n
      end

    end
  end
end
