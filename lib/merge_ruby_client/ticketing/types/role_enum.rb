# frozen_string_literal: true

module Merge
  module Ticketing
    # @type [ROLE_ENUM]
    ROLE_ENUM = {
      admin: "ADMIN",
      developer: "DEVELOPER",
      member: "MEMBER",
      api: "API",
      system: "SYSTEM",
      merge_team: "MERGE_TEAM"
    }.freeze
  end
end
