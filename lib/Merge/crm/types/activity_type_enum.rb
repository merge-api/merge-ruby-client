# frozen_string_literal: true

module Merge
  module Crm
    # @type [Hash{String => String}]
    ACTIVITY_TYPE_ENUM = { call: "CALL", meeting: "MEETING", email: "EMAIL" }.frozen
  end
end
