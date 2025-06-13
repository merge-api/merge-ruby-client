# frozen_string_literal: true

require_relative "item"
require_relative "warning_validation_problem"
require_relative "error_validation_problem"
require_relative "debug_mode_log"
require "ostruct"
require "json"

module Merge
  module Accounting
    class ItemResponse
      # @return [Merge::Accounting::Item]
      attr_reader :model
      # @return [Array<Merge::Accounting::WarningValidationProblem>]
      attr_reader :warnings
      # @return [Array<Merge::Accounting::ErrorValidationProblem>]
      attr_reader :errors
      # @return [Array<Merge::Accounting::DebugModeLog>]
      attr_reader :logs
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param model [Merge::Accounting::Item]
      # @param warnings [Array<Merge::Accounting::WarningValidationProblem>]
      # @param errors [Array<Merge::Accounting::ErrorValidationProblem>]
      # @param logs [Array<Merge::Accounting::DebugModeLog>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Accounting::ItemResponse]
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

      # Deserialize a JSON object to an instance of ItemResponse
      #
      # @param json_object [String]
      # @return [Merge::Accounting::ItemResponse]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["model"].nil?
          model = nil
        else
          model = parsed_json["model"].to_json
          model = Merge::Accounting::Item.from_json(json_object: model)
        end
        warnings = parsed_json["warnings"]&.map do |item|
          item = item.to_json
          Merge::Accounting::WarningValidationProblem.from_json(json_object: item)
        end
        errors = parsed_json["errors"]&.map do |item|
          item = item.to_json
          Merge::Accounting::ErrorValidationProblem.from_json(json_object: item)
        end
        logs = parsed_json["logs"]&.map do |item|
          item = item.to_json
          Merge::Accounting::DebugModeLog.from_json(json_object: item)
        end
        new(
          model: model,
          warnings: warnings,
          errors: errors,
          logs: logs,
          additional_properties: struct
        )
      end

      # Serialize an instance of ItemResponse to a JSON object
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
        Merge::Accounting::Item.validate_raw(obj: obj.model)
        obj.warnings.is_a?(Array) != false || raise("Passed value for field obj.warnings is not the expected type, validation failed.")
        obj.errors.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
        obj.logs&.is_a?(Array) != false || raise("Passed value for field obj.logs is not the expected type, validation failed.")
      end
    end
  end
end
