module Carel
  Visitor.define(Node::Eq) do

    def traverse
      "#{visit(left)} = #{quote(right)}"
    end

  end
end
