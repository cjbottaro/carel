module Carel
  module Helpers

    module OnExamples

    end

    module InExamples

      def keyspace(name)
        Node::Keyspace.new(name)
      end

      def table(name)
        Node::Table.new(name)
      end

      def column(name)
        Node::Column.new(name)
      end

      def assert_cql(node)
        expect(node.to_cql).to eq(subject)
      end

    end

  end
end