module Carel
  Visitor.define(Node::InsertStatement) do

    def traverse
      columns = column_nodes.map{ |node| visit(node) }.join(", ")
      values = value_nodes.map{ |node| quote(node) }.join(", ")
      s = "INSERT INTO #{visit(table_node)} (#{columns}) VALUES (#{values})"

      if using.length > 0
        s += " USING " + using.map{ |(k, v)| "#{k} #{v}" }.join(" AND ")
      end

      s
    end

  end
end
