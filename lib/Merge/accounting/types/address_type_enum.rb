# frozen_string_literal: true

module Merge
  module Accounting
    # @type [Hash{String => String}]
    ADDRESS_TYPE_ENUM = { billing: "BILLING", shipping: "SHIPPING" }.frozen
  end
end
