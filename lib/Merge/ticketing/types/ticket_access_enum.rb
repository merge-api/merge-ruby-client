# frozen_string_literal: true

module Merge
  module Ticketing
    # @type [Hash{String => String}]
    TICKET_ACCESS_ENUM = { all: "ALL", assigned_only: "ASSIGNED_ONLY", team_only: "TEAM_ONLY" }.frozen
  end
end
