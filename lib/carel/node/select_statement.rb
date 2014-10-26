module Carel
  module Node
    class SelectStatement
      include Node

      attr_reader :from_node, :select_nodes, :where_nodes, :order_nodes, :limit_node

      def initialize(from_node)
        @from_node = from_node
        @select_nodes = []
        @where_nodes = []
        @order_nodes = []
        @limit_node = nil
      end

      def project(*projections)
        @select_nodes += projections
        self
      end

      def where(*where_nodes)
        @where_nodes += where_nodes
        self
      end

      def distinct
        @distinct = true
        self
      end

      def order(*order_nodes)
        @order_nodes += order_nodes
        self
      end

      def limit(n)
        case n
        when Limit
          @limit_node = n
        else
          @limit_node = Limit.new(n.to_i)
        end
        self
      end

      def allow_filtering
        @allow_filtering = true
        self
      end

    protected

      def distinct?
        !!@distinct
      end

      def allow_filtering?
        !!@allow_filtering
      end

    end
  end
end
