# frozen_string_literal: true

require_relative "linked_account_condition"
require "json"

module Merge
  module Filestorage
    class LinkedAccountSelectiveSyncConfiguration
      attr_reader :linked_account_conditions, :additional_properties

      # @param linked_account_conditions [Array<Filestorage::LinkedAccountCondition>] The conditions belonging to a selective sync.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Filestorage::LinkedAccountSelectiveSyncConfiguration]
      def initialize(linked_account_conditions: nil, additional_properties: nil)
        # @type [Array<Filestorage::LinkedAccountCondition>] The conditions belonging to a selective sync.
        @linked_account_conditions = linked_account_conditions
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of LinkedAccountSelectiveSyncConfiguration
      #
      # @param json_object [JSON]
      # @return [Filestorage::LinkedAccountSelectiveSyncConfiguration]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        linked_account_conditions = parsed_json["linked_account_conditions"]&.map do |v|
          v = v.to_json
          Filestorage::LinkedAccountCondition.from_json(json_object: v)
        end
        new(linked_account_conditions: linked_account_conditions, additional_properties: struct)
      end

      # Serialize an instance of LinkedAccountSelectiveSyncConfiguration to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "linked_account_conditions": @linked_account_conditions }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.linked_account_conditions&.is_a?(Array) != false || raise("Passed value for field obj.linked_account_conditions is not the expected type, validation failed.")
      end
    end
  end
end
