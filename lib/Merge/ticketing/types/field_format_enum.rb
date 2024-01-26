# frozen_string_literal: true

module Merge
  module Ticketing
    # @type [Hash{String => String}]
    FIELD_FORMAT_ENUM = {
      string: "string",
      number: "number",
      date: "date",
      datetime: "datetime",
      bool: "bool",
      list: "list"
    }.frozen
  end
end
