# frozen_string_literal: true

require_relative "account_integration"
require "json"

module Merge
  module Crm
    class AccountToken
      attr_reader :account_token, :integration, :additional_properties

      # @param account_token [String]
      # @param integration [Crm::AccountIntegration]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Crm::AccountToken]
      def initialize(account_token:, integration:, additional_properties: nil)
        # @type [String]
        @account_token = account_token
        # @type [Crm::AccountIntegration]
        @integration = integration
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of AccountToken
      #
      # @param json_object [JSON]
      # @return [Crm::AccountToken]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        account_token = struct.account_token
        if parsed_json["integration"].nil?
          integration = nil
        else
          integration = parsed_json["integration"].to_json
          integration = Crm::AccountIntegration.from_json(json_object: integration)
        end
        new(account_token: account_token, integration: integration, additional_properties: struct)
      end

      # Serialize an instance of AccountToken to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "account_token": @account_token, "integration": @integration }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.account_token.is_a?(String) != false || raise("Passed value for field obj.account_token is not the expected type, validation failed.")
        Crm::AccountIntegration.validate_raw(obj: obj.integration)
      end
    end
  end
end
