# frozen_string_literal: true

require "ostruct"
require "json"

module Merge
  module Ats
    class FieldMappingApiInstanceTargetField
      # @return [String]
      attr_reader :name
      # @return [String]
      attr_reader :description
      # @return [Boolean]
      attr_reader :is_organization_wide
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param name [String]
      # @param description [String]
      # @param is_organization_wide [Boolean]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Ats::FieldMappingApiInstanceTargetField]
      def initialize(name:, description:, is_organization_wide:, additional_properties: nil)
        @name = name
        @description = description
        @is_organization_wide = is_organization_wide
        @additional_properties = additional_properties
        @_field_set = { "name": name, "description": description, "is_organization_wide": is_organization_wide }
      end

      # Deserialize a JSON object to an instance of FieldMappingApiInstanceTargetField
      #
      # @param json_object [String]
      # @return [Merge::Ats::FieldMappingApiInstanceTargetField]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        name = parsed_json["name"]
        description = parsed_json["description"]
        is_organization_wide = parsed_json["is_organization_wide"]
        new(
          name: name,
          description: description,
          is_organization_wide: is_organization_wide,
          additional_properties: struct
        )
      end

      # Serialize an instance of FieldMappingApiInstanceTargetField to a JSON object
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
        obj.name.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.description.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
        obj.is_organization_wide.is_a?(Boolean) != false || raise("Passed value for field obj.is_organization_wide is not the expected type, validation failed.")
      end
    end
  end
end
