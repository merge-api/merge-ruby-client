# frozen_string_literal: true

module Merge
  module Hris
    module Employees
      # @type [Hash{String => String}]
      EMPLOYEES_LIST_REQUEST_EMPLOYMENT_STATUS = { active: "ACTIVE", inactive: "INACTIVE", pending: "PENDING" }.frozen
    end
  end
end
