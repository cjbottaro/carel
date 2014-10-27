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

      def at(position)
        UpdateValue.new(self, :at, position: position)
      end

      def plus
        UpdateValue.new(self, :plus)
      end

      def minus
        UpdateValue.new(self, :minus)
      end

      def prepend
        UpdateValue.new(self, :prepend)
      end

    end
  end
end
