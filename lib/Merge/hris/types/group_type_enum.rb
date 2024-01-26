# frozen_string_literal: true

module Merge
  module Hris
    # @type [Hash{String => String}]
    GROUP_TYPE_ENUM = {
      team: "TEAM",
      department: "DEPARTMENT",
      cost_center: "COST_CENTER",
      business_unit: "BUSINESS_UNIT",
      group: "GROUP"
    }.frozen
  end
end
