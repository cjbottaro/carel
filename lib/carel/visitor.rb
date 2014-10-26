module Carel
  module Visitor

    MAP = {}

    def self.define(klass, &block)
      visitor_class = Class.new(DelegateClass(klass))
      visitor_class.class_eval{ include(Visitor) }
      visitor_class.class_eval(&block)
      const_set(klass.name.split("::").last, visitor_class)
      MAP[klass] = visitor_class
    end

    def self.fetch(klass)
      MAP[klass]
    end

    attr_reader :context

    def initialize(object, context = [])
      super(object)
      @context = context
    end

    def visit(object)
      case object
      when Node
        Visitor.fetch(object.class).new(object, context + [__getobj__]).traverse
      else
        object
      end
    end

    def quote(value)
      case value
      when String, Symbol
        "'#{value}'"
      when Hash
        "{" + value.map{ |k, v| "#{quote(k)} : #{quote(v)}" }.join(", ") + "}"
      when Set
        "{" + value.map{ |v| quote(v) }.join(", ") + "}"
      when Array
        "[" + value.map{ |v| quote(v) }.join(", ") + "]"
      else
        value
      end
    end

  end
end

Dir.glob(File.expand_path("visitor/*", File.dirname(__FILE__))) do |file_path|
  file_name = File.basename(file_path).chomp(".rb")
  require "carel/visitor/#{file_name}"
end
