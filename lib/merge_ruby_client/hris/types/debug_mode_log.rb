# frozen_string_literal: true

require_relative "debug_model_log_summary"
require "ostruct"
require "json"

module Merge
  module Hris
    class DebugModeLog
      # @return [String]
      attr_reader :log_id
      # @return [String]
      attr_reader :dashboard_view
      # @return [Merge::Hris::DebugModelLogSummary]
      attr_reader :log_summary
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param log_id [String]
      # @param dashboard_view [String]
      # @param log_summary [Merge::Hris::DebugModelLogSummary]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Hris::DebugModeLog]
      def initialize(log_id:, dashboard_view:, log_summary:, additional_properties: nil)
        @log_id = log_id
        @dashboard_view = dashboard_view
        @log_summary = log_summary
        @additional_properties = additional_properties
        @_field_set = { "log_id": log_id, "dashboard_view": dashboard_view, "log_summary": log_summary }
      end

      # Deserialize a JSON object to an instance of DebugModeLog
      #
      # @param json_object [String]
      # @return [Merge::Hris::DebugModeLog]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        log_id = struct["log_id"]
        dashboard_view = struct["dashboard_view"]
        if parsed_json["log_summary"].nil?
          log_summary = nil
        else
          log_summary = parsed_json["log_summary"].to_json
          log_summary = Merge::Hris::DebugModelLogSummary.from_json(json_object: log_summary)
        end
        new(
          log_id: log_id,
          dashboard_view: dashboard_view,
          log_summary: log_summary,
          additional_properties: struct
        )
      end

      # Serialize an instance of DebugModeLog to a JSON object
      #
      # @return [String]
      def to_json(*_args)
        @_field_set&.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given
      #  hash and check each fields type against the current object's property
      #  definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.log_id.is_a?(String) != false || raise("Passed value for field obj.log_id is not the expected type, validation failed.")
        obj.dashboard_view.is_a?(String) != false || raise("Passed value for field obj.dashboard_view is not the expected type, validation failed.")
        Merge::Hris::DebugModelLogSummary.validate_raw(obj: obj.log_summary)
      end
    end
  end
end
