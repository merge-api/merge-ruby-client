# frozen_string_literal: true

require "json"

module Merge
  module Hris
    class OperatorSchema
      attr_reader :operator, :is_unique, :additional_properties

      # @param operator [String] The operator for which an operator schema is defined.
      # @param is_unique [Boolean] Whether the operator can be repeated multiple times.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Hris::OperatorSchema]
      def initialize(operator: nil, is_unique: nil, additional_properties: nil)
        # @type [String] The operator for which an operator schema is defined.
        @operator = operator
        # @type [Boolean] Whether the operator can be repeated multiple times.
        @is_unique = is_unique
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of OperatorSchema
      #
      # @param json_object [JSON]
      # @return [Hris::OperatorSchema]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        operator = struct.operator
        is_unique = struct.is_unique
        new(operator: operator, is_unique: is_unique, additional_properties: struct)
      end

      # Serialize an instance of OperatorSchema to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "operator": @operator, "is_unique": @is_unique }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.operator&.is_a?(String) != false || raise("Passed value for field obj.operator is not the expected type, validation failed.")
        obj.is_unique&.is_a?(Boolean) != false || raise("Passed value for field obj.is_unique is not the expected type, validation failed.")
      end
    end
  end
end
