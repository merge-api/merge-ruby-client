# frozen_string_literal: true

module Merge
  module Filestorage
    # @type [CONDITION_TYPE_ENUM]
    CONDITION_TYPE_ENUM = {
      boolean: "BOOLEAN",
      date: "DATE",
      date_time: "DATE_TIME",
      integer: "INTEGER",
      float: "FLOAT",
      string: "STRING",
      list_of_strings: "LIST_OF_STRINGS"
    }.freeze
  end
end
