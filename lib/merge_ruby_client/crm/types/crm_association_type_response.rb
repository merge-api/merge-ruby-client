# frozen_string_literal: true

require_relative "association_type"
require_relative "warning_validation_problem"
require_relative "error_validation_problem"
require_relative "debug_mode_log"
require "json"

module Merge
  module Crm
    class CrmAssociationTypeResponse
      attr_reader :model, :warnings, :errors, :logs, :additional_properties

      # @param model [Crm::AssociationType]
      # @param warnings [Array<Crm::WarningValidationProblem>]
      # @param errors [Array<Crm::ErrorValidationProblem>]
      # @param logs [Array<Crm::DebugModeLog>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Crm::CrmAssociationTypeResponse]
      def initialize(model:, warnings:, errors:, logs: nil, additional_properties: nil)
        # @type [Crm::AssociationType]
        @model = model
        # @type [Array<Crm::WarningValidationProblem>]
        @warnings = warnings
        # @type [Array<Crm::ErrorValidationProblem>]
        @errors = errors
        # @type [Array<Crm::DebugModeLog>]
        @logs = logs
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of CrmAssociationTypeResponse
      #
      # @param json_object [JSON]
      # @return [Crm::CrmAssociationTypeResponse]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["model"].nil?
          model = nil
        else
          model = parsed_json["model"].to_json
          model = Crm::AssociationType.from_json(json_object: model)
        end
        warnings = parsed_json["warnings"]&.map do |v|
          v = v.to_json
          Crm::WarningValidationProblem.from_json(json_object: v)
        end
        errors = parsed_json["errors"]&.map do |v|
          v = v.to_json
          Crm::ErrorValidationProblem.from_json(json_object: v)
        end
        logs = parsed_json["logs"]&.map do |v|
          v = v.to_json
          Crm::DebugModeLog.from_json(json_object: v)
        end
        new(model: model, warnings: warnings, errors: errors, logs: logs, additional_properties: struct)
      end

      # Serialize an instance of CrmAssociationTypeResponse to a JSON object
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
        Crm::AssociationType.validate_raw(obj: obj.model)
        obj.warnings.is_a?(Array) != false || raise("Passed value for field obj.warnings is not the expected type, validation failed.")
        obj.errors.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
        obj.logs&.is_a?(Array) != false || raise("Passed value for field obj.logs is not the expected type, validation failed.")
      end
    end
  end
end
