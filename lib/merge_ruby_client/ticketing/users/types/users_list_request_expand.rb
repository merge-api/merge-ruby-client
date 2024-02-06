# frozen_string_literal: true

module Merge
  module Ticketing
    class Users
      # @type [USERS_LIST_REQUEST_EXPAND]
      USERS_LIST_REQUEST_EXPAND = { roles: "roles", teams: "teams", teams_roles: "teams,roles" }.freeze
    end
  end
end
