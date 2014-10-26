module Carel
  module Node
    class Keyspace
      include Node

      attr_reader :name

      def initialize(name)
        @name = name
      end

      def [](table_name)
        Table.new(table_name, self)
      end

    end
  end
end
