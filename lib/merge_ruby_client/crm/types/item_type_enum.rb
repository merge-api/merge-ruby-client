# frozen_string_literal: true

module Merge
  module Crm
    # @type [ITEM_TYPE_ENUM]
    ITEM_TYPE_ENUM = {
      string: "string",
      number: "number",
      date: "date",
      datetime: "datetime",
      bool: "bool",
      list: "list"
    }.freeze
  end
end
