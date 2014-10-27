module Carel
  module Node
    class WhereClause
      include Node

      attr_reader :conditions

      def initialize(*conditions)
        @conditions = []
        add(*conditions)
      end

      def add(*args)
        args.each do |arg|
          case arg
          when Hash
            handle_hash_condition(arg)
          when Node
            handle_node_condition(arg)
          else
            raise(ArgumentError, "unexpected condition: #{arg}")
          end
        end

        self
      end

      def empty?
        conditions.empty?
      end

    private

      def handle_hash_condition(hash)
        hash.each do |column, value|
          column = Column.new(column) unless column.kind_of?(Column)
          conditions << column.eq(value)
        end
      end

      def handle_node_condition(node)
        conditions << node
      end

    end
  end
end