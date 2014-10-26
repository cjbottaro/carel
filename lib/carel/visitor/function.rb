module Carel
  Visitor.define(Node::Function) do

    def traverse
      "#{name}(#{visit(value)})"
    end

  end
end
