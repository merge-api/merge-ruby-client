# frozen_string_literal: true

module Merge
  module Accounting
    class Accounts
      # @type [ACCOUNTS_RETRIEVE_REQUEST_REMOTE_FIELDS]
      ACCOUNTS_RETRIEVE_REQUEST_REMOTE_FIELDS = {
        classification: "classification",
        classification_status: "classification,status",
        status: "status"
      }.freeze
    end
  end
end
