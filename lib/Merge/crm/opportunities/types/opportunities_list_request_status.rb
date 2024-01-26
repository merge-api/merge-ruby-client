# frozen_string_literal: true

module Merge
  module Crm
    module Opportunities
      # @type [Hash{String => String}]
      OPPORTUNITIES_LIST_REQUEST_STATUS = { lost: "LOST", open: "OPEN", won: "WON" }.frozen
    end
  end
end
