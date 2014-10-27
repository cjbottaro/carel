module Carel
  Visitor.define(Node::WhereClause) do

    def traverse
      conditions.map{ |node| visit(node) }.join(" AND ")
    end

  end
end
