module Carel
  Visitor.define(Node::UpdateValue) do

    def traverse
      column = visit(self.column)
      value = quote(self.value)

      case type
      when :assign
        "#{column} = #{value}"
      when :plus
        "#{column} = #{column} + #{value}"
      when :at
        "#{column}[#{quote(position)}] = #{value}"
      when :minus
        "#{column} = #{column} - #{value}"
      when :prepend
        "#{column} = #{value} + #{column}"
      else
        raise(ArgumentError, "unexpected type: #{type}")
      end
    end

  end
end