module Carel
  module Node
    class Table
      include Node

      attr_reader :name, :keyspace

      def initialize(name, keyspace = nil)
        @name = name
        @keyspace = keyspace
      end

      def [](column_name)
        Column.new(self, column_name)
      end

      def select(*projections)
        SelectStatement.new(self).project(*projections)
      end

      def insert(*columns)
        InsertStatement.new(self).columns(*columns)
      end

    end
  end
end
