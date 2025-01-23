# frozen_string_literal: true

require "ostruct"
require "json"

module Merge
  module Ats
    class FieldPermissionDeserializerRequest
      # @return [Array<Object>]
      attr_reader :enabled_fields
      # @return [Array<Object>]
      attr_reader :disabled_fields
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param enabled_fields [Array<Object>]
      # @param disabled_fields [Array<Object>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Ats::FieldPermissionDeserializerRequest]
      def initialize(enabled_fields: OMIT, disabled_fields: OMIT, additional_properties: nil)
        @enabled_fields = enabled_fields if enabled_fields != OMIT
        @disabled_fields = disabled_fields if disabled_fields != OMIT
        @additional_properties = additional_properties
        @_field_set = { "enabled_fields": enabled_fields, "disabled_fields": disabled_fields }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of FieldPermissionDeserializerRequest
      #
      # @param json_object [String]
      # @return [Merge::Ats::FieldPermissionDeserializerRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        enabled_fields = parsed_json["enabled_fields"]
        disabled_fields = parsed_json["disabled_fields"]
        new(
          enabled_fields: enabled_fields,
          disabled_fields: disabled_fields,
          additional_properties: struct
        )
      end

      # Serialize an instance of FieldPermissionDeserializerRequest to a JSON object
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
        obj.enabled_fields&.is_a?(Array) != false || raise("Passed value for field obj.enabled_fields is not the expected type, validation failed.")
        obj.disabled_fields&.is_a?(Array) != false || raise("Passed value for field obj.disabled_fields is not the expected type, validation failed.")
      end
    end
  end
end
