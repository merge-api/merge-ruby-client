# frozen_string_literal: true

module Merge
  module Hris
    # @type [Hash{String => String}]
    CONDITION_TYPE_ENUM = {
      boolean: "BOOLEAN",
      date: "DATE",
      date_time: "DATE_TIME",
      integer: "INTEGER",
      float: "FLOAT",
      string: "STRING",
      list_of_strings: "LIST_OF_STRINGS"
    }.frozen
  end
end
