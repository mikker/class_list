# frozen_string_literal: true

$LOAD_PATH.unshift(File.expand_path("../lib", __dir__))
require "class_list"

require "minitest/autorun"

class Minitest::Test
  extend Minitest::Spec::DSL
end
