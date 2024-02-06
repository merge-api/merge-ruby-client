# frozen_string_literal: true

module Merge
  module Hris
    class BankInfo
      # @type [BANK_INFO_LIST_REQUEST_ORDER_BY]
      BANK_INFO_LIST_REQUEST_ORDER_BY = {
        remote_created_at_descending: "-remote_created_at",
        remote_created_at_ascending: "remote_created_at"
      }.freeze
    end
  end
end
