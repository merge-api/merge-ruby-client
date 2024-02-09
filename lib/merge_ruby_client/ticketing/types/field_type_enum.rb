# frozen_string_literal: true

module Merge
  module Ticketing
    # @type [FIELD_TYPE_ENUM]
    FIELD_TYPE_ENUM = {
      string: "string",
      number: "number",
      date: "date",
      datetime: "datetime",
      bool: "bool",
      list: "list"
    }.freeze
  end
end
