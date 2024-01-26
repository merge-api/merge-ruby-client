# frozen_string_literal: true

require_relative "file"
require_relative "warning_validation_problem"
require_relative "error_validation_problem"
require_relative "debug_mode_log"
require "json"

module Merge
  module Filestorage
    class FileStorageFileResponse
      attr_reader :model, :warnings, :errors, :logs, :additional_properties

      # @param model [Filestorage::File]
      # @param warnings [Array<Filestorage::WarningValidationProblem>]
      # @param errors [Array<Filestorage::ErrorValidationProblem>]
      # @param logs [Array<Filestorage::DebugModeLog>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Filestorage::FileStorageFileResponse]
      def initialize(model:, warnings:, errors:, logs: nil, additional_properties: nil)
        # @type [Filestorage::File]
        @model = model
        # @type [Array<Filestorage::WarningValidationProblem>]
        @warnings = warnings
        # @type [Array<Filestorage::ErrorValidationProblem>]
        @errors = errors
        # @type [Array<Filestorage::DebugModeLog>]
        @logs = logs
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of FileStorageFileResponse
      #
      # @param json_object [JSON]
      # @return [Filestorage::FileStorageFileResponse]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        model = struct.model.to_h.to_json
        model = Filestorage::File.from_json(json_object: model)
        warnings = struct.warnings.map do |v|
          v = v.to_h.to_json
          Filestorage::WarningValidationProblem.from_json(json_object: v)
        end
        errors = struct.errors.map do |v|
          v = v.to_h.to_json
          Filestorage::ErrorValidationProblem.from_json(json_object: v)
        end
        logs = struct.logs.map do |v|
          v = v.to_h.to_json
          Filestorage::DebugModeLog.from_json(json_object: v)
        end
        new(model: model, warnings: warnings, errors: errors, logs: logs, additional_properties: struct)
      end

      # Serialize an instance of FileStorageFileResponse to a JSON object
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
        Filestorage::File.validate_raw(obj: obj.model)
        obj.warnings.is_a?(Array) != false || raise("Passed value for field obj.warnings is not the expected type, validation failed.")
        obj.errors.is_a?(Array) != false || raise("Passed value for field obj.errors is not the expected type, validation failed.")
        obj.logs&.is_a?(Array) != false || raise("Passed value for field obj.logs is not the expected type, validation failed.")
      end
    end
  end
end
