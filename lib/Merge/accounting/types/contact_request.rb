# frozen_string_literal: true
require_relative "contact_request_status"
require_relative "contact_request_addresses_item"
require_relative "accounting_phone_number_request"
require "json"

module Merge
  module Accounting
    # # The Contact Object 
### Description

A `Contact` is an individual or business entity to which products and services are sold to or purchased from. The `Contact` model contains both Customers, in which products and services are sold to, and Vendors (or Suppliers), in which products and services are purchased from.

- A `Contact` is a Vendor/Supplier if the `is_supplier` property is true.
- A `Contact` is a customer if the `is_customer` property is true.

### Usage Example

Fetch from the `LIST Contacts` endpoint and view a company's contacts.
    class ContactRequest
      attr_reader :name, :is_supplier, :is_customer, :email_address, :tax_number, :status, :currency, :company, :addresses, :phone_numbers, :integration_params, :linked_account_params, :additional_properties
      # @param name [String] The contact's name.
      # @param is_supplier [Boolean] Whether the contact is a supplier.
      # @param is_customer [Boolean] Whether the contact is a customer.
      # @param email_address [String] The contact's email address.
      # @param tax_number [String] The contact's tax number.
      # @param status [Accounting::ContactRequestStatus] The contact's status  - `ACTIVE` - ACTIVE
- `ARCHIVED` - ARCHIVED
      # @param currency [String] The currency the contact's transactions are in.
      # @param company [String] The company the contact belongs to.
      # @param addresses [Array<Accounting::ContactRequestAddressesItem>] `Address` object IDs for the given `Contacts` object.
      # @param phone_numbers [Array<Accounting::AccountingPhoneNumberRequest>] `AccountingPhoneNumber` object for the given `Contacts` object.
      # @param integration_params [Hash{String => String}] 
      # @param linked_account_params [Hash{String => String}] 
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Accounting::ContactRequest]
      def initialize(name: nil, is_supplier: nil, is_customer: nil, email_address: nil, tax_number: nil, status: nil, currency: nil, company: nil, addresses: nil, phone_numbers: nil, integration_params: nil, linked_account_params: nil, additional_properties: nil)
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
        # @type [Accounting::ContactRequestStatus] The contact's status 
- `ACTIVE` - ACTIVE
- `ARCHIVED` - ARCHIVED
        @status = status
        # @type [String] The currency the contact's transactions are in.
        @currency = currency
        # @type [String] The company the contact belongs to.
        @company = company
        # @type [Array<Accounting::ContactRequestAddressesItem>] `Address` object IDs for the given `Contacts` object.
        @addresses = addresses
        # @type [Array<Accounting::AccountingPhoneNumberRequest>] `AccountingPhoneNumber` object for the given `Contacts` object.
        @phone_numbers = phone_numbers
        # @type [Hash{String => String}] 
        @integration_params = integration_params
        # @type [Hash{String => String}] 
        @linked_account_params = linked_account_params
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end
      # Deserialize a JSON object to an instance of ContactRequest
      #
      # @param json_object [JSON] 
      # @return [Accounting::ContactRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        name = struct.name
        is_supplier = struct.is_supplier
        is_customer = struct.is_customer
        email_address = struct.email_address
        tax_number = struct.tax_number
        status = struct.status.to_h.to_json()
        status = Accounting::ContactRequestStatus.from_json(json_object: status)
        currency = struct.currency
        company = struct.company
        addresses = struct.addresses.map() do | v |
  v = v.to_h.to_json()
  Accounting::ContactRequestAddressesItem.from_json(json_object: v)
end
        phone_numbers = struct.phone_numbers.map() do | v |
  v = v.to_h.to_json()
  Accounting::AccountingPhoneNumberRequest.from_json(json_object: v)
end
        integration_params = struct.integration_params
        linked_account_params = struct.linked_account_params
        new(name: name, is_supplier: is_supplier, is_customer: is_customer, email_address: email_address, tax_number: tax_number, status: status, currency: currency, company: company, addresses: addresses, phone_numbers: phone_numbers, integration_params: integration_params, linked_account_params: linked_account_params, additional_properties: struct)
      end
      # Serialize an instance of ContactRequest to a JSON object
      #
      # @return [JSON]
      def to_json
        { "name": @name, "is_supplier": @is_supplier, "is_customer": @is_customer, "email_address": @email_address, "tax_number": @tax_number, "status": @status, "currency": @currency, "company": @company, "addresses": @addresses, "phone_numbers": @phone_numbers, "integration_params": @integration_params, "linked_account_params": @linked_account_params }.to_json()
      end
      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object] 
      # @return [Void]
      def self.validate_raw(obj:)
        obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.is_supplier&.is_a?(Boolean) != false || raise("Passed value for field obj.is_supplier is not the expected type, validation failed.")
        obj.is_customer&.is_a?(Boolean) != false || raise("Passed value for field obj.is_customer is not the expected type, validation failed.")
        obj.email_address&.is_a?(String) != false || raise("Passed value for field obj.email_address is not the expected type, validation failed.")
        obj.tax_number&.is_a?(String) != false || raise("Passed value for field obj.tax_number is not the expected type, validation failed.")
        obj.status.nil?() || Accounting::ContactRequestStatus.validate_raw(obj: obj.status)
        obj.currency&.is_a?(String) != false || raise("Passed value for field obj.currency is not the expected type, validation failed.")
        obj.company&.is_a?(String) != false || raise("Passed value for field obj.company is not the expected type, validation failed.")
        obj.addresses&.is_a?(Array) != false || raise("Passed value for field obj.addresses is not the expected type, validation failed.")
        obj.phone_numbers&.is_a?(Array) != false || raise("Passed value for field obj.phone_numbers is not the expected type, validation failed.")
        obj.integration_params&.is_a?(Hash) != false || raise("Passed value for field obj.integration_params is not the expected type, validation failed.")
        obj.linked_account_params&.is_a?(Hash) != false || raise("Passed value for field obj.linked_account_params is not the expected type, validation failed.")
      end
    end
  end
end