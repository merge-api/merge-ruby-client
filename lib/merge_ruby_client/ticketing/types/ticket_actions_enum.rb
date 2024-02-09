# frozen_string_literal: true

module Merge
  module Ticketing
    # @type [TICKET_ACTIONS_ENUM]
    TICKET_ACTIONS_ENUM = {
      view: "VIEW",
      create: "CREATE",
      edit: "EDIT",
      delete: "DELETE",
      close: "CLOSE",
      assign: "ASSIGN"
    }.freeze
  end
end
