module Carel
  module Node
    class AliasedColumn
      include Node
      include Predicatable

      attr_reader :column, :as

      def initialize(column, as)
        @column, @as = column, as
      end

    end
  end
end
