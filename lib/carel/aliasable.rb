module Carel
  module Aliasable

    def as(_alias)
      Node::As.new(self, _alias)
    end
    
  end
end
