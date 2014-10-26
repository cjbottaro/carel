module Carel
  module Node
    class Column
      include Node
      include Predicatable
      include Functionable
      include Aliasable

      attr_reader :table, :name

      def initialize(table, name)
        @table  = table
        @name   = name
        @as     = nil
      end

      def order(direction = nil)
        Order.new(self, direction)
      end

    end
  end
end
