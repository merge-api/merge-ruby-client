# frozen_string_literal: true

module Merge
  module Ticketing
    module Users
      # @type [Hash{String => String}]
      USERS_LIST_REQUEST_EXPAND = { roles: "roles", teams: "teams", teams_roles: "teams,roles" }.frozen
    end
  end
end
