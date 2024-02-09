# frozen_string_literal: true

module Merge
  module Ticketing
    class Projects
      # @type [PROJECTS_USERS_LIST_REQUEST_EXPAND]
      PROJECTS_USERS_LIST_REQUEST_EXPAND = { roles: "roles", teams: "teams", teams_roles: "teams,roles" }.freeze
    end
  end
end
