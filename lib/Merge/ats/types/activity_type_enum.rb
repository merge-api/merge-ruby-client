# frozen_string_literal: true

module Merge
  module Ats
    # @type [Hash{String => String}]
    ACTIVITY_TYPE_ENUM = { note: "NOTE", email: "EMAIL", other: "OTHER" }.frozen
  end
end
