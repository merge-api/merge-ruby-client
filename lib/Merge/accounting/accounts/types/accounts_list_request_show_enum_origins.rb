# frozen_string_literal: true

module Merge
  module Accounting
    module Accounts
      # @type [Hash{String => String}]
      ACCOUNTS_LIST_REQUEST_SHOW_ENUM_ORIGINS = {
        classification: "classification",
        classification_status: "classification,status",
        status: "status"
      }.frozen
    end
  end
end
