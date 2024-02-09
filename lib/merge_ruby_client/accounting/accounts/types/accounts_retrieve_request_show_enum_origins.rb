# frozen_string_literal: true

module Merge
  module Accounting
    class Accounts
      # @type [ACCOUNTS_RETRIEVE_REQUEST_SHOW_ENUM_ORIGINS]
      ACCOUNTS_RETRIEVE_REQUEST_SHOW_ENUM_ORIGINS = {
        classification: "classification",
        classification_status: "classification,status",
        status: "status"
      }.freeze
    end
  end
end
