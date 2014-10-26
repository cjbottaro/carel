module Carel
  module Node
    class Function
      include Node

      attr_reader :name, :value

      def initialize(name, value)
        @name = name
        @value = value
      end

      def as(_alias)
        AliasedFunction.new(self, _alias)
      end

    end
  end
end
