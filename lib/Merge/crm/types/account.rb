# frozen_string_literal: true
require_relative "account_owner"
require_relative "address"
require_relative "phone_number"
require "date"
require "date"
require "date"
require "date"
require "date"
require_relative "remote_data"
require_relative "remote_field"
require "json"

module Merge
  module Crm
    # # The Account Object 
### Description

The `Account` object is used to represent a company in a CRM system.

### Usage Example

TODO
    class Account
      attr_reader :owner, :name, :description, :industry, :website, :number_of_employees, :addresses, :phone_numbers, :last_activity_at, :remote_updated_at, :remote_created_at, :remote_was_deleted, :id, :remote_id, :created_at, :modified_at, :field_mappings, :remote_data, :remote_fields, :additional_properties
      # @param owner [Crm::AccountOwner] The account's owner.
      # @param name [String] The account's name.
      # @param description [String] The account's description.
      # @param industry [String] The account's industry.
      # @param website [String] The account's website.
      # @param number_of_employees [Integer] The account's number of employees.
      # @param addresses [Array<Crm::Address>] 
      # @param phone_numbers [Array<Crm::PhoneNumber>] 
      # @param last_activity_at [DateTime] The last date (either most recent or furthest in the future) of when an activity occurs in an account.
      # @param remote_updated_at [DateTime] When the CRM system account data was last modified by a user with a login.
      # @param remote_created_at [DateTime] When the third party's account was created.
      # @param remote_was_deleted [Boolean] 
      # @param id [String] 
      # @param remote_id [String] The third-party API ID of the matching object.
      # @param created_at [DateTime] 
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param field_mappings [Hash{String => String}] 
      # @param remote_data [Array<Crm::RemoteData>] 
      # @param remote_fields [Array<Crm::RemoteField>] 
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Crm::Account]
      def initialize(owner: nil, name: nil, description: nil, industry: nil, website: nil, number_of_employees: nil, addresses: nil, phone_numbers: nil, last_activity_at: nil, remote_updated_at: nil, remote_created_at: nil, remote_was_deleted: nil, id: nil, remote_id: nil, created_at: nil, modified_at: nil, field_mappings: nil, remote_data: nil, remote_fields: nil, additional_properties: nil)
        # @type [Crm::AccountOwner] The account's owner.
        @owner = owner
        # @type [String] The account's name.
        @name = name
        # @type [String] The account's description.
        @description = description
        # @type [String] The account's industry.
        @industry = industry
        # @type [String] The account's website.
        @website = website
        # @type [Integer] The account's number of employees.
        @number_of_employees = number_of_employees
        # @type [Array<Crm::Address>] 
        @addresses = addresses
        # @type [Array<Crm::PhoneNumber>] 
        @phone_numbers = phone_numbers
        # @type [DateTime] The last date (either most recent or furthest in the future) of when an activity occurs in an account.
        @last_activity_at = last_activity_at
        # @type [DateTime] When the CRM system account data was last modified by a user with a login.
        @remote_updated_at = remote_updated_at
        # @type [DateTime] When the third party's account was created.
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
      # Deserialize a JSON object to an instance of Account
      #
      # @param json_object [JSON] 
      # @return [Crm::Account]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        owner = struct.owner.to_h.to_json()
        owner = Crm::AccountOwner.from_json(json_object: owner)
        name = struct.name
        description = struct.description
        industry = struct.industry
        website = struct.website
        number_of_employees = struct.number_of_employees
        addresses = struct.addresses.map() do | v |
  v = v.to_h.to_json()
  Crm::Address.from_json(json_object: v)
end
        phone_numbers = struct.phone_numbers.map() do | v |
  v = v.to_h.to_json()
  Crm::PhoneNumber.from_json(json_object: v)
end
        last_activity_at = DateTime.parse(struct.last_activity_at)
        remote_updated_at = DateTime.parse(struct.remote_updated_at)
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
        new(owner: owner, name: name, description: description, industry: industry, website: website, number_of_employees: number_of_employees, addresses: addresses, phone_numbers: phone_numbers, last_activity_at: last_activity_at, remote_updated_at: remote_updated_at, remote_created_at: remote_created_at, remote_was_deleted: remote_was_deleted, id: id, remote_id: remote_id, created_at: created_at, modified_at: modified_at, field_mappings: field_mappings, remote_data: remote_data, remote_fields: remote_fields, additional_properties: struct)
      end
      # Serialize an instance of Account to a JSON object
      #
      # @return [JSON]
      def to_json
        { "owner": @owner, "name": @name, "description": @description, "industry": @industry, "website": @website, "number_of_employees": @number_of_employees, "addresses": @addresses, "phone_numbers": @phone_numbers, "last_activity_at": @last_activity_at, "remote_updated_at": @remote_updated_at, "remote_created_at": @remote_created_at, "remote_was_deleted": @remote_was_deleted, "id": @id, "remote_id": @remote_id, "created_at": @created_at, "modified_at": @modified_at, "field_mappings": @field_mappings, "remote_data": @remote_data, "remote_fields": @remote_fields }.to_json()
      end
      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object] 
      # @return [Void]
      def self.validate_raw(obj:)
        obj.owner.nil?() || Crm::AccountOwner.validate_raw(obj: obj.owner)
        obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
        obj.industry&.is_a?(String) != false || raise("Passed value for field obj.industry is not the expected type, validation failed.")
        obj.website&.is_a?(String) != false || raise("Passed value for field obj.website is not the expected type, validation failed.")
        obj.number_of_employees&.is_a?(Integer) != false || raise("Passed value for field obj.number_of_employees is not the expected type, validation failed.")
        obj.addresses&.is_a?(Array) != false || raise("Passed value for field obj.addresses is not the expected type, validation failed.")
        obj.phone_numbers&.is_a?(Array) != false || raise("Passed value for field obj.phone_numbers is not the expected type, validation failed.")
        obj.last_activity_at&.is_a?(DateTime) != false || raise("Passed value for field obj.last_activity_at is not the expected type, validation failed.")
        obj.remote_updated_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_updated_at is not the expected type, validation failed.")
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