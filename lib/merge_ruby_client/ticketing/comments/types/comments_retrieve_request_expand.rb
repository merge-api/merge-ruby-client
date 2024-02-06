# frozen_string_literal: true

module Merge
  module Ticketing
    class Comments
      # @type [COMMENTS_RETRIEVE_REQUEST_EXPAND]
      COMMENTS_RETRIEVE_REQUEST_EXPAND = {
        contact: "contact",
        contact_ticket: "contact,ticket",
        ticket: "ticket",
        user: "user",
        user_contact: "user,contact",
        user_contact_ticket: "user,contact,ticket",
        user_ticket: "user,ticket"
      }.freeze
    end
  end
end
