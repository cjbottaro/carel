module Carel
  module Node
    class AliasedCount
      include Node

      attr_reader :count, :as

      def initialize(count, as)
        @count, @as = count, as
      end

    end
  end
end
