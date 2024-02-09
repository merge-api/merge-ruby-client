# frozen_string_literal: true

require_relative "condition_type_enum"
require_relative "operator_schema"
require "json"

module Merge
  module Hris
    class ConditionSchema
      attr_reader :id, :common_model, :native_name, :field_name, :is_unique, :condition_type, :operators,
                  :additional_properties

      # @param id [String] The ID of the condition schema. This ID is used when updating selective syncs for a linked account.
      # @param common_model [String] The common model for which a condition schema is defined.
      # @param native_name [String] User-facing _native condition_ name. e.g. "Skip Manager".
      # @param field_name [String] The name of the field on the common model that this condition corresponds to, if they conceptually match. e.g. "location_type".
      # @param is_unique [Boolean] Whether this condition can only be applied once. If false, the condition can be AND'd together multiple times.
      # @param condition_type [CONDITION_TYPE_ENUM] The type of value(s) that can be set for this condition.
      #   - `BOOLEAN` - BOOLEAN
      #   - `DATE` - DATE
      #   - `DATE_TIME` - DATE_TIME
      #   - `INTEGER` - INTEGER
      #   - `FLOAT` - FLOAT
      #   - `STRING` - STRING
      #   - `LIST_OF_STRINGS` - LIST_OF_STRINGS
      # @param operators [Array<Hris::OperatorSchema>] The schemas for the operators that can be used on a condition.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Hris::ConditionSchema]
      def initialize(id:, condition_type:, operators:, common_model: nil, native_name: nil, field_name: nil,
                     is_unique: nil, additional_properties: nil)
        # @type [String] The ID of the condition schema. This ID is used when updating selective syncs for a linked account.
        @id = id
        # @type [String] The common model for which a condition schema is defined.
        @common_model = common_model
        # @type [String] User-facing _native condition_ name. e.g. "Skip Manager".
        @native_name = native_name
        # @type [String] The name of the field on the common model that this condition corresponds to, if they conceptually match. e.g. "location_type".
        @field_name = field_name
        # @type [Boolean] Whether this condition can only be applied once. If false, the condition can be AND'd together multiple times.
        @is_unique = is_unique
        # @type [CONDITION_TYPE_ENUM] The type of value(s) that can be set for this condition.
        #   - `BOOLEAN` - BOOLEAN
        #   - `DATE` - DATE
        #   - `DATE_TIME` - DATE_TIME
        #   - `INTEGER` - INTEGER
        #   - `FLOAT` - FLOAT
        #   - `STRING` - STRING
        #   - `LIST_OF_STRINGS` - LIST_OF_STRINGS
        @condition_type = condition_type
        # @type [Array<Hris::OperatorSchema>] The schemas for the operators that can be used on a condition.
        @operators = operators
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of ConditionSchema
      #
      # @param json_object [JSON]
      # @return [Hris::ConditionSchema]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = struct.id
        common_model = struct.common_model
        native_name = struct.native_name
        field_name = struct.field_name
        is_unique = struct.is_unique
        condition_type = Hris::CONDITION_TYPE_ENUM.key(parsed_json["condition_type"]) || parsed_json["condition_type"]
        operators = parsed_json["operators"]&.map do |v|
          v = v.to_json
          Hris::OperatorSchema.from_json(json_object: v)
        end
        new(id: id, common_model: common_model, native_name: native_name, field_name: field_name, is_unique: is_unique,
            condition_type: condition_type, operators: operators, additional_properties: struct)
      end

      # Serialize an instance of ConditionSchema to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "id": @id,
          "common_model": @common_model,
          "native_name": @native_name,
          "field_name": @field_name,
          "is_unique": @is_unique,
          "condition_type": Hris::CONDITION_TYPE_ENUM[@condition_type] || @condition_type,
          "operators": @operators
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.common_model&.is_a?(String) != false || raise("Passed value for field obj.common_model is not the expected type, validation failed.")
        obj.native_name&.is_a?(String) != false || raise("Passed value for field obj.native_name is not the expected type, validation failed.")
        obj.field_name&.is_a?(String) != false || raise("Passed value for field obj.field_name is not the expected type, validation failed.")
        obj.is_unique&.is_a?(Boolean) != false || raise("Passed value for field obj.is_unique is not the expected type, validation failed.")
        obj.condition_type.is_a?(Hris::CONDITION_TYPE_ENUM) != false || raise("Passed value for field obj.condition_type is not the expected type, validation failed.")
        obj.operators.is_a?(Array) != false || raise("Passed value for field obj.operators is not the expected type, validation failed.")
      end
    end
  end
end
