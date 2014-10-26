module Carel
  module Node
    class Gt
      include Node

      attr_reader :left, :right

      def initialize(left, right)
        @left, @right = left, right
      end

    end
  end
end
