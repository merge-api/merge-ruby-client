# frozen_string_literal: true

module Merge
  module Ticketing
    # @type [Hash{String => String}]
    TICKET_ACTIONS_ENUM = {
      view: "VIEW",
      create: "CREATE",
      edit: "EDIT",
      delete: "DELETE",
      close: "CLOSE",
      assign: "ASSIGN"
    }.frozen
  end
end
