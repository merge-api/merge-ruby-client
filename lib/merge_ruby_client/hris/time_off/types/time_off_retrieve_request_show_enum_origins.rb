# frozen_string_literal: true

module Merge
  module Hris
    class TimeOff
      # @type [TIME_OFF_RETRIEVE_REQUEST_SHOW_ENUM_ORIGINS]
      TIME_OFF_RETRIEVE_REQUEST_SHOW_ENUM_ORIGINS = {
        request_type: "request_type",
        request_type_status: "request_type,status",
        request_type_status_units: "request_type,status,units",
        request_type_units: "request_type,units",
        status: "status",
        status_units: "status,units",
        units: "units"
      }.freeze
    end
  end
end
