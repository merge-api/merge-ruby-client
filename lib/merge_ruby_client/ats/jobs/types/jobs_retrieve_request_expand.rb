# frozen_string_literal: true

module Merge
  module Ats
    class Jobs
      # @type [JOBS_RETRIEVE_REQUEST_EXPAND]
      JOBS_RETRIEVE_REQUEST_EXPAND = {
        departments: "departments",
        departments_hiring_managers: "departments,hiring_managers",
        departments_hiring_managers_recruiters: "departments,hiring_managers,recruiters",
        departments_offices: "departments,offices",
        departments_offices_hiring_managers: "departments,offices,hiring_managers",
        departments_offices_hiring_managers_recruiters: "departments,offices,hiring_managers,recruiters",
        departments_offices_recruiters: "departments,offices,recruiters",
        departments_recruiters: "departments,recruiters",
        hiring_managers: "hiring_managers",
        hiring_managers_recruiters: "hiring_managers,recruiters",
        offices: "offices",
        offices_hiring_managers: "offices,hiring_managers",
        offices_hiring_managers_recruiters: "offices,hiring_managers,recruiters",
        offices_recruiters: "offices,recruiters",
        recruiters: "recruiters"
      }.freeze
    end
  end
end
