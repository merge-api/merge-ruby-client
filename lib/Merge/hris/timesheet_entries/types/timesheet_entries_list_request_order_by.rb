# frozen_string_literal: true

module Merge
  module Hris
    module TimesheetEntries
      # @type [Hash{String => String}]
      TIMESHEET_ENTRIES_LIST_REQUEST_ORDER_BY = {
        start_time_descending: "-start_time",
        start_time_ascending: "start_time"
      }.frozen
    end
  end
end
