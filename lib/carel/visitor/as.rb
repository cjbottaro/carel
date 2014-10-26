module Carel
  Visitor.define(Node::As) do

    def traverse
      "#{visit(target)} AS #{self.alias}"
    end

  end
end
