# frozen_string_literal: true

require_relative "status_7_d_1_enum"
require_relative "contact_request_addresses_item"
require_relative "accounting_phone_number_request"
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
    class ContactRequest
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
      # @return [String] The company the contact belongs to.
      attr_reader :company
      # @return [Array<Merge::Accounting::ContactRequestAddressesItem>] `Address` object IDs for the given `Contacts` object.
      attr_reader :addresses
      # @return [Array<Merge::Accounting::AccountingPhoneNumberRequest>] `AccountingPhoneNumber` object for the given `Contacts` object.
      attr_reader :phone_numbers
      # @return [Hash{String => Object}]
      attr_reader :integration_params
      # @return [Hash{String => Object}]
      attr_reader :linked_account_params
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param name [String] The contact's name.
      # @param is_supplier [Boolean] Whether the contact is a supplier.
      # @param is_customer [Boolean] Whether the contact is a customer.
      # @param email_address [String] The contact's email address.
      # @param tax_number [String] The contact's tax number.
      # @param status [Merge::Accounting::Status7D1Enum] The contact's status
      #  - `ACTIVE` - ACTIVE
      #  - `ARCHIVED` - ARCHIVED
      # @param currency [String] The currency the contact's transactions are in.
      # @param company [String] The company the contact belongs to.
      # @param addresses [Array<Merge::Accounting::ContactRequestAddressesItem>] `Address` object IDs for the given `Contacts` object.
      # @param phone_numbers [Array<Merge::Accounting::AccountingPhoneNumberRequest>] `AccountingPhoneNumber` object for the given `Contacts` object.
      # @param integration_params [Hash{String => Object}]
      # @param linked_account_params [Hash{String => Object}]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Accounting::ContactRequest]
      def initialize(name: OMIT, is_supplier: OMIT, is_customer: OMIT, email_address: OMIT, tax_number: OMIT,
                     status: OMIT, currency: OMIT, company: OMIT, addresses: OMIT, phone_numbers: OMIT, integration_params: OMIT, linked_account_params: OMIT, additional_properties: nil)
        @name = name if name != OMIT
        @is_supplier = is_supplier if is_supplier != OMIT
        @is_customer = is_customer if is_customer != OMIT
        @email_address = email_address if email_address != OMIT
        @tax_number = tax_number if tax_number != OMIT
        @status = status if status != OMIT
        @currency = currency if currency != OMIT
        @company = company if company != OMIT
        @addresses = addresses if addresses != OMIT
        @phone_numbers = phone_numbers if phone_numbers != OMIT
        @integration_params = integration_params if integration_params != OMIT
        @linked_account_params = linked_account_params if linked_account_params != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "name": name,
          "is_supplier": is_supplier,
          "is_customer": is_customer,
          "email_address": email_address,
          "tax_number": tax_number,
          "status": status,
          "currency": currency,
          "company": company,
          "addresses": addresses,
          "phone_numbers": phone_numbers,
          "integration_params": integration_params,
          "linked_account_params": linked_account_params
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of ContactRequest
      #
      # @param json_object [String]
      # @return [Merge::Accounting::ContactRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        name = parsed_json["name"]
        is_supplier = parsed_json["is_supplier"]
        is_customer = parsed_json["is_customer"]
        email_address = parsed_json["email_address"]
        tax_number = parsed_json["tax_number"]
        status = parsed_json["status"]
        currency = parsed_json["currency"]
        company = parsed_json["company"]
        addresses = parsed_json["addresses"]&.map do |item|
          item = item.to_json
          Merge::Accounting::ContactRequestAddressesItem.from_json(json_object: item)
        end
        phone_numbers = parsed_json["phone_numbers"]&.map do |item|
          item = item.to_json
          Merge::Accounting::AccountingPhoneNumberRequest.from_json(json_object: item)
        end
        integration_params = parsed_json["integration_params"]
        linked_account_params = parsed_json["linked_account_params"]
        new(
          name: name,
          is_supplier: is_supplier,
          is_customer: is_customer,
          email_address: email_address,
          tax_number: tax_number,
          status: status,
          currency: currency,
          company: company,
          addresses: addresses,
          phone_numbers: phone_numbers,
          integration_params: integration_params,
          linked_account_params: linked_account_params,
          additional_properties: struct
        )
      end

      # Serialize an instance of ContactRequest to a JSON object
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
        obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.is_supplier&.is_a?(Boolean) != false || raise("Passed value for field obj.is_supplier is not the expected type, validation failed.")
        obj.is_customer&.is_a?(Boolean) != false || raise("Passed value for field obj.is_customer is not the expected type, validation failed.")
        obj.email_address&.is_a?(String) != false || raise("Passed value for field obj.email_address is not the expected type, validation failed.")
        obj.tax_number&.is_a?(String) != false || raise("Passed value for field obj.tax_number is not the expected type, validation failed.")
        obj.status&.is_a?(Merge::Accounting::Status7D1Enum) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
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
