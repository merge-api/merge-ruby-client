# frozen_string_literal: true

module Merge
  module Hris
    # @type [Hash{String => String}]
    EMPLOYMENT_STATUS_ENUM = { active: "ACTIVE", pending: "PENDING", inactive: "INACTIVE" }.frozen
  end
end
