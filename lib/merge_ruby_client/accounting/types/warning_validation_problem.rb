# frozen_string_literal: true

require_relative "validation_problem_source"
require "json"

module Merge
  module Accounting
    class WarningValidationProblem
      attr_reader :source, :title, :detail, :problem_type, :additional_properties

      # @param source [Accounting::ValidationProblemSource]
      # @param title [String]
      # @param detail [String]
      # @param problem_type [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Accounting::WarningValidationProblem]
      def initialize(title:, detail:, problem_type:, source: nil, additional_properties: nil)
        # @type [Accounting::ValidationProblemSource]
        @source = source
        # @type [String]
        @title = title
        # @type [String]
        @detail = detail
        # @type [String]
        @problem_type = problem_type
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of WarningValidationProblem
      #
      # @param json_object [JSON]
      # @return [Accounting::WarningValidationProblem]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["source"].nil?
          source = nil
        else
          source = parsed_json["source"].to_json
          source = Accounting::ValidationProblemSource.from_json(json_object: source)
        end
        title = struct.title
        detail = struct.detail
        problem_type = struct.problem_type
        new(source: source, title: title, detail: detail, problem_type: problem_type, additional_properties: struct)
      end

      # Serialize an instance of WarningValidationProblem to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "source": @source, "title": @title, "detail": @detail, "problem_type": @problem_type }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.source.nil? || Accounting::ValidationProblemSource.validate_raw(obj: obj.source)
        obj.title.is_a?(String) != false || raise("Passed value for field obj.title is not the expected type, validation failed.")
        obj.detail.is_a?(String) != false || raise("Passed value for field obj.detail is not the expected type, validation failed.")
        obj.problem_type.is_a?(String) != false || raise("Passed value for field obj.problem_type is not the expected type, validation failed.")
      end
    end
  end
end
