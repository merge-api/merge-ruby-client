# frozen_string_literal: true

module Merge
  module Crm
    module Issues
      # @type [Hash{String => String}]
      ISSUES_LIST_REQUEST_STATUS = { ongoing: "ONGOING", resolved: "RESOLVED" }.frozen
    end
  end
end
