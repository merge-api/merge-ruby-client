# frozen_string_literal: true

require_relative "linked_account_condition_request"
require "ostruct"
require "json"

module Merge
  module Crm
    class LinkedAccountSelectiveSyncConfigurationRequest
      # @return [Array<Merge::Crm::LinkedAccountConditionRequest>] The conditions belonging to a selective sync.
      attr_reader :linked_account_conditions
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param linked_account_conditions [Array<Merge::Crm::LinkedAccountConditionRequest>] The conditions belonging to a selective sync.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Crm::LinkedAccountSelectiveSyncConfigurationRequest]
      def initialize(linked_account_conditions:, additional_properties: nil)
        @linked_account_conditions = linked_account_conditions
        @additional_properties = additional_properties
        @_field_set = { "linked_account_conditions": linked_account_conditions }
      end

      # Deserialize a JSON object to an instance of
      #  LinkedAccountSelectiveSyncConfigurationRequest
      #
      # @param json_object [String]
      # @return [Merge::Crm::LinkedAccountSelectiveSyncConfigurationRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        linked_account_conditions = parsed_json["linked_account_conditions"]&.map do |v|
          v = v.to_json
          Merge::Crm::LinkedAccountConditionRequest.from_json(json_object: v)
        end
        new(linked_account_conditions: linked_account_conditions, additional_properties: struct)
      end

      # Serialize an instance of LinkedAccountSelectiveSyncConfigurationRequest to a
      #  JSON object
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
        obj.linked_account_conditions.is_a?(Array) != false || raise("Passed value for field obj.linked_account_conditions is not the expected type, validation failed.")
      end
    end
  end
end
