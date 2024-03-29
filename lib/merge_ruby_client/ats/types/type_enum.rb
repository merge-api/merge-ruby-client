# frozen_string_literal: true

module Merge
  module Ats
    # @type [TYPE_ENUM]
    TYPE_ENUM = {
      date: "DATE",
      file: "FILE",
      single_select: "SINGLE_SELECT",
      multi_select: "MULTI_SELECT",
      single_line_text: "SINGLE_LINE_TEXT",
      multi_line_text: "MULTI_LINE_TEXT",
      numeric: "NUMERIC",
      boolean: "BOOLEAN"
    }.freeze
  end
end
