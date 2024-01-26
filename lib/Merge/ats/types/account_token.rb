# frozen_string_literal: true

require_relative "account_integration"
require "json"

module Merge
  module Ats
    class AccountToken
      attr_reader :account_token, :integration, :additional_properties

      # @param account_token [String]
      # @param integration [Ats::AccountIntegration]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Ats::AccountToken]
      def initialize(account_token:, integration:, additional_properties: nil)
        # @type [String]
        @account_token = account_token
        # @type [Ats::AccountIntegration]
        @integration = integration
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of AccountToken
      #
      # @param json_object [JSON]
      # @return [Ats::AccountToken]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        account_token = struct.account_token
        integration = struct.integration.to_h.to_json
        integration = Ats::AccountIntegration.from_json(json_object: integration)
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
        Ats::AccountIntegration.validate_raw(obj: obj.integration)
      end
    end
  end
end
