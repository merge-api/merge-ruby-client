# frozen_string_literal: true

require_relative "origin_type_enum"
require "json"

module Merge
  module Crm
    class ObjectClassDescriptionRequest
      attr_reader :id, :origin_type, :additional_properties

      # @param id [String]
      # @param origin_type [ORIGIN_TYPE_ENUM]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Crm::ObjectClassDescriptionRequest]
      def initialize(id:, origin_type:, additional_properties: nil)
        # @type [String]
        @id = id
        # @type [ORIGIN_TYPE_ENUM]
        @origin_type = origin_type
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of ObjectClassDescriptionRequest
      #
      # @param json_object [JSON]
      # @return [Crm::ObjectClassDescriptionRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = struct.id
        origin_type = Crm::ORIGIN_TYPE_ENUM.key(parsed_json["origin_type"]) || parsed_json["origin_type"]
        new(id: id, origin_type: origin_type, additional_properties: struct)
      end

      # Serialize an instance of ObjectClassDescriptionRequest to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "id": @id, "origin_type": Crm::ORIGIN_TYPE_ENUM[@origin_type] || @origin_type }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.origin_type.is_a?(Crm::ORIGIN_TYPE_ENUM) != false || raise("Passed value for field obj.origin_type is not the expected type, validation failed.")
      end
    end
  end
end
