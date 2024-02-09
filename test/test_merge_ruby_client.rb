# frozen_string_literal: true

require_relative "test_helper"
require "merge_ruby_client"

# Basic Merge tests
class TestMerge < Minitest::Test
  def test_function
    Merge::Client.new
  end
end
