module Carel
  Visitor.define(Node::Order) do

    def traverse
      if direction
        "#{visit(column)} #{direction}"
      else
        visit(column)
      end
    end

  end
end
