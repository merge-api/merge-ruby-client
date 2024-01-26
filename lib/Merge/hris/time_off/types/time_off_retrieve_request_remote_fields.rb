# frozen_string_literal: true

module Merge
  module Hris
    module TimeOff
      # @type [Hash{String => String}]
      TIME_OFF_RETRIEVE_REQUEST_REMOTE_FIELDS = {
        request_type: "request_type",
        request_type_status: "request_type,status",
        request_type_status_units: "request_type,status,units",
        request_type_units: "request_type,units",
        status: "status",
        status_units: "status,units",
        units: "units"
      }.frozen
    end
  end
end
