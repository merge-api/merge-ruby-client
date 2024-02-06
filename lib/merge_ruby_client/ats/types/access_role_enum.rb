# frozen_string_literal: true

module Merge
  module Ats
    # @type [ACCESS_ROLE_ENUM]
    ACCESS_ROLE_ENUM = {
      super_admin: "SUPER_ADMIN",
      admin: "ADMIN",
      team_member: "TEAM_MEMBER",
      limited_team_member: "LIMITED_TEAM_MEMBER",
      interviewer: "INTERVIEWER"
    }.freeze
  end
end
