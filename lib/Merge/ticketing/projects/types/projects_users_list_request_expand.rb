# frozen_string_literal: true

module Merge
  module Ticketing
    module Projects
      # @type [Hash{String => String}]
      PROJECTS_USERS_LIST_REQUEST_EXPAND = { roles: "roles", teams: "teams", teams_roles: "teams,roles" }.frozen
    end
  end
end
