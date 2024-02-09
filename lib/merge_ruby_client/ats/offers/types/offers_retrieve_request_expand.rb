# frozen_string_literal: true

module Merge
  module Ats
    class Offers
      # @type [OFFERS_RETRIEVE_REQUEST_EXPAND]
      OFFERS_RETRIEVE_REQUEST_EXPAND = {
        application: "application",
        application_creator: "application,creator",
        creator: "creator"
      }.freeze
    end
  end
end
