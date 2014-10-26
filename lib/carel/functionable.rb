module Carel
  module Functionable

    def function(name)
      Node::Function.new(name, self)
    end

  end
end
