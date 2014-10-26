module Carel
  Visitor.define(Node::Table) do

    def traverse
      if keyspace
        "#{visit(keyspace)}.#{name}"
      else
        name
      end
    end

  end
end
