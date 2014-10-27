module Carel
  module Node
    class UpdateStatement
      include Node

      attr_reader :table_node, :values, :where_clause

      def initialize(table_node)
        @table_node = table_node
        @values = {}
        @where_clause = WhereClause.new
      end

      def set(values)
        @values = @values.merge(values)
        self
      end

      def where(*conditions)
        where_clause.add(*conditions)
        self
      end

    end
  end
end
