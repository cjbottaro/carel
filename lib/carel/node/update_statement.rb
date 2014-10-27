module Carel
  module Node
    class UpdateStatement
      include Node

      attr_reader :table_node, :values, :where_nodes

      def initialize(table_node)
        @table_node = table_node
        @values = {}
        @where_nodes = []
      end

      def set(values)
        @values = @values.merge(values)
        self
      end

      # Copy/paste from SelectStatement
      def where(*where_nodes)
        @where_nodes += where_nodes.inject([]) do |memo, where_node|
          case where_node
          when Hash
            where_node.each do |column, value|
              case column
              when String, Symbol
                memo << table_node[column].eq(value)
              else
                memo << column.eq(value)
              end
            end
          else
            memo << where_node
          end
          memo
        end
        self
      end

    end
  end
end
