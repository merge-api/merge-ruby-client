# frozen_string_literal: true

module Merge
  module Accounting
    class CreditNotes
      # @type [CREDIT_NOTES_RETRIEVE_REQUEST_REMOTE_FIELDS]
      CREDIT_NOTES_RETRIEVE_REQUEST_REMOTE_FIELDS = {
        status: "status",
        status_type: "status,type",
        type: "type"
      }.freeze
    end
  end
end
