module Carel
  module Predicatable

    def eq(expr)
      Node::Eq.new(self, expr)
    end

    def gt(expr)
      Node::Gt.new(self, expr)
    end

  end
end
