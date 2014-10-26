module Carel
  module Node
    class Column
      include Node
      include Predicatable
      include Functionable

      attr_reader :table, :name

      def initialize(table, name)
        @table  = table
        @name   = name
        @as     = nil
      end

      def as(_alias)
        AliasedColumn.new(self, _alias)
      end

      def order(direction = nil)
        Order.new(self, direction)
      end

    end
  end
end
