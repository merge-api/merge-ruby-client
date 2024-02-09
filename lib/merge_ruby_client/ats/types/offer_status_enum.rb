# frozen_string_literal: true

module Merge
  module Ats
    # @type [OFFER_STATUS_ENUM]
    OFFER_STATUS_ENUM = {
      draft: "DRAFT",
      approval_sent: "APPROVAL-SENT",
      approved: "APPROVED",
      sent: "SENT",
      sent_manually: "SENT-MANUALLY",
      opened: "OPENED",
      denied: "DENIED",
      signed: "SIGNED",
      deprecated: "DEPRECATED"
    }.freeze
  end
end
