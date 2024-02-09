# frozen_string_literal: true

module Merge
  module Ats
    class Activities
      # @type [ACTIVITIES_RETRIEVE_REQUEST_REMOTE_FIELDS]
      ACTIVITIES_RETRIEVE_REQUEST_REMOTE_FIELDS = {
        activity_type: "activity_type",
        activity_type_visibility: "activity_type,visibility",
        visibility: "visibility"
      }.freeze
    end
  end
end
