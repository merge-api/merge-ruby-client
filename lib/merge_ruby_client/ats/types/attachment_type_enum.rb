# frozen_string_literal: true

module Merge
  module Ats
    # @type [ATTACHMENT_TYPE_ENUM]
    ATTACHMENT_TYPE_ENUM = {
      resume: "RESUME",
      cover_letter: "COVER_LETTER",
      offer_letter: "OFFER_LETTER",
      other: "OTHER"
    }.freeze
  end
end
