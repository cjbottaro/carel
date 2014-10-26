module Carel
  Visitor.define(Node::AliasedCount) do

    def traverse
      "#{visit(count)} AS #{as}"
    end

  end
end
