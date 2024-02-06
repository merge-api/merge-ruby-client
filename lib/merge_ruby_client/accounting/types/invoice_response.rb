# frozen_string_literal: true

require_relative "invoice"
require_relative "warning_validation_problem"
require_relative "error_validation_problem"
require_relative "debug_mode_log"
require "json"

module Merge
  module Accounting
    class InvoiceResponse
      attr_reader :model, :warnings, :errors, :logs, :additional_properties

      # @param model [Accounting::Invoice]
      # @param warnings [Array<Accounting::WarningValidationProblem>]
      # @param errors [Array<Accounting::ErrorValidationProblem>]
      # @param logs [Array<Accounting::DebugModeLog>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Accounting::InvoiceResponse]
      def initialize(model:, warnings:, errors:, logs: nil, additional_properties: nil)
        # @type [Accounting::Invoice]
        @model = model
        # @type [Array<Accounting::WarningValidationProblem>]
        @warnings = warnings
        # @type [Array<Accounting::ErrorValidationProblem>]
        @errors = errors
        # @type [Array<Accounting::DebugModeLog>]
        @logs = logs
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of InvoiceResponse
      #
      # @param json_object [JSON]
      # @return [Accounting::InvoiceResponse]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["model"].nil?
          model = nil
        else
          model = parsed_json["model"].to_json
          model = Accounting::Invoice.from_json(json_object: model)
        end
        warnings = parsed_json["warnings"]&.map do |v|
          v = v.to_json
          Accounting::WarningValidationProblem.from_json(json_object: v)
        end
        errors = parsed_json["errors"]&.map do |v|
          v = v.to_json
          Accounting::ErrorValidationProblem.from_json(json_object: v)
        end
        logs = parsed_json["logs"]&.map do |v|
          v = v.to_json
          Accounting::DebugModeLog.from_json(json_object: v)
        end
        new(model: model, warnings: warnings, errors: errors, logs: logs, additional_properties: struct)
      end

      # Serialize an instance of InvoiceResponse to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "model": @model, "warnings": @warnings, "errors": @errors, "logs": @logs }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        Accounting::Invoice.validate_raw(obj: obj.model)
        obj.warnings.is_a?(Array) != false || raise("Passed value for field obj.warnings is not the expected type, validation failed.")
        obj.errors.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
        obj.logs&.is_a?(Array) != false || raise("Passed value for field obj.logs is not the expected type, validation failed.")
      end
    end
  end
end
