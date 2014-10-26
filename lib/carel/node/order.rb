module Carel
  module Node
    class Order
      include Node

      ASC   = "ASC"
      DESC  = "DESC"

      attr_reader :column, :direction

      def initialize(column, direction = nil)
        @column = column
        @direction = direction
      end

      def desc
        @direction = DESC
        self
      end

      def asc
        @direction = ASC
        self
      end

      def default
        @direction = nil
      end

    end
  end
end
