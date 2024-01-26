# frozen_string_literal: true

module Merge
  module Ticketing
    module Comments
      # @type [Hash{String => String}]
      COMMENTS_LIST_REQUEST_EXPAND = {
        contact: "contact",
        contact_ticket: "contact,ticket",
        ticket: "ticket",
        user: "user",
        user_contact: "user,contact",
        user_contact_ticket: "user,contact,ticket",
        user_ticket: "user,ticket"
      }.frozen
    end
  end
end
