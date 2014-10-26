module Carel
  module Node
    class InsertStatement
      include Node

      attr_reader :table_node, :column_nodes, :value_nodes, :using

      def initialize(table_node)
        @table_node = table_node
        @column_nodes = []
        @value_nodes = []
        @using = {}
      end

      def columns(*column_nodes)
        @column_nodes += column_nodes.flatten
        self
      end

      def values(*values)
        @value_nodes += values
        self
      end

      def ttl(value)
        @using[:TTL] = value
        self
      end

      def timestamp(value)
        @using[:TIMESTAMP] = value
        self
      end

    end
  end
end
