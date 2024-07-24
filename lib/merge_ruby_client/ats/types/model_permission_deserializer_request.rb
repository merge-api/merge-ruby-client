# frozen_string_literal: true

require "ostruct"
require "json"

module Merge
  module Ats
    class ModelPermissionDeserializerRequest
      # @return [Boolean]
      attr_reader :is_enabled
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param is_enabled [Boolean]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Ats::ModelPermissionDeserializerRequest]
      def initialize(is_enabled: OMIT, additional_properties: nil)
        @is_enabled = is_enabled if is_enabled != OMIT
        @additional_properties = additional_properties
        @_field_set = { "is_enabled": is_enabled }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of ModelPermissionDeserializerRequest
      #
      # @param json_object [String]
      # @return [Merge::Ats::ModelPermissionDeserializerRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        is_enabled = parsed_json["is_enabled"]
        new(is_enabled: is_enabled, additional_properties: struct)
      end

      # Serialize an instance of ModelPermissionDeserializerRequest to a JSON object
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
        obj.is_enabled&.is_a?(Boolean) != false || raise("Passed value for field obj.is_enabled is not the expected type, validation failed.")
      end
    end
  end
end
