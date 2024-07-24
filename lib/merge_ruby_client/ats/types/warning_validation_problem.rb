# frozen_string_literal: true

require_relative "validation_problem_source"
require "ostruct"
require "json"

module Merge
  module Ats
    class WarningValidationProblem
      # @return [Merge::Ats::ValidationProblemSource]
      attr_reader :source
      # @return [String]
      attr_reader :title
      # @return [String]
      attr_reader :detail
      # @return [String]
      attr_reader :problem_type
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param source [Merge::Ats::ValidationProblemSource]
      # @param title [String]
      # @param detail [String]
      # @param problem_type [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Ats::WarningValidationProblem]
      def initialize(title:, detail:, problem_type:, source: OMIT, additional_properties: nil)
        @source = source if source != OMIT
        @title = title
        @detail = detail
        @problem_type = problem_type
        @additional_properties = additional_properties
        @_field_set = {
          "source": source,
          "title": title,
          "detail": detail,
          "problem_type": problem_type
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of WarningValidationProblem
      #
      # @param json_object [String]
      # @return [Merge::Ats::WarningValidationProblem]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["source"].nil?
          source = nil
        else
          source = parsed_json["source"].to_json
          source = Merge::Ats::ValidationProblemSource.from_json(json_object: source)
        end
        title = parsed_json["title"]
        detail = parsed_json["detail"]
        problem_type = parsed_json["problem_type"]
        new(
          source: source,
          title: title,
          detail: detail,
          problem_type: problem_type,
          additional_properties: struct
        )
      end

      # Serialize an instance of WarningValidationProblem to a JSON object
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
        obj.source.nil? || Merge::Ats::ValidationProblemSource.validate_raw(obj: obj.source)
        obj.title.is_a?(String) != false || raise("Passed value for field obj.title is not the expected type, validation failed.")
        obj.detail.is_a?(String) != false || raise("Passed value for field obj.detail is not the expected type, validation failed.")
        obj.problem_type.is_a?(String) != false || raise("Passed value for field obj.problem_type is not the expected type, validation failed.")
      end
    end
  end
end
