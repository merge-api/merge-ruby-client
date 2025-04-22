# frozen_string_literal: true

require_relative "account_integration"
require "ostruct"
require "json"

module Merge
  module Crm
    class AccountToken
      # @return [String]
      attr_reader :account_token
      # @return [Merge::Crm::AccountIntegration]
      attr_reader :integration
      # @return [String]
      attr_reader :id
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param account_token [String]
      # @param integration [Merge::Crm::AccountIntegration]
      # @param id [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Crm::AccountToken]
      def initialize(account_token:, integration:, id:, additional_properties: nil)
        @account_token = account_token
        @integration = integration
        @id = id
        @additional_properties = additional_properties
        @_field_set = { "account_token": account_token, "integration": integration, "id": id }
      end

      # Deserialize a JSON object to an instance of AccountToken
      #
      # @param json_object [String]
      # @return [Merge::Crm::AccountToken]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        account_token = parsed_json["account_token"]
        if parsed_json["integration"].nil?
          integration = nil
        else
          integration = parsed_json["integration"].to_json
          integration = Merge::Crm::AccountIntegration.from_json(json_object: integration)
        end
        id = parsed_json["id"]
        new(
          account_token: account_token,
          integration: integration,
          id: id,
          additional_properties: struct
        )
      end

      # Serialize an instance of AccountToken to a JSON object
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
        obj.account_token.is_a?(String) != false || raise("Passed value for field obj.account_token is not the expected type, validation failed.")
        Merge::Crm::AccountIntegration.validate_raw(obj: obj.integration)
        obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
      end
    end
  end
end
