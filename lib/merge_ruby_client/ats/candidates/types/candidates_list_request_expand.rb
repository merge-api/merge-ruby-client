# frozen_string_literal: true

module Merge
  module Ats
    class Candidates
      # @type [CANDIDATES_LIST_REQUEST_EXPAND]
      CANDIDATES_LIST_REQUEST_EXPAND = {
        applications: "applications",
        applications_attachments: "applications,attachments",
        attachments: "attachments"
      }.freeze
    end
  end
end
