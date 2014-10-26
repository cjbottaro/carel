module Carel
  module Node
    class As
      include Node

      attr_reader :target, :alias

      def initialize(target, _alias)
        @target = target
        @alias = _alias
      end

    end
  end
end
