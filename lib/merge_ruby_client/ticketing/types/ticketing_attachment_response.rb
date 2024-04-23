# frozen_string_literal: true

require_relative "attachment"
require_relative "warning_validation_problem"
require_relative "error_validation_problem"
require_relative "debug_mode_log"
require "ostruct"
require "json"

module Merge
  module Ticketing
    class TicketingAttachmentResponse
      # @return [Merge::Ticketing::Attachment]
      attr_reader :model
      # @return [Array<Merge::Ticketing::WarningValidationProblem>]
      attr_reader :warnings
      # @return [Array<Merge::Ticketing::ErrorValidationProblem>]
      attr_reader :errors
      # @return [Array<Merge::Ticketing::DebugModeLog>]
      attr_reader :logs
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param model [Merge::Ticketing::Attachment]
      # @param warnings [Array<Merge::Ticketing::WarningValidationProblem>]
      # @param errors [Array<Merge::Ticketing::ErrorValidationProblem>]
      # @param logs [Array<Merge::Ticketing::DebugModeLog>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Ticketing::TicketingAttachmentResponse]
      def initialize(model:, warnings:, errors:, logs: OMIT, additional_properties: nil)
        @model = model
        @warnings = warnings
        @errors = errors
        @logs = logs if logs != OMIT
        @additional_properties = additional_properties
        @_field_set = { "model": model, "warnings": warnings, "errors": errors, "logs": logs }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of TicketingAttachmentResponse
      #
      # @param json_object [String]
      # @return [Merge::Ticketing::TicketingAttachmentResponse]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["model"].nil?
          model = nil
        else
          model = parsed_json["model"].to_json
          model = Merge::Ticketing::Attachment.from_json(json_object: model)
        end
        warnings = parsed_json["warnings"]&.map do |v|
          v = v.to_json
          Merge::Ticketing::WarningValidationProblem.from_json(json_object: v)
        end
        errors = parsed_json["errors"]&.map do |v|
          v = v.to_json
          Merge::Ticketing::ErrorValidationProblem.from_json(json_object: v)
        end
        logs = parsed_json["logs"]&.map do |v|
          v = v.to_json
          Merge::Ticketing::DebugModeLog.from_json(json_object: v)
        end
        new(
          model: model,
          warnings: warnings,
          errors: errors,
          logs: logs,
          additional_properties: struct
        )
      end

      # Serialize an instance of TicketingAttachmentResponse to a JSON object
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
        Merge::Ticketing::Attachment.validate_raw(obj: obj.model)
        obj.warnings.is_a?(Array) != false || raise("Passed value for field obj.warnings is not the expected type, validation failed.")
        obj.errors.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
        obj.logs&.is_a?(Array) != false || raise("Passed value for field obj.logs is not the expected type, validation failed.")
      end
    end
  end
end
