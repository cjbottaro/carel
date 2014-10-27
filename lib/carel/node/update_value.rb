module Carel
  module Node
    class UpdateValue
      include Node

      TYPES = [:assign, :at, :plus, :minus, :prepend]

      attr_reader :column, :type
      attr_accessor :value, :position

      def initialize(column, type, options = {})
        @column = column
        @type = type
        @value = options[:value]
        @position = options[:position]
      end

    end
  end
end