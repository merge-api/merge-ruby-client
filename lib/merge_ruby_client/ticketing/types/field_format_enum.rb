# frozen_string_literal: true

module Merge
  module Ticketing
    # @type [FIELD_FORMAT_ENUM]
    FIELD_FORMAT_ENUM = {
      string: "string",
      number: "number",
      date: "date",
      datetime: "datetime",
      bool: "bool",
      list: "list"
    }.freeze
  end
end
