# frozen_string_literal: true

require_relative "account_integration"
require_relative "model_operation"
require "ostruct"
require "json"

module Merge
  module Crm
    # # The AvailableActions Object
    #  ### Description
    #  The `Activity` object is used to see all available model/operation combinations
    #  for an integration.
    #  ### Usage Example
    #  Fetch all the actions available for the `Zenefits` integration.
    class AvailableActions
      # @return [Merge::Crm::AccountIntegration]
      attr_reader :integration
      # @return [Boolean]
      attr_reader :passthrough_available
      # @return [Array<Merge::Crm::ModelOperation>]
      attr_reader :available_model_operations
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param integration [Merge::Crm::AccountIntegration]
      # @param passthrough_available [Boolean]
      # @param available_model_operations [Array<Merge::Crm::ModelOperation>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Crm::AvailableActions]
      def initialize(integration:, passthrough_available:, available_model_operations: OMIT, additional_properties: nil)
        @integration = integration
        @passthrough_available = passthrough_available
        @available_model_operations = available_model_operations if available_model_operations != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "integration": integration,
          "passthrough_available": passthrough_available,
          "available_model_operations": available_model_operations
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of AvailableActions
      #
      # @param json_object [String]
      # @return [Merge::Crm::AvailableActions]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["integration"].nil?
          integration = nil
        else
          integration = parsed_json["integration"].to_json
          integration = Merge::Crm::AccountIntegration.from_json(json_object: integration)
        end
        passthrough_available = parsed_json["passthrough_available"]
        available_model_operations = parsed_json["available_model_operations"]&.map do |item|
          item = item.to_json
          Merge::Crm::ModelOperation.from_json(json_object: item)
        end
        new(
          integration: integration,
          passthrough_available: passthrough_available,
          available_model_operations: available_model_operations,
          additional_properties: struct
        )
      end

      # Serialize an instance of AvailableActions to a JSON object
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
        Merge::Crm::AccountIntegration.validate_raw(obj: obj.integration)
        obj.passthrough_available.is_a?(Boolean) != false || raise("Passed value for field obj.passthrough_available is not the expected type, validation failed.")
        obj.available_model_operations&.is_a?(Array) != false || raise("Passed value for field obj.available_model_operations is not the expected type, validation failed.")
      end
    end
  end
end
