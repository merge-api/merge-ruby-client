# frozen_string_literal: true

module Merge
  module Ticketing
    module Tickets
      # @type [Hash{String => String}]
      TICKETS_COLLABORATORS_LIST_REQUEST_EXPAND = { roles: "roles", teams: "teams", teams_roles: "teams,roles" }.frozen
    end
  end
end
