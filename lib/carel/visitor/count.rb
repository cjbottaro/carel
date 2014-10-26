module Carel
  Visitor.define(Node::Count) do

    def traverse
      "COUNT(#{value})"
    end

  end
end
