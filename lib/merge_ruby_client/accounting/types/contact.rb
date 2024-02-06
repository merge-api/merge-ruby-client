# frozen_string_literal: true

require_relative "contact_status"
require "date"
require_relative "contact_addresses_item"
require_relative "accounting_phone_number"
require_relative "remote_data"
require "json"

module Merge
  module Accounting
    # # The Contact Object
    #
    # ### Description
    #
    # A `Contact` is an individual or business entity to which products and services are sold to or purchased from. The `Contact` model contains both Customers, in which products and services are sold to, and Vendors (or Suppliers), in which products and services are purchased from.
    #
    # - A `Contact` is a Vendor/Supplier if the `is_supplier` property is true.
    # - A `Contact` is a customer if the `is_customer` property is true.
    #
    # ### Usage Example
    #
    # Fetch from the `LIST Contacts` endpoint and view a company's contacts.
    class Contact
      attr_reader :id, :remote_id, :name, :is_supplier, :is_customer, :email_address, :tax_number, :status, :currency,
                  :remote_updated_at, :company, :addresses, :phone_numbers, :remote_was_deleted, :created_at, :modified_at, :field_mappings, :remote_data, :additional_properties

      # @param id [String]
      # @param remote_id [String] The third-party API ID of the matching object.
      # @param name [String] The contact's name.
      # @param is_supplier [Boolean] Whether the contact is a supplier.
      # @param is_customer [Boolean] Whether the contact is a customer.
      # @param email_address [String] The contact's email address.
      # @param tax_number [String] The contact's tax number.
      # @param status [Accounting::ContactStatus] The contact's status
      #   - `ACTIVE` - ACTIVE
      #   - `ARCHIVED` - ARCHIVED
      # @param currency [String] The currency the contact's transactions are in.
      # @param remote_updated_at [DateTime] When the third party's contact was updated.
      # @param company [String] The company the contact belongs to.
      # @param addresses [Array<Accounting::ContactAddressesItem>] `Address` object IDs for the given `Contacts` object.
      # @param phone_numbers [Array<Accounting::AccountingPhoneNumber>] `AccountingPhoneNumber` object for the given `Contacts` object.
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party platform.
      # @param created_at [DateTime]
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param field_mappings [Hash{String => String}]
      # @param remote_data [Array<Accounting::RemoteData>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Accounting::Contact]
      def initialize(id: nil, remote_id: nil, name: nil, is_supplier: nil, is_customer: nil, email_address: nil,
                     tax_number: nil, status: nil, currency: nil, remote_updated_at: nil, company: nil, addresses: nil, phone_numbers: nil, remote_was_deleted: nil, created_at: nil, modified_at: nil, field_mappings: nil, remote_data: nil, additional_properties: nil)
        # @type [String]
        @id = id
        # @type [String] The third-party API ID of the matching object.
        @remote_id = remote_id
        # @type [String] The contact's name.
        @name = name
        # @type [Boolean] Whether the contact is a supplier.
        @is_supplier = is_supplier
        # @type [Boolean] Whether the contact is a customer.
        @is_customer = is_customer
        # @type [String] The contact's email address.
        @email_address = email_address
        # @type [String] The contact's tax number.
        @tax_number = tax_number
        # @type [Accounting::ContactStatus] The contact's status
        #   - `ACTIVE` - ACTIVE
        #   - `ARCHIVED` - ARCHIVED
        @status = status
        # @type [String] The currency the contact's transactions are in.
        @currency = currency
        # @type [DateTime] When the third party's contact was updated.
        @remote_updated_at = remote_updated_at
        # @type [String] The company the contact belongs to.
        @company = company
        # @type [Array<Accounting::ContactAddressesItem>] `Address` object IDs for the given `Contacts` object.
        @addresses = addresses
        # @type [Array<Accounting::AccountingPhoneNumber>] `AccountingPhoneNumber` object for the given `Contacts` object.
        @phone_numbers = phone_numbers
        # @type [Boolean] Indicates whether or not this object has been deleted in the third party platform.
        @remote_was_deleted = remote_was_deleted
        # @type [DateTime]
        @created_at = created_at
        # @type [DateTime] This is the datetime that this object was last updated by Merge
        @modified_at = modified_at
        # @type [Hash{String => String}]
        @field_mappings = field_mappings
        # @type [Array<Accounting::RemoteData>]
        @remote_data = remote_data
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of Contact
      #
      # @param json_object [JSON]
      # @return [Accounting::Contact]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = struct.id
        remote_id = struct.remote_id
        name = struct.name
        is_supplier = struct.is_supplier
        is_customer = struct.is_customer
        email_address = struct.email_address
        tax_number = struct.tax_number
        if parsed_json["status"].nil?
          status = nil
        else
          status = parsed_json["status"].to_json
          status = Accounting::ContactStatus.from_json(json_object: status)
        end
        currency = struct.currency
        remote_updated_at = unless parsed_json["remote_updated_at"].nil?
                              DateTime.parse(parsed_json["remote_updated_at"])
                            end
        company = struct.company
        addresses = parsed_json["addresses"]&.map do |v|
          v = v.to_json
          Accounting::ContactAddressesItem.from_json(json_object: v)
        end
        phone_numbers = parsed_json["phone_numbers"]&.map do |v|
          v = v.to_json
          Accounting::AccountingPhoneNumber.from_json(json_object: v)
        end
        remote_was_deleted = struct.remote_was_deleted
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        field_mappings = struct.field_mappings
        remote_data = parsed_json["remote_data"]&.map do |v|
          v = v.to_json
          Accounting::RemoteData.from_json(json_object: v)
        end
        new(id: id, remote_id: remote_id, name: name, is_supplier: is_supplier, is_customer: is_customer,
            email_address: email_address, tax_number: tax_number, status: status, currency: currency, remote_updated_at: remote_updated_at, company: company, addresses: addresses, phone_numbers: phone_numbers, remote_was_deleted: remote_was_deleted, created_at: created_at, modified_at: modified_at, field_mappings: field_mappings, remote_data: remote_data, additional_properties: struct)
      end

      # Serialize an instance of Contact to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "id": @id,
          "remote_id": @remote_id,
          "name": @name,
          "is_supplier": @is_supplier,
          "is_customer": @is_customer,
          "email_address": @email_address,
          "tax_number": @tax_number,
          "status": @status,
          "currency": @currency,
          "remote_updated_at": @remote_updated_at,
          "company": @company,
          "addresses": @addresses,
          "phone_numbers": @phone_numbers,
          "remote_was_deleted": @remote_was_deleted,
          "created_at": @created_at,
          "modified_at": @modified_at,
          "field_mappings": @field_mappings,
          "remote_data": @remote_data
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.remote_id&.is_a?(String) != false || raise("Passed value for field obj.remote_id is not the expected type, validation failed.")
        obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.is_supplier&.is_a?(Boolean) != false || raise("Passed value for field obj.is_supplier is not the expected type, validation failed.")
        obj.is_customer&.is_a?(Boolean) != false || raise("Passed value for field obj.is_customer is not the expected type, validation failed.")
        obj.email_address&.is_a?(String) != false || raise("Passed value for field obj.email_address is not the expected type, validation failed.")
        obj.tax_number&.is_a?(String) != false || raise("Passed value for field obj.tax_number is not the expected type, validation failed.")
        obj.status.nil? || Accounting::ContactStatus.validate_raw(obj: obj.status)
        obj.currency&.is_a?(String) != false || raise("Passed value for field obj.currency is not the expected type, validation failed.")
        obj.remote_updated_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_updated_at is not the expected type, validation failed.")
        obj.company&.is_a?(String) != false || raise("Passed value for field obj.company is not the expected type, validation failed.")
        obj.addresses&.is_a?(Array) != false || raise("Passed value for field obj.addresses is not the expected type, validation failed.")
        obj.phone_numbers&.is_a?(Array) != false || raise("Passed value for field obj.phone_numbers is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end
