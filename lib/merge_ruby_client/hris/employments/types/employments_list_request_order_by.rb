# frozen_string_literal: true

module Merge
  module Hris
    class Employments
      # @type [EMPLOYMENTS_LIST_REQUEST_ORDER_BY]
      EMPLOYMENTS_LIST_REQUEST_ORDER_BY = {
        effective_date_descending: "-effective_date",
        effective_date_ascending: "effective_date"
      }.freeze
    end
  end
end
