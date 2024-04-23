# frozen_string_literal: true

require "ostruct"
require "json"

module Merge
  module Filestorage
    class ValidationProblemSource
      # @return [String]
      attr_reader :pointer
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param pointer [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Filestorage::ValidationProblemSource]
      def initialize(pointer:, additional_properties: nil)
        @pointer = pointer
        @additional_properties = additional_properties
        @_field_set = { "pointer": pointer }
      end

      # Deserialize a JSON object to an instance of ValidationProblemSource
      #
      # @param json_object [String]
      # @return [Merge::Filestorage::ValidationProblemSource]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        pointer = struct["pointer"]
        new(pointer: pointer, additional_properties: struct)
      end

      # Serialize an instance of ValidationProblemSource to a JSON object
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
        obj.pointer.is_a?(String) != false || raise("Passed value for field obj.pointer is not the expected type, validation failed.")
      end
    end
  end
end
