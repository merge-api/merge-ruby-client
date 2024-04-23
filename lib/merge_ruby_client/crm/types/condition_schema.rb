# frozen_string_literal: true

require_relative "condition_type_enum"
require_relative "operator_schema"
require "ostruct"
require "json"

module Merge
  module Crm
    class ConditionSchema
      # @return [String] The ID of the condition schema. This ID is used when updating selective syncs
      #  for a linked account.
      attr_reader :id
      # @return [String] The common model for which a condition schema is defined.
      attr_reader :common_model
      # @return [String]
      attr_reader :native_name
      # @return [String]
      attr_reader :field_name
      # @return [Boolean] Whether this condition can only be applied once. If false, the condition can be
      #  AND'd together multiple times.
      attr_reader :is_unique
      # @return [Merge::Crm::ConditionTypeEnum] The type of value(s) that can be set for this condition.
      #  - `BOOLEAN` - BOOLEAN
      #  - `DATE` - DATE
      #  - `DATE_TIME` - DATE_TIME
      #  - `INTEGER` - INTEGER
      #  - `FLOAT` - FLOAT
      #  - `STRING` - STRING
      #  - `LIST_OF_STRINGS` - LIST_OF_STRINGS
      attr_reader :condition_type
      # @return [Array<Merge::Crm::OperatorSchema>] The schemas for the operators that can be used on a condition.
      attr_reader :operators
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param id [String] The ID of the condition schema. This ID is used when updating selective syncs
      #  for a linked account.
      # @param common_model [String] The common model for which a condition schema is defined.
      # @param native_name [String]
      # @param field_name [String]
      # @param is_unique [Boolean] Whether this condition can only be applied once. If false, the condition can be
      #  AND'd together multiple times.
      # @param condition_type [Merge::Crm::ConditionTypeEnum] The type of value(s) that can be set for this condition.
      #  - `BOOLEAN` - BOOLEAN
      #  - `DATE` - DATE
      #  - `DATE_TIME` - DATE_TIME
      #  - `INTEGER` - INTEGER
      #  - `FLOAT` - FLOAT
      #  - `STRING` - STRING
      #  - `LIST_OF_STRINGS` - LIST_OF_STRINGS
      # @param operators [Array<Merge::Crm::OperatorSchema>] The schemas for the operators that can be used on a condition.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Crm::ConditionSchema]
      def initialize(id:, condition_type:, operators:, common_model: OMIT, native_name: OMIT, field_name: OMIT,
                     is_unique: OMIT, additional_properties: nil)
        @id = id
        @common_model = common_model if common_model != OMIT
        @native_name = native_name if native_name != OMIT
        @field_name = field_name if field_name != OMIT
        @is_unique = is_unique if is_unique != OMIT
        @condition_type = condition_type
        @operators = operators
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "common_model": common_model,
          "native_name": native_name,
          "field_name": field_name,
          "is_unique": is_unique,
          "condition_type": condition_type,
          "operators": operators
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of ConditionSchema
      #
      # @param json_object [String]
      # @return [Merge::Crm::ConditionSchema]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = struct["id"]
        common_model = struct["common_model"]
        native_name = struct["native_name"]
        field_name = struct["field_name"]
        is_unique = struct["is_unique"]
        condition_type = struct["condition_type"]
        operators = parsed_json["operators"]&.map do |v|
          v = v.to_json
          Merge::Crm::OperatorSchema.from_json(json_object: v)
        end
        new(
          id: id,
          common_model: common_model,
          native_name: native_name,
          field_name: field_name,
          is_unique: is_unique,
          condition_type: condition_type,
          operators: operators,
          additional_properties: struct
        )
      end

      # Serialize an instance of ConditionSchema to a JSON object
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
        obj.common_model&.is_a?(String) != false || raise("Passed value for field obj.common_model is not the expected type, validation failed.")
        obj.native_name&.is_a?(String) != false || raise("Passed value for field obj.native_name is not the expected type, validation failed.")
        obj.field_name&.is_a?(String) != false || raise("Passed value for field obj.field_name is not the expected type, validation failed.")
        obj.is_unique&.is_a?(Boolean) != false || raise("Passed value for field obj.is_unique is not the expected type, validation failed.")
        obj.condition_type.is_a?(Merge::Crm::ConditionTypeEnum) != false || raise("Passed value for field obj.condition_type is not the expected type, validation failed.")
        obj.operators.is_a?(Array) != false || raise("Passed value for field obj.operators is not the expected type, validation failed.")
      end
    end
  end
end
