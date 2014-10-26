module Carel
  module Node
    class Count
      include Node

      attr_reader :value

      def initialize(value = Star)
        @value = value
      end

      def as(_alias)
        AliasedCount.new(self, _alias)
      end

    end
  end
end
