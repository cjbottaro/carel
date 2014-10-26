module Carel
  Visitor.define(Node::Gt) do

    def traverse
      "#{visit(left)} > #{quote(right)}"
    end

  end
end
