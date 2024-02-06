# frozen_string_literal: true

require "json"

module Merge
  module Accounting
    class LinkedAccountCondition
      attr_reader :condition_schema_id, :common_model, :native_name, :operator, :value, :field_name,
                  :additional_properties

      # @param condition_schema_id [String] The ID indicating which condition schema to use for a specific condition.
      # @param common_model [String] The common model for a specific condition.
      # @param native_name [String] User-facing _native condition_ name. e.g. "Skip Manager".
      # @param operator [String] The operator for a specific condition.
      # @param value [Object]
      # @param field_name [String] The name of the field on the common model that this condition corresponds to, if they conceptually match. e.g. "location_type".
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Accounting::LinkedAccountCondition]
      def initialize(condition_schema_id:, operator:, common_model: nil, native_name: nil, value: nil, field_name: nil,
                     additional_properties: nil)
        # @type [String] The ID indicating which condition schema to use for a specific condition.
        @condition_schema_id = condition_schema_id
        # @type [String] The common model for a specific condition.
        @common_model = common_model
        # @type [String] User-facing _native condition_ name. e.g. "Skip Manager".
        @native_name = native_name
        # @type [String] The operator for a specific condition.
        @operator = operator
        # @type [Object]
        @value = value
        # @type [String] The name of the field on the common model that this condition corresponds to, if they conceptually match. e.g. "location_type".
        @field_name = field_name
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of LinkedAccountCondition
      #
      # @param json_object [JSON]
      # @return [Accounting::LinkedAccountCondition]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        condition_schema_id = struct.condition_schema_id
        common_model = struct.common_model
        native_name = struct.native_name
        operator = struct.operator
        value = struct.value
        field_name = struct.field_name
        new(condition_schema_id: condition_schema_id, common_model: common_model, native_name: native_name,
            operator: operator, value: value, field_name: field_name, additional_properties: struct)
      end

      # Serialize an instance of LinkedAccountCondition to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "condition_schema_id": @condition_schema_id,
          "common_model": @common_model,
          "native_name": @native_name,
          "operator": @operator,
          "value": @value,
          "field_name": @field_name
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
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
