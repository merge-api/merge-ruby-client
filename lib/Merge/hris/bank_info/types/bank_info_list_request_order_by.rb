# frozen_string_literal: true

module Merge
  module Hris
    module BankInfo
      # @type [Hash{String => String}]
      BANK_INFO_LIST_REQUEST_ORDER_BY = {
        remote_created_at_descending: "-remote_created_at",
        remote_created_at_ascending: "remote_created_at"
      }.frozen
    end
  end
end
