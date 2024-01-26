# frozen_string_literal: true
require "json"

module Merge
  module Crm
    # # The EmailAddress Object 
### Description

The `EmailAddress` object is used to represent an entity's email address.

### Usage Example

Fetch from the `GET Contact` endpoint and view their email addresses.
    class EmailAddressRequest
      attr_reader :email_address, :email_address_type, :integration_params, :linked_account_params, :additional_properties
      # @param email_address [String] The email address.
      # @param email_address_type [String] The email address's type.
      # @param integration_params [Hash{String => String}] 
      # @param linked_account_params [Hash{String => String}] 
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Crm::EmailAddressRequest]
      def initialize(email_address: nil, email_address_type: nil, integration_params: nil, linked_account_params: nil, additional_properties: nil)
        # @type [String] The email address.
        @email_address = email_address
        # @type [String] The email address's type.
        @email_address_type = email_address_type
        # @type [Hash{String => String}] 
        @integration_params = integration_params
        # @type [Hash{String => String}] 
        @linked_account_params = linked_account_params
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end
      # Deserialize a JSON object to an instance of EmailAddressRequest
      #
      # @param json_object [JSON] 
      # @return [Crm::EmailAddressRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        email_address = struct.email_address
        email_address_type = struct.email_address_type
        integration_params = struct.integration_params
        linked_account_params = struct.linked_account_params
        new(email_address: email_address, email_address_type: email_address_type, integration_params: integration_params, linked_account_params: linked_account_params, additional_properties: struct)
      end
      # Serialize an instance of EmailAddressRequest to a JSON object
      #
      # @return [JSON]
      def to_json
        { "email_address": @email_address, "email_address_type": @email_address_type, "integration_params": @integration_params, "linked_account_params": @linked_account_params }.to_json()
      end
      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object] 
      # @return [Void]
      def self.validate_raw(obj:)
        obj.email_address&.is_a?(String) != false || raise("Passed value for field obj.email_address is not the expected type, validation failed.")
        obj.email_address_type&.is_a?(String) != false || raise("Passed value for field obj.email_address_type is not the expected type, validation failed.")
        obj.integration_params&.is_a?(Hash) != false || raise("Passed value for field obj.integration_params is not the expected type, validation failed.")
        obj.linked_account_params&.is_a?(Hash) != false || raise("Passed value for field obj.linked_account_params is not the expected type, validation failed.")
      end
    end
  end
end