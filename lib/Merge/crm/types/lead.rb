# frozen_string_literal: true
require_relative "lead_owner"
require_relative "address"
require_relative "email_address"
require_relative "phone_number"
require "date"
require "date"
require "date"
require_relative "lead_converted_contact"
require_relative "lead_converted_account"
require "date"
require "date"
require_relative "remote_data"
require_relative "remote_field"
require "json"

module Merge
  module Crm
    # # The Lead Object 
### Description

The `Lead` object is used to represent an individual who is a potential customer.

### Usage Example

TODO
    class Lead
      attr_reader :owner, :lead_source, :title, :company, :first_name, :last_name, :addresses, :email_addresses, :phone_numbers, :remote_updated_at, :remote_created_at, :converted_date, :converted_contact, :converted_account, :remote_was_deleted, :id, :remote_id, :created_at, :modified_at, :field_mappings, :remote_data, :remote_fields, :additional_properties
      # @param owner [Crm::LeadOwner] The lead's owner.
      # @param lead_source [String] The lead's source.
      # @param title [String] The lead's title.
      # @param company [String] The lead's company.
      # @param first_name [String] The lead's first name.
      # @param last_name [String] The lead's last name.
      # @param addresses [Array<Crm::Address>] 
      # @param email_addresses [Array<Crm::EmailAddress>] 
      # @param phone_numbers [Array<Crm::PhoneNumber>] 
      # @param remote_updated_at [DateTime] When the third party's lead was updated.
      # @param remote_created_at [DateTime] When the third party's lead was created.
      # @param converted_date [DateTime] When the lead was converted.
      # @param converted_contact [Crm::LeadConvertedContact] The contact of the converted lead.
      # @param converted_account [Crm::LeadConvertedAccount] The account of the converted lead.
      # @param remote_was_deleted [Boolean] 
      # @param id [String] 
      # @param remote_id [String] The third-party API ID of the matching object.
      # @param created_at [DateTime] 
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param field_mappings [Hash{String => String}] 
      # @param remote_data [Array<Crm::RemoteData>] 
      # @param remote_fields [Array<Crm::RemoteField>] 
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Crm::Lead]
      def initialize(owner: nil, lead_source: nil, title: nil, company: nil, first_name: nil, last_name: nil, addresses: nil, email_addresses: nil, phone_numbers: nil, remote_updated_at: nil, remote_created_at: nil, converted_date: nil, converted_contact: nil, converted_account: nil, remote_was_deleted: nil, id: nil, remote_id: nil, created_at: nil, modified_at: nil, field_mappings: nil, remote_data: nil, remote_fields: nil, additional_properties: nil)
        # @type [Crm::LeadOwner] The lead's owner.
        @owner = owner
        # @type [String] The lead's source.
        @lead_source = lead_source
        # @type [String] The lead's title.
        @title = title
        # @type [String] The lead's company.
        @company = company
        # @type [String] The lead's first name.
        @first_name = first_name
        # @type [String] The lead's last name.
        @last_name = last_name
        # @type [Array<Crm::Address>] 
        @addresses = addresses
        # @type [Array<Crm::EmailAddress>] 
        @email_addresses = email_addresses
        # @type [Array<Crm::PhoneNumber>] 
        @phone_numbers = phone_numbers
        # @type [DateTime] When the third party's lead was updated.
        @remote_updated_at = remote_updated_at
        # @type [DateTime] When the third party's lead was created.
        @remote_created_at = remote_created_at
        # @type [DateTime] When the lead was converted.
        @converted_date = converted_date
        # @type [Crm::LeadConvertedContact] The contact of the converted lead.
        @converted_contact = converted_contact
        # @type [Crm::LeadConvertedAccount] The account of the converted lead.
        @converted_account = converted_account
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
      # Deserialize a JSON object to an instance of Lead
      #
      # @param json_object [JSON] 
      # @return [Crm::Lead]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        owner = struct.owner.to_h.to_json()
        owner = Crm::LeadOwner.from_json(json_object: owner)
        lead_source = struct.lead_source
        title = struct.title
        company = struct.company
        first_name = struct.first_name
        last_name = struct.last_name
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
        remote_updated_at = DateTime.parse(struct.remote_updated_at)
        remote_created_at = DateTime.parse(struct.remote_created_at)
        converted_date = DateTime.parse(struct.converted_date)
        converted_contact = struct.converted_contact.to_h.to_json()
        converted_contact = Crm::LeadConvertedContact.from_json(json_object: converted_contact)
        converted_account = struct.converted_account.to_h.to_json()
        converted_account = Crm::LeadConvertedAccount.from_json(json_object: converted_account)
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
        new(owner: owner, lead_source: lead_source, title: title, company: company, first_name: first_name, last_name: last_name, addresses: addresses, email_addresses: email_addresses, phone_numbers: phone_numbers, remote_updated_at: remote_updated_at, remote_created_at: remote_created_at, converted_date: converted_date, converted_contact: converted_contact, converted_account: converted_account, remote_was_deleted: remote_was_deleted, id: id, remote_id: remote_id, created_at: created_at, modified_at: modified_at, field_mappings: field_mappings, remote_data: remote_data, remote_fields: remote_fields, additional_properties: struct)
      end
      # Serialize an instance of Lead to a JSON object
      #
      # @return [JSON]
      def to_json
        { "owner": @owner, "lead_source": @lead_source, "title": @title, "company": @company, "first_name": @first_name, "last_name": @last_name, "addresses": @addresses, "email_addresses": @email_addresses, "phone_numbers": @phone_numbers, "remote_updated_at": @remote_updated_at, "remote_created_at": @remote_created_at, "converted_date": @converted_date, "converted_contact": @converted_contact, "converted_account": @converted_account, "remote_was_deleted": @remote_was_deleted, "id": @id, "remote_id": @remote_id, "created_at": @created_at, "modified_at": @modified_at, "field_mappings": @field_mappings, "remote_data": @remote_data, "remote_fields": @remote_fields }.to_json()
      end
      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object] 
      # @return [Void]
      def self.validate_raw(obj:)
        obj.owner.nil?() || Crm::LeadOwner.validate_raw(obj: obj.owner)
        obj.lead_source&.is_a?(String) != false || raise("Passed value for field obj.lead_source is not the expected type, validation failed.")
        obj.title&.is_a?(String) != false || raise("Passed value for field obj.title is not the expected type, validation failed.")
        obj.company&.is_a?(String) != false || raise("Passed value for field obj.company is not the expected type, validation failed.")
        obj.first_name&.is_a?(String) != false || raise("Passed value for field obj.first_name is not the expected type, validation failed.")
        obj.last_name&.is_a?(String) != false || raise("Passed value for field obj.last_name is not the expected type, validation failed.")
        obj.addresses&.is_a?(Array) != false || raise("Passed value for field obj.addresses is not the expected type, validation failed.")
        obj.email_addresses&.is_a?(Array) != false || raise("Passed value for field obj.email_addresses is not the expected type, validation failed.")
        obj.phone_numbers&.is_a?(Array) != false || raise("Passed value for field obj.phone_numbers is not the expected type, validation failed.")
        obj.remote_updated_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_updated_at is not the expected type, validation failed.")
        obj.remote_created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_created_at is not the expected type, validation failed.")
        obj.converted_date&.is_a?(DateTime) != false || raise("Passed value for field obj.converted_date is not the expected type, validation failed.")
        obj.converted_contact.nil?() || Crm::LeadConvertedContact.validate_raw(obj: obj.converted_contact)
        obj.converted_account.nil?() || Crm::LeadConvertedAccount.validate_raw(obj: obj.converted_account)
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