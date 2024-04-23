# frozen_string_literal: true

require "ostruct"
require "json"

module Merge
  module Filestorage
    class OperatorSchema
      # @return [String] The operator for which an operator schema is defined.
      attr_reader :operator
      # @return [Boolean] Whether the operator can be repeated multiple times.
      attr_reader :is_unique
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param operator [String] The operator for which an operator schema is defined.
      # @param is_unique [Boolean] Whether the operator can be repeated multiple times.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Filestorage::OperatorSchema]
      def initialize(operator: OMIT, is_unique: OMIT, additional_properties: nil)
        @operator = operator if operator != OMIT
        @is_unique = is_unique if is_unique != OMIT
        @additional_properties = additional_properties
        @_field_set = { "operator": operator, "is_unique": is_unique }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of OperatorSchema
      #
      # @param json_object [String]
      # @return [Merge::Filestorage::OperatorSchema]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        operator = struct["operator"]
        is_unique = struct["is_unique"]
        new(
          operator: operator,
          is_unique: is_unique,
          additional_properties: struct
        )
      end

      # Serialize an instance of OperatorSchema to a JSON object
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
        obj.operator&.is_a?(String) != false || raise("Passed value for field obj.operator is not the expected type, validation failed.")
        obj.is_unique&.is_a?(Boolean) != false || raise("Passed value for field obj.is_unique is not the expected type, validation failed.")
      end
    end
  end
end
