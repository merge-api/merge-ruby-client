# frozen_string_literal: true

module Merge
  module Accounting
    module CreditNotes
      # @type [Hash{String => String}]
      CREDIT_NOTES_RETRIEVE_REQUEST_REMOTE_FIELDS = {
        status: "status",
        status_type: "status,type",
        type: "type"
      }.frozen
    end
  end
end
