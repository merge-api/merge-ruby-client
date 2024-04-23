# frozen_string_literal: true

require "ostruct"
require "json"

module Merge
  module Accounting
    class LinkedAccountCondition
      # @return [String] The ID indicating which condition schema to use for a specific condition.
      attr_reader :condition_schema_id
      # @return [String] The common model for a specific condition.
      attr_reader :common_model
      # @return [String]
      attr_reader :native_name
      # @return [String] The operator for a specific condition.
      attr_reader :operator
      # @return [Object]
      attr_reader :value
      # @return [String]
      attr_reader :field_name
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param condition_schema_id [String] The ID indicating which condition schema to use for a specific condition.
      # @param common_model [String] The common model for a specific condition.
      # @param native_name [String]
      # @param operator [String] The operator for a specific condition.
      # @param value [Object]
      # @param field_name [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Accounting::LinkedAccountCondition]
      def initialize(condition_schema_id:, operator:, common_model: OMIT, native_name: OMIT, value: OMIT,
                     field_name: OMIT, additional_properties: nil)
        @condition_schema_id = condition_schema_id
        @common_model = common_model if common_model != OMIT
        @native_name = native_name if native_name != OMIT
        @operator = operator
        @value = value if value != OMIT
        @field_name = field_name if field_name != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "condition_schema_id": condition_schema_id,
          "common_model": common_model,
          "native_name": native_name,
          "operator": operator,
          "value": value,
          "field_name": field_name
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of LinkedAccountCondition
      #
      # @param json_object [String]
      # @return [Merge::Accounting::LinkedAccountCondition]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        condition_schema_id = struct["condition_schema_id"]
        common_model = struct["common_model"]
        native_name = struct["native_name"]
        operator = struct["operator"]
        value = struct["value"]
        field_name = struct["field_name"]
        new(
          condition_schema_id: condition_schema_id,
          common_model: common_model,
          native_name: native_name,
          operator: operator,
          value: value,
          field_name: field_name,
          additional_properties: struct
        )
      end

      # Serialize an instance of LinkedAccountCondition to a JSON object
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
        obj.condition_schema_id.is_a?(String) != false || raise("Passed value for field obj.condition_schema_id is not the expected type, validation failed.")
        obj.common_model&.is_a?(String) != false || raise("Passed value for field obj.common_model is not the expected type, validation failed.")
        obj.native_name&.is_a?(String) != false || raise("Passed value for field obj.native_name is not the expected type, validation failed.")
        obj.operator.is_a?(String) != false || raise("Passed value for field obj.operator is not the expected type, validation failed.")
        obj.value&.is_a?(Object) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
        obj.field_name&.is_a?(String) != false || raise("Passed value for field obj.field_name is not the expected type, validation failed.")
      end
    end
  end
end
