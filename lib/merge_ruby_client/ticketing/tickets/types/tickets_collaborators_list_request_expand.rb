# frozen_string_literal: true

module Merge
  module Ticketing
    class Tickets
      # @type [TICKETS_COLLABORATORS_LIST_REQUEST_EXPAND]
      TICKETS_COLLABORATORS_LIST_REQUEST_EXPAND = { roles: "roles", teams: "teams", teams_roles: "teams,roles" }.freeze
    end
  end
end
