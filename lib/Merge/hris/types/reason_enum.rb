# frozen_string_literal: true

module Merge
  module Hris
    # @type [Hash{String => String}]
    REASON_ENUM = { general_customer_request: "GENERAL_CUSTOMER_REQUEST", gdpr: "GDPR", other: "OTHER" }.frozen
  end
end
