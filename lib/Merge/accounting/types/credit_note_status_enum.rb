# frozen_string_literal: true

module Merge
  module Accounting
    # @type [Hash{String => String}]
    CREDIT_NOTE_STATUS_ENUM = { submitted: "SUBMITTED", authorized: "AUTHORIZED", paid: "PAID" }.frozen
  end
end
