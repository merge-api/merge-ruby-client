# frozen_string_literal: true

require "ostruct"
require "json"

module Merge
  module Ticketing
    class FieldPermissionDeserializer
      # @return [Array<Object>]
      attr_reader :enabled
      # @return [Array<Object>]
      attr_reader :disabled
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param enabled [Array<Object>]
      # @param disabled [Array<Object>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Ticketing::FieldPermissionDeserializer]
      def initialize(enabled: OMIT, disabled: OMIT, additional_properties: nil)
        @enabled = enabled if enabled != OMIT
        @disabled = disabled if disabled != OMIT
        @additional_properties = additional_properties
        @_field_set = { "enabled": enabled, "disabled": disabled }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of FieldPermissionDeserializer
      #
      # @param json_object [String]
      # @return [Merge::Ticketing::FieldPermissionDeserializer]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        enabled = struct["enabled"]
        disabled = struct["disabled"]
        new(
          enabled: enabled,
          disabled: disabled,
          additional_properties: struct
        )
      end

      # Serialize an instance of FieldPermissionDeserializer to a JSON object
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
        obj.enabled&.is_a?(Array) != false || raise("Passed value for field obj.enabled is not the expected type, validation failed.")
        obj.disabled&.is_a?(Array) != false || raise("Passed value for field obj.disabled is not the expected type, validation failed.")
      end
    end
  end
end
