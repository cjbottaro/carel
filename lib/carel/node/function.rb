module Carel
  module Node
    class Function
      include Node
      include Aliasable

      attr_reader :name, :value

      def initialize(name, value)
        @name = name
        @value = value
      end

    end
  end
end
