# frozen_string_literal: true

module Merge
  module Ats
    module Activities
      # @type [Hash{String => String}]
      ACTIVITIES_LIST_REQUEST_SHOW_ENUM_ORIGINS = {
        activity_type: "activity_type",
        activity_type_visibility: "activity_type,visibility",
        visibility: "visibility"
      }.frozen
    end
  end
end
