# frozen_string_literal: true

module Merge
  module Ticketing
    class Comments
      class CommentsRetrieveRequestExpand
        CONTACT = "contact"
        CONTACT_TICKET = "contact,ticket"
        TICKET = "ticket"
        USER = "user"
        USER_CONTACT = "user,contact"
        USER_CONTACT_TICKET = "user,contact,ticket"
        USER_TICKET = "user,ticket"
      end
    end
  end
end
