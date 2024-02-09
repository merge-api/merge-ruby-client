# frozen_string_literal: true

require_relative "account_integration"
require_relative "model_operation"
require "json"

module Merge
  module Accounting
    # # The AvailableActions Object
    #
    # ### Description
    #
    # The `Activity` object is used to see all available model/operation combinations for an integration.
    #
    # ### Usage Example
    #
    # Fetch all the actions available for the `Zenefits` integration.
    class AvailableActions
      attr_reader :integration, :passthrough_available, :available_model_operations, :additional_properties

      # @param integration [Accounting::AccountIntegration]
      # @param passthrough_available [Boolean]
      # @param available_model_operations [Array<Accounting::ModelOperation>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Accounting::AvailableActions]
      def initialize(integration:, passthrough_available:, available_model_operations: nil, additional_properties: nil)
        # @type [Accounting::AccountIntegration]
        @integration = integration
        # @type [Boolean]
        @passthrough_available = passthrough_available
        # @type [Array<Accounting::ModelOperation>]
        @available_model_operations = available_model_operations
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of AvailableActions
      #
      # @param json_object [JSON]
      # @return [Accounting::AvailableActions]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["integration"].nil?
          integration = nil
        else
          integration = parsed_json["integration"].to_json
          integration = Accounting::AccountIntegration.from_json(json_object: integration)
        end
        passthrough_available = struct.passthrough_available
        available_model_operations = parsed_json["available_model_operations"]&.map do |v|
          v = v.to_json
          Accounting::ModelOperation.from_json(json_object: v)
        end
        new(integration: integration, passthrough_available: passthrough_available,
            available_model_operations: available_model_operations, additional_properties: struct)
      end

      # Serialize an instance of AvailableActions to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "integration": @integration,
          "passthrough_available": @passthrough_available,
          "available_model_operations": @available_model_operations
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        Accounting::AccountIntegration.validate_raw(obj: obj.integration)
        obj.passthrough_available.is_a?(Boolean) != false || raise("Passed value for field obj.passthrough_available is not the expected type, validation failed.")
        obj.available_model_operations&.is_a?(Array) != false || raise("Passed value for field obj.available_model_operations is not the expected type, validation failed.")
      end
    end
  end
end
