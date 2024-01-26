# frozen_string_literal: true

module Merge
  module Ats
    module Candidates
      # @type [Hash{String => String}]
      CANDIDATES_RETRIEVE_REQUEST_EXPAND = {
        applications: "applications",
        applications_attachments: "applications,attachments",
        attachments: "attachments"
      }.frozen
    end
  end
end
