module Carel
  Visitor.define(Node::AliasedFunction) do

    def traverse
      "#{visit(function)} AS #{as}"
    end

  end
end
