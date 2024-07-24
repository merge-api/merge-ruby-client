# frozen_string_literal: true

require "date"
require_relative "status_7_d_1_enum"
require_relative "contact_addresses_item"
require_relative "accounting_phone_number"
require_relative "remote_data"
require "ostruct"
require "json"

module Merge
  module Accounting
    # # The Contact Object
    #  ### Description
    #  A `Contact` is an individual or business entity to which products and services
    #  are sold to or purchased from. The `Contact` model contains both Customers, in
    #  which products and services are sold to, and Vendors (or Suppliers), in which
    #  products and services are purchased from.
    #  - A `Contact` is a Vendor/Supplier if the `is_supplier` property is true.
    #  - A `Contact` is a customer if the `is_customer` property is true.
    #  ### Usage Example
    #  Fetch from the `LIST Contacts` endpoint and view a company's contacts.
    class Contact
      # @return [String]
      attr_reader :id
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [DateTime] The datetime that this object was created by Merge.
      attr_reader :created_at
      # @return [DateTime] The datetime that this object was modified by Merge.
      attr_reader :modified_at
      # @return [String] The contact's name.
      attr_reader :name
      # @return [Boolean] Whether the contact is a supplier.
      attr_reader :is_supplier
      # @return [Boolean] Whether the contact is a customer.
      attr_reader :is_customer
      # @return [String] The contact's email address.
      attr_reader :email_address
      # @return [String] The contact's tax number.
      attr_reader :tax_number
      # @return [Merge::Accounting::Status7D1Enum] The contact's status
      #  - `ACTIVE` - ACTIVE
      #  - `ARCHIVED` - ARCHIVED
      attr_reader :status
      # @return [String] The currency the contact's transactions are in.
      attr_reader :currency
      # @return [DateTime] When the third party's contact was updated.
      attr_reader :remote_updated_at
      # @return [String] The company the contact belongs to.
      attr_reader :company
      # @return [Array<Merge::Accounting::ContactAddressesItem>] `Address` object IDs for the given `Contacts` object.
      attr_reader :addresses
      # @return [Array<Merge::Accounting::AccountingPhoneNumber>] `AccountingPhoneNumber` object for the given `Contacts` object.
      attr_reader :phone_numbers
      # @return [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform.
      attr_reader :remote_was_deleted
      # @return [Hash{String => Object}]
      attr_reader :field_mappings
      # @return [Array<Merge::Accounting::RemoteData>]
      attr_reader :remote_data
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param id [String]
      # @param remote_id [String] The third-party API ID of the matching object.
      # @param created_at [DateTime] The datetime that this object was created by Merge.
      # @param modified_at [DateTime] The datetime that this object was modified by Merge.
      # @param name [String] The contact's name.
      # @param is_supplier [Boolean] Whether the contact is a supplier.
      # @param is_customer [Boolean] Whether the contact is a customer.
      # @param email_address [String] The contact's email address.
      # @param tax_number [String] The contact's tax number.
      # @param status [Merge::Accounting::Status7D1Enum] The contact's status
      #  - `ACTIVE` - ACTIVE
      #  - `ARCHIVED` - ARCHIVED
      # @param currency [String] The currency the contact's transactions are in.
      # @param remote_updated_at [DateTime] When the third party's contact was updated.
      # @param company [String] The company the contact belongs to.
      # @param addresses [Array<Merge::Accounting::ContactAddressesItem>] `Address` object IDs for the given `Contacts` object.
      # @param phone_numbers [Array<Merge::Accounting::AccountingPhoneNumber>] `AccountingPhoneNumber` object for the given `Contacts` object.
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform.
      # @param field_mappings [Hash{String => Object}]
      # @param remote_data [Array<Merge::Accounting::RemoteData>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Accounting::Contact]
      def initialize(id: OMIT, remote_id: OMIT, created_at: OMIT, modified_at: OMIT, name: OMIT, is_supplier: OMIT,
                     is_customer: OMIT, email_address: OMIT, tax_number: OMIT, status: OMIT, currency: OMIT, remote_updated_at: OMIT, company: OMIT, addresses: OMIT, phone_numbers: OMIT, remote_was_deleted: OMIT, field_mappings: OMIT, remote_data: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @name = name if name != OMIT
        @is_supplier = is_supplier if is_supplier != OMIT
        @is_customer = is_customer if is_customer != OMIT
        @email_address = email_address if email_address != OMIT
        @tax_number = tax_number if tax_number != OMIT
        @status = status if status != OMIT
        @currency = currency if currency != OMIT
        @remote_updated_at = remote_updated_at if remote_updated_at != OMIT
        @company = company if company != OMIT
        @addresses = addresses if addresses != OMIT
        @phone_numbers = phone_numbers if phone_numbers != OMIT
        @remote_was_deleted = remote_was_deleted if remote_was_deleted != OMIT
        @field_mappings = field_mappings if field_mappings != OMIT
        @remote_data = remote_data if remote_data != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "remote_id": remote_id,
          "created_at": created_at,
          "modified_at": modified_at,
          "name": name,
          "is_supplier": is_supplier,
          "is_customer": is_customer,
          "email_address": email_address,
          "tax_number": tax_number,
          "status": status,
          "currency": currency,
          "remote_updated_at": remote_updated_at,
          "company": company,
          "addresses": addresses,
          "phone_numbers": phone_numbers,
          "remote_was_deleted": remote_was_deleted,
          "field_mappings": field_mappings,
          "remote_data": remote_data
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of Contact
      #
      # @param json_object [String]
      # @return [Merge::Accounting::Contact]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = parsed_json["id"]
        remote_id = parsed_json["remote_id"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        name = parsed_json["name"]
        is_supplier = parsed_json["is_supplier"]
        is_customer = parsed_json["is_customer"]
        email_address = parsed_json["email_address"]
        tax_number = parsed_json["tax_number"]
        status = parsed_json["status"]
        currency = parsed_json["currency"]
        remote_updated_at = unless parsed_json["remote_updated_at"].nil?
                              DateTime.parse(parsed_json["remote_updated_at"])
                            end
        company = parsed_json["company"]
        addresses = parsed_json["addresses"]&.map do |item|
          item = item.to_json
          Merge::Accounting::ContactAddressesItem.from_json(json_object: item)
        end
        phone_numbers = parsed_json["phone_numbers"]&.map do |item|
          item = item.to_json
          Merge::Accounting::AccountingPhoneNumber.from_json(json_object: item)
        end
        remote_was_deleted = parsed_json["remote_was_deleted"]
        field_mappings = parsed_json["field_mappings"]
        remote_data = parsed_json["remote_data"]&.map do |item|
          item = item.to_json
          Merge::Accounting::RemoteData.from_json(json_object: item)
        end
        new(
          id: id,
          remote_id: remote_id,
          created_at: created_at,
          modified_at: modified_at,
          name: name,
          is_supplier: is_supplier,
          is_customer: is_customer,
          email_address: email_address,
          tax_number: tax_number,
          status: status,
          currency: currency,
          remote_updated_at: remote_updated_at,
          company: company,
          addresses: addresses,
          phone_numbers: phone_numbers,
          remote_was_deleted: remote_was_deleted,
          field_mappings: field_mappings,
          remote_data: remote_data,
          additional_properties: struct
        )
      end

      # Serialize an instance of Contact to a JSON object
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
        obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.remote_id&.is_a?(String) != false || raise("Passed value for field obj.remote_id is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
        obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.is_supplier&.is_a?(Boolean) != false || raise("Passed value for field obj.is_supplier is not the expected type, validation failed.")
        obj.is_customer&.is_a?(Boolean) != false || raise("Passed value for field obj.is_customer is not the expected type, validation failed.")
        obj.email_address&.is_a?(String) != false || raise("Passed value for field obj.email_address is not the expected type, validation failed.")
        obj.tax_number&.is_a?(String) != false || raise("Passed value for field obj.tax_number is not the expected type, validation failed.")
        obj.status&.is_a?(Merge::Accounting::Status7D1Enum) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
        obj.currency&.is_a?(String) != false || raise("Passed value for field obj.currency is not the expected type, validation failed.")
        obj.remote_updated_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_updated_at is not the expected type, validation failed.")
        obj.company&.is_a?(String) != false || raise("Passed value for field obj.company is not the expected type, validation failed.")
        obj.addresses&.is_a?(Array) != false || raise("Passed value for field obj.addresses is not the expected type, validation failed.")
        obj.phone_numbers&.is_a?(Array) != false || raise("Passed value for field obj.phone_numbers is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end
