module Carel
  module Node

    Star = "*"

    class BindVar
    end

    def to_cql
      Visitor.fetch(self.class).new(self).traverse
    end

  end
end

Dir.glob(File.expand_path("node/*", File.dirname(__FILE__))) do |file_path|
  file_name = File.basename(file_path).chomp(".rb")
  require "carel/node/#{file_name}"
end
