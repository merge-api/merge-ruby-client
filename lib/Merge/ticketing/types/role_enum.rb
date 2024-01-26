# frozen_string_literal: true

module Merge
  module Ticketing
    # @type [Hash{String => String}]
    ROLE_ENUM = {
      admin: "ADMIN",
      developer: "DEVELOPER",
      member: "MEMBER",
      api: "API",
      system: "SYSTEM",
      merge_team: "MERGE_TEAM"
    }.frozen
  end
end
