# frozen_string_literal: true

require "ostruct"
require "json"

module Merge
  module Filestorage
    class ExternalTargetFieldApi
      # @return [String]
      attr_reader :name
      # @return [String]
      attr_reader :description
      # @return [String]
      attr_reader :is_mapped
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param name [String]
      # @param description [String]
      # @param is_mapped [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Filestorage::ExternalTargetFieldApi]
      def initialize(name: OMIT, description: OMIT, is_mapped: OMIT, additional_properties: nil)
        @name = name if name != OMIT
        @description = description if description != OMIT
        @is_mapped = is_mapped if is_mapped != OMIT
        @additional_properties = additional_properties
        @_field_set = { "name": name, "description": description, "is_mapped": is_mapped }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of ExternalTargetFieldApi
      #
      # @param json_object [String]
      # @return [Merge::Filestorage::ExternalTargetFieldApi]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        name = struct["name"]
        description = struct["description"]
        is_mapped = struct["is_mapped"]
        new(
          name: name,
          description: description,
          is_mapped: is_mapped,
          additional_properties: struct
        )
      end

      # Serialize an instance of ExternalTargetFieldApi to a JSON object
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
        obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
        obj.is_mapped&.is_a?(String) != false || raise("Passed value for field obj.is_mapped is not the expected type, validation failed.")
      end
    end
  end
end
