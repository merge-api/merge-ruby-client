# frozen_string_literal: true

require_relative "origin_type_enum"
require "ostruct"
require "json"

module Merge
  module Crm
    class ObjectClassDescriptionRequest
      # @return [String]
      attr_reader :id
      # @return [Merge::Crm::OriginTypeEnum]
      attr_reader :origin_type
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param id [String]
      # @param origin_type [Merge::Crm::OriginTypeEnum]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Crm::ObjectClassDescriptionRequest]
      def initialize(id:, origin_type:, additional_properties: nil)
        @id = id
        @origin_type = origin_type
        @additional_properties = additional_properties
        @_field_set = { "id": id, "origin_type": origin_type }
      end

      # Deserialize a JSON object to an instance of ObjectClassDescriptionRequest
      #
      # @param json_object [String]
      # @return [Merge::Crm::ObjectClassDescriptionRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = parsed_json["id"]
        origin_type = parsed_json["origin_type"]
        new(
          id: id,
          origin_type: origin_type,
          additional_properties: struct
        )
      end

      # Serialize an instance of ObjectClassDescriptionRequest to a JSON object
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
        obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.origin_type.is_a?(Merge::Crm::OriginTypeEnum) != false || raise("Passed value for field obj.origin_type is not the expected type, validation failed.")
      end
    end
  end
end
