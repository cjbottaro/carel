module Carel
  Visitor.define(Node::Keyspace) do

    def traverse
      name
    end

  end
end
