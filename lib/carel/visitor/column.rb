module Carel
  Visitor.define(Node::Column) do

    def traverse
      name
    end

  end
end
