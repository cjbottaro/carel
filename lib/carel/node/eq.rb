module Carel
  module Node
    class Eq
      include Node

      attr_reader :left, :right

      def initialize(left, right)
        @left, @right = left, right
      end

    end
  end
end
