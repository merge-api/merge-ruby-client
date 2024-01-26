# frozen_string_literal: true

module Merge
  module Crm
    # @type [Hash{String => String}]
    ITEM_TYPE_ENUM = {
      string: "string",
      number: "number",
      date: "date",
      datetime: "datetime",
      bool: "bool",
      list: "list"
    }.frozen
  end
end
