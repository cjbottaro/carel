module Carel
  Visitor.define(Node::AliasedColumn) do

    def traverse
      "#{visit(column)} AS #{as}"
    end

  end
end
