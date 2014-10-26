module Carel
  Visitor.define(Node::SelectStatement) do

    def traverse
      str = ["SELECT"]
      str << "DISTINCT" if distinct?

      if select_nodes.empty?
        str << Carel::Node::Star
      else
        str << select_nodes.map{ |node| visit(node) }.join(", ")
      end

      str << "FROM" << visit(from_node)
      str << "WHERE" << where_nodes.map{ |node| visit(node) }.join(" AND ") if !where_nodes.empty?
      if !order_nodes.empty?
        str << "ORDER BY" << order_nodes.map{ |node| visit(node) }.join(", ")
      end

      if limit_node
        str << "LIMIT #{visit(limit_node)}"
      end

      if allow_filtering?
        str << "ALLOW FILTERING"
      end

      str.join(" ")
    end

  end
end
