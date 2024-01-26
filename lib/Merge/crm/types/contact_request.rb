# frozen_string_literal: true
require_relative "contact_request_account"
require_relative "contact_request_owner"
require_relative "address_request"
require_relative "email_address_request"
require_relative "phone_number_request"
require "date"
require_relative "remote_field_request"
require "json"

module Merge
  module Crm
    # # The Contact Object 
### Description

The `Contact` object is used to represent an existing point of contact at a company in a CRM system.

### Usage Example

TODO
    class ContactRequest
      attr_reader :first_name, :last_name, :account, :owner, :addresses, :email_addresses, :phone_numbers, :last_activity_at, :integration_params, :linked_account_params, :remote_fields, :additional_properties
      # @param first_name [String] The contact's first name.
      # @param last_name [String] The contact's last name.
      # @param account [Crm::ContactRequestAccount] The contact's account.
      # @param owner [Crm::ContactRequestOwner] The contact's owner.
      # @param addresses [Array<Crm::AddressRequest>] 
      # @param email_addresses [Array<Crm::EmailAddressRequest>] 
      # @param phone_numbers [Array<Crm::PhoneNumberRequest>] 
      # @param last_activity_at [DateTime] When the contact's last activity occurred.
      # @param integration_params [Hash{String => String}] 
      # @param linked_account_params [Hash{String => String}] 
      # @param remote_fields [Array<Crm::RemoteFieldRequest>] 
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Crm::ContactRequest]
      def initialize(first_name: nil, last_name: nil, account: nil, owner: nil, addresses: nil, email_addresses: nil, phone_numbers: nil, last_activity_at: nil, integration_params: nil, linked_account_params: nil, remote_fields: nil, additional_properties: nil)
        # @type [String] The contact's first name.
        @first_name = first_name
        # @type [String] The contact's last name.
        @last_name = last_name
        # @type [Crm::ContactRequestAccount] The contact's account.
        @account = account
        # @type [Crm::ContactRequestOwner] The contact's owner.
        @owner = owner
        # @type [Array<Crm::AddressRequest>] 
        @addresses = addresses
        # @type [Array<Crm::EmailAddressRequest>] 
        @email_addresses = email_addresses
        # @type [Array<Crm::PhoneNumberRequest>] 
        @phone_numbers = phone_numbers
        # @type [DateTime] When the contact's last activity occurred.
        @last_activity_at = last_activity_at
        # @type [Hash{String => String}] 
        @integration_params = integration_params
        # @type [Hash{String => String}] 
        @linked_account_params = linked_account_params
        # @type [Array<Crm::RemoteFieldRequest>] 
        @remote_fields = remote_fields
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end
      # Deserialize a JSON object to an instance of ContactRequest
      #
      # @param json_object [JSON] 
      # @return [Crm::ContactRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        first_name = struct.first_name
        last_name = struct.last_name
        account = struct.account.to_h.to_json()
        account = Crm::ContactRequestAccount.from_json(json_object: account)
        owner = struct.owner.to_h.to_json()
        owner = Crm::ContactRequestOwner.from_json(json_object: owner)
        addresses = struct.addresses.map() do | v |
  v = v.to_h.to_json()
  Crm::AddressRequest.from_json(json_object: v)
end
        email_addresses = struct.email_addresses.map() do | v |
  v = v.to_h.to_json()
  Crm::EmailAddressRequest.from_json(json_object: v)
end
        phone_numbers = struct.phone_numbers.map() do | v |
  v = v.to_h.to_json()
  Crm::PhoneNumberRequest.from_json(json_object: v)
end
        last_activity_at = DateTime.parse(struct.last_activity_at)
        integration_params = struct.integration_params
        linked_account_params = struct.linked_account_params
        remote_fields = struct.remote_fields.map() do | v |
  v = v.to_h.to_json()
  Crm::RemoteFieldRequest.from_json(json_object: v)
end
        new(first_name: first_name, last_name: last_name, account: account, owner: owner, addresses: addresses, email_addresses: email_addresses, phone_numbers: phone_numbers, last_activity_at: last_activity_at, integration_params: integration_params, linked_account_params: linked_account_params, remote_fields: remote_fields, additional_properties: struct)
      end
      # Serialize an instance of ContactRequest to a JSON object
      #
      # @return [JSON]
      def to_json
        { "first_name": @first_name, "last_name": @last_name, "account": @account, "owner": @owner, "addresses": @addresses, "email_addresses": @email_addresses, "phone_numbers": @phone_numbers, "last_activity_at": @last_activity_at, "integration_params": @integration_params, "linked_account_params": @linked_account_params, "remote_fields": @remote_fields }.to_json()
      end
      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object] 
      # @return [Void]
      def self.validate_raw(obj:)
        obj.first_name&.is_a?(String) != false || raise("Passed value for field obj.first_name is not the expected type, validation failed.")
        obj.last_name&.is_a?(String) != false || raise("Passed value for field obj.last_name is not the expected type, validation failed.")
        obj.account.nil?() || Crm::ContactRequestAccount.validate_raw(obj: obj.account)
        obj.owner.nil?() || Crm::ContactRequestOwner.validate_raw(obj: obj.owner)
        obj.addresses&.is_a?(Array) != false || raise("Passed value for field obj.addresses is not the expected type, validation failed.")
        obj.email_addresses&.is_a?(Array) != false || raise("Passed value for field obj.email_addresses is not the expected type, validation failed.")
        obj.phone_numbers&.is_a?(Array) != false || raise("Passed value for field obj.phone_numbers is not the expected type, validation failed.")
        obj.last_activity_at&.is_a?(DateTime) != false || raise("Passed value for field obj.last_activity_at is not the expected type, validation failed.")
        obj.integration_params&.is_a?(Hash) != false || raise("Passed value for field obj.integration_params is not the expected type, validation failed.")
        obj.linked_account_params&.is_a?(Hash) != false || raise("Passed value for field obj.linked_account_params is not the expected type, validation failed.")
        obj.remote_fields&.is_a?(Array) != false || raise("Passed value for field obj.remote_fields is not the expected type, validation failed.")
      end
    end
  end
end