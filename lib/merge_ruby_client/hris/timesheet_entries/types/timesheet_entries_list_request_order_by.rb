# frozen_string_literal: true

module Merge
  module Hris
    class TimesheetEntries
      # @type [TIMESHEET_ENTRIES_LIST_REQUEST_ORDER_BY]
      TIMESHEET_ENTRIES_LIST_REQUEST_ORDER_BY = {
        start_time_descending: "-start_time",
        start_time_ascending: "start_time"
      }.freeze
    end
  end
end
