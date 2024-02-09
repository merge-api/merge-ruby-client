# frozen_string_literal: true

require "json"

module Merge
  module Hris
    class ValidationProblemSource
      attr_reader :pointer, :additional_properties

      # @param pointer [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Hris::ValidationProblemSource]
      def initialize(pointer:, additional_properties: nil)
        # @type [String]
        @pointer = pointer
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of ValidationProblemSource
      #
      # @param json_object [JSON]
      # @return [Hris::ValidationProblemSource]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        pointer = struct.pointer
        new(pointer: pointer, additional_properties: struct)
      end

      # Serialize an instance of ValidationProblemSource to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "pointer": @pointer }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.pointer.is_a?(String) != false || raise("Passed value for field obj.pointer is not the expected type, validation failed.")
      end
    end
  end
end
