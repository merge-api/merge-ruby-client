# frozen_string_literal: true

module Merge
  module Ticketing
    # @type [ITEM_FORMAT_ENUM]
    ITEM_FORMAT_ENUM = {
      string: "string",
      number: "number",
      date: "date",
      datetime: "datetime",
      bool: "bool",
      list: "list"
    }.freeze
  end
end
