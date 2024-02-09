# frozen_string_literal: true

module Merge
  module Ticketing
    class Collections
      # @type [COLLECTIONS_USERS_LIST_REQUEST_EXPAND]
      COLLECTIONS_USERS_LIST_REQUEST_EXPAND = { roles: "roles", teams: "teams", teams_roles: "teams,roles" }.freeze
    end
  end
end
