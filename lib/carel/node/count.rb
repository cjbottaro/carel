module Carel
  module Node
    class Count
      include Node
      include Aliasable

      attr_reader :value

      def initialize(value = Star)
        @value = value
      end

    end
  end
end
