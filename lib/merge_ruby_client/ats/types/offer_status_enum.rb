# frozen_string_literal: true

module Merge
  module Ats
    # * `DRAFT` - DRAFT
    #  * `APPROVAL-SENT` - APPROVAL-SENT
    #  * `APPROVED` - APPROVED
    #  * `SENT` - SENT
    #  * `SENT-MANUALLY` - SENT-MANUALLY
    #  * `OPENED` - OPENED
    #  * `DENIED` - DENIED
    #  * `SIGNED` - SIGNED
    #  * `DEPRECATED` - DEPRECATED
    class OfferStatusEnum
      DRAFT = "DRAFT"
      APPROVAL_SENT = "APPROVAL-SENT"
      APPROVED = "APPROVED"
      SENT = "SENT"
      SENT_MANUALLY = "SENT-MANUALLY"
      OPENED = "OPENED"
      DENIED = "DENIED"
      SIGNED = "SIGNED"
      DEPRECATED = "DEPRECATED"
    end
  end
end
