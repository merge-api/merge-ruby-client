# frozen_string_literal: true

require "ostruct"
require "json"

module Merge
  module Filestorage
    class LinkedAccountConditionRequest
      # @return [String] The ID indicating which Linked Account Condition this is.
      attr_reader :id
      # @return [String] The ID indicating which condition schema to use for a specific condition.
      attr_reader :condition_schema_id
      # @return [String] The operator for a specific condition.
      attr_reader :operator
      # @return [Object]
      attr_reader :value
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param id [String] The ID indicating which Linked Account Condition this is.
      # @param condition_schema_id [String] The ID indicating which condition schema to use for a specific condition.
      # @param operator [String] The operator for a specific condition.
      # @param value [Object]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Filestorage::LinkedAccountConditionRequest]
      def initialize(condition_schema_id:, operator:, value:, id: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @condition_schema_id = condition_schema_id
        @operator = operator
        @value = value
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "condition_schema_id": condition_schema_id,
          "operator": operator,
          "value": value
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of LinkedAccountConditionRequest
      #
      # @param json_object [String]
      # @return [Merge::Filestorage::LinkedAccountConditionRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        id = struct["id"]
        condition_schema_id = struct["condition_schema_id"]
        operator = struct["operator"]
        value = struct["value"]
        new(
          id: id,
          condition_schema_id: condition_schema_id,
          operator: operator,
          value: value,
          additional_properties: struct
        )
      end

      # Serialize an instance of LinkedAccountConditionRequest to a JSON object
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
        obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.condition_schema_id.is_a?(String) != false || raise("Passed value for field obj.condition_schema_id is not the expected type, validation failed.")
        obj.operator.is_a?(String) != false || raise("Passed value for field obj.operator is not the expected type, validation failed.")
        obj.value.is_a?(Object) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
      end
    end
  end
end
