# frozen_string_literal: true

module Merge
  module Hris
    module Employments
      # @type [Hash{String => String}]
      EMPLOYMENTS_LIST_REQUEST_ORDER_BY = {
        effective_date_descending: "-effective_date",
        effective_date_ascending: "effective_date"
      }.frozen
    end
  end
end
