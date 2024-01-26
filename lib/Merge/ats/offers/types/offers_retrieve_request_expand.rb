# frozen_string_literal: true

module Merge
  module Ats
    module Offers
      # @type [Hash{String => String}]
      OFFERS_RETRIEVE_REQUEST_EXPAND = {
        application: "application",
        application_creator: "application,creator",
        creator: "creator"
      }.frozen
    end
  end
end
