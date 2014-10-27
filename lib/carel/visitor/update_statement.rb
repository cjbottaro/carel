module Carel
  Visitor.define(Node::UpdateStatement) do

    def traverse
      s = "UPDATE #{visit(table_node)}"

      set_clause = values.map do |column, value|
        case column
        when Node::Column
          node = Node::UpdateValue.new(column, :assign)
        when Node::UpdateValue
          node = column
        when Symbol, String
          # This is so .update(symbol: :blah) works.
          column = Node::Column.new(table_node, column)
          node = Node::UpdateValue.new(column, :assign)
        else
          raise(ArgumentError, "unexpected node: #{column}")
        end
        node.value = value
        visit(node)
      end
      s += " SET " + set_clause.join(", ")

      if !where_clause.empty?
        s += " WHERE #{visit(where_clause)}"
      end

      s
    end

  end
end
