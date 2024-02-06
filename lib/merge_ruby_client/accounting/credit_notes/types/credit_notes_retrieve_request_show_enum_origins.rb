# frozen_string_literal: true

module Merge
  module Accounting
    class CreditNotes
      # @type [CREDIT_NOTES_RETRIEVE_REQUEST_SHOW_ENUM_ORIGINS]
      CREDIT_NOTES_RETRIEVE_REQUEST_SHOW_ENUM_ORIGINS = {
        status: "status",
        status_type: "status,type",
        type: "type"
      }.freeze
    end
  end
end
