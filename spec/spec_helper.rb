require "pry"
require "carel"

require "helper_methods"

RSpec.configure do |config|
  config.include Carel::Helpers::OnExamples
  config.include Carel::Helpers::InExamples
end