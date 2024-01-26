# frozen_string_literal: true

module Merge
  module Ats
    # @type [Hash{String => String}]
    ATTACHMENT_TYPE_ENUM = {
      resume: "RESUME",
      cover_letter: "COVER_LETTER",
      offer_letter: "OFFER_LETTER",
      other: "OTHER"
    }.frozen
  end
end
