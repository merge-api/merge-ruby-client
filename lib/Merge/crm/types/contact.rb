# frozen_string_literal: true
require_relative "contact_account"
require_relative "contact_owner"
require_relative "address"
require_relative "email_address"
require_relative "phone_number"
require "date"
require "date"
require "date"
require "date"
require_relative "remote_data"
require_relative "remote_field"
require "json"

module Merge
  module Crm
    # # The Contact Object 
### Description

The `Contact` object is used to represent an existing point of contact at a company in a CRM system.

### Usage Example

TODO
    class Contact
      attr_reader :first_name, :last_name, :account, :owner, :addresses, :email_addresses, :phone_numbers, :last_activity_at, :remote_created_at, :remote_was_deleted, :id, :remote_id, :created_at, :modified_at, :field_mappings, :remote_data, :remote_fields, :additional_properties
      # @param first_name [String] The contact's first name.
      # @param last_name [String] The contact's last name.
      # @param account [Crm::ContactAccount] The contact's account.
      # @param owner [Crm::ContactOwner] The contact's owner.
      # @param addresses [Array<Crm::Address>] 
      # @param email_addresses [Array<Crm::EmailAddress>] 
      # @param phone_numbers [Array<Crm::PhoneNumber>] 
      # @param last_activity_at [DateTime] When the contact's last activity occurred.
      # @param remote_created_at [DateTime] When the third party's contact was created.
      # @param remote_was_deleted [Boolean] 
      # @param id [String] 
      # @param remote_id [String] The third-party API ID of the matching object.
      # @param created_at [DateTime] 
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param field_mappings [Hash{String => String}] 
      # @param remote_data [Array<Crm::RemoteData>] 
      # @param remote_fields [Array<Crm::RemoteField>] 
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Crm::Contact]
      def initialize(first_name: nil, last_name: nil, account: nil, owner: nil, addresses: nil, email_addresses: nil, phone_numbers: nil, last_activity_at: nil, remote_created_at: nil, remote_was_deleted: nil, id: nil, remote_id: nil, created_at: nil, modified_at: nil, field_mappings: nil, remote_data: nil, remote_fields: nil, additional_properties: nil)
        # @type [String] The contact's first name.
        @first_name = first_name
        # @type [String] The contact's last name.
        @last_name = last_name
        # @type [Crm::ContactAccount] The contact's account.
        @account = account
        # @type [Crm::ContactOwner] The contact's owner.
        @owner = owner
        # @type [Array<Crm::Address>] 
        @addresses = addresses
        # @type [Array<Crm::EmailAddress>] 
        @email_addresses = email_addresses
        # @type [Array<Crm::PhoneNumber>] 
        @phone_numbers = phone_numbers
        # @type [DateTime] When the contact's last activity occurred.
        @last_activity_at = last_activity_at
        # @type [DateTime] When the third party's contact was created.
        @remote_created_at = remote_created_at
        # @type [Boolean] 
        @remote_was_deleted = remote_was_deleted
        # @type [String] 
        @id = id
        # @type [String] The third-party API ID of the matching object.
        @remote_id = remote_id
        # @type [DateTime] 
        @created_at = created_at
        # @type [DateTime] This is the datetime that this object was last updated by Merge
        @modified_at = modified_at
        # @type [Hash{String => String}] 
        @field_mappings = field_mappings
        # @type [Array<Crm::RemoteData>] 
        @remote_data = remote_data
        # @type [Array<Crm::RemoteField>] 
        @remote_fields = remote_fields
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end
      # Deserialize a JSON object to an instance of Contact
      #
      # @param json_object [JSON] 
      # @return [Crm::Contact]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        first_name = struct.first_name
        last_name = struct.last_name
        account = struct.account.to_h.to_json()
        account = Crm::ContactAccount.from_json(json_object: account)
        owner = struct.owner.to_h.to_json()
        owner = Crm::ContactOwner.from_json(json_object: owner)
        addresses = struct.addresses.map() do | v |
  v = v.to_h.to_json()
  Crm::Address.from_json(json_object: v)
end
        email_addresses = struct.email_addresses.map() do | v |
  v = v.to_h.to_json()
  Crm::EmailAddress.from_json(json_object: v)
end
        phone_numbers = struct.phone_numbers.map() do | v |
  v = v.to_h.to_json()
  Crm::PhoneNumber.from_json(json_object: v)
end
        last_activity_at = DateTime.parse(struct.last_activity_at)
        remote_created_at = DateTime.parse(struct.remote_created_at)
        remote_was_deleted = struct.remote_was_deleted
        id = struct.id
        remote_id = struct.remote_id
        created_at = DateTime.parse(struct.created_at)
        modified_at = DateTime.parse(struct.modified_at)
        field_mappings = struct.field_mappings
        remote_data = struct.remote_data.map() do | v |
  v = v.to_h.to_json()
  Crm::RemoteData.from_json(json_object: v)
end
        remote_fields = struct.remote_fields.map() do | v |
  v = v.to_h.to_json()
  Crm::RemoteField.from_json(json_object: v)
end
        new(first_name: first_name, last_name: last_name, account: account, owner: owner, addresses: addresses, email_addresses: email_addresses, phone_numbers: phone_numbers, last_activity_at: last_activity_at, remote_created_at: remote_created_at, remote_was_deleted: remote_was_deleted, id: id, remote_id: remote_id, created_at: created_at, modified_at: modified_at, field_mappings: field_mappings, remote_data: remote_data, remote_fields: remote_fields, additional_properties: struct)
      end
      # Serialize an instance of Contact to a JSON object
      #
      # @return [JSON]
      def to_json
        { "first_name": @first_name, "last_name": @last_name, "account": @account, "owner": @owner, "addresses": @addresses, "email_addresses": @email_addresses, "phone_numbers": @phone_numbers, "last_activity_at": @last_activity_at, "remote_created_at": @remote_created_at, "remote_was_deleted": @remote_was_deleted, "id": @id, "remote_id": @remote_id, "created_at": @created_at, "modified_at": @modified_at, "field_mappings": @field_mappings, "remote_data": @remote_data, "remote_fields": @remote_fields }.to_json()
      end
      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object] 
      # @return [Void]
      def self.validate_raw(obj:)
        obj.first_name&.is_a?(String) != false || raise("Passed value for field obj.first_name is not the expected type, validation failed.")
        obj.last_name&.is_a?(String) != false || raise("Passed value for field obj.last_name is not the expected type, validation failed.")
        obj.account.nil?() || Crm::ContactAccount.validate_raw(obj: obj.account)
        obj.owner.nil?() || Crm::ContactOwner.validate_raw(obj: obj.owner)
        obj.addresses&.is_a?(Array) != false || raise("Passed value for field obj.addresses is not the expected type, validation failed.")
        obj.email_addresses&.is_a?(Array) != false || raise("Passed value for field obj.email_addresses is not the expected type, validation failed.")
        obj.phone_numbers&.is_a?(Array) != false || raise("Passed value for field obj.phone_numbers is not the expected type, validation failed.")
        obj.last_activity_at&.is_a?(DateTime) != false || raise("Passed value for field obj.last_activity_at is not the expected type, validation failed.")
        obj.remote_created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_created_at is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.remote_id&.is_a?(String) != false || raise("Passed value for field obj.remote_id is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
        obj.remote_fields&.is_a?(Array) != false || raise("Passed value for field obj.remote_fields is not the expected type, validation failed.")
      end
    end
  end
end