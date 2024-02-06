# frozen_string_literal: true

require "json"

module Merge
  module Filestorage
    class LinkedAccountConditionRequest
      attr_reader :condition_schema_id, :operator, :value, :additional_properties

      # @param condition_schema_id [String] The ID indicating which condition schema to use for a specific condition.
      # @param operator [String] The operator for a specific condition.
      # @param value [Object]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Filestorage::LinkedAccountConditionRequest]
      def initialize(condition_schema_id:, operator:, value:, additional_properties: nil)
        # @type [String] The ID indicating which condition schema to use for a specific condition.
        @condition_schema_id = condition_schema_id
        # @type [String] The operator for a specific condition.
        @operator = operator
        # @type [Object]
        @value = value
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of LinkedAccountConditionRequest
      #
      # @param json_object [JSON]
      # @return [Filestorage::LinkedAccountConditionRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        condition_schema_id = struct.condition_schema_id
        operator = struct.operator
        value = struct.value
        new(condition_schema_id: condition_schema_id, operator: operator, value: value, additional_properties: struct)
      end

      # Serialize an instance of LinkedAccountConditionRequest to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "condition_schema_id": @condition_schema_id, "operator": @operator, "value": @value }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.condition_schema_id.is_a?(String) != false || raise("Passed value for field obj.condition_schema_id is not the expected type, validation failed.")
        obj.operator.is_a?(String) != false || raise("Passed value for field obj.operator is not the expected type, validation failed.")
        obj.value.is_a?(Object) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
      end
    end
  end
end
