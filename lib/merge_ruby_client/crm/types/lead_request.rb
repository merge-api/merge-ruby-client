# frozen_string_literal: true

require_relative "lead_request_owner"
require_relative "address_request"
require_relative "email_address_request"
require_relative "phone_number_request"
require "date"
require_relative "lead_request_converted_contact"
require_relative "lead_request_converted_account"
require_relative "remote_field_request"
require "json"

module Merge
  module Crm
    # # The Lead Object
    #
    # ### Description
    #
    # The `Lead` object is used to represent an individual who is a potential customer.
    #
    # ### Usage Example
    #
    # TODO
    class LeadRequest
      attr_reader :owner, :lead_source, :title, :company, :first_name, :last_name, :addresses, :email_addresses,
                  :phone_numbers, :converted_date, :converted_contact, :converted_account, :integration_params, :linked_account_params, :remote_fields, :additional_properties

      # @param owner [Crm::LeadRequestOwner] The lead's owner.
      # @param lead_source [String] The lead's source.
      # @param title [String] The lead's title.
      # @param company [String] The lead's company.
      # @param first_name [String] The lead's first name.
      # @param last_name [String] The lead's last name.
      # @param addresses [Array<Crm::AddressRequest>]
      # @param email_addresses [Array<Crm::EmailAddressRequest>]
      # @param phone_numbers [Array<Crm::PhoneNumberRequest>]
      # @param converted_date [DateTime] When the lead was converted.
      # @param converted_contact [Crm::LeadRequestConvertedContact] The contact of the converted lead.
      # @param converted_account [Crm::LeadRequestConvertedAccount] The account of the converted lead.
      # @param integration_params [Hash{String => String}]
      # @param linked_account_params [Hash{String => String}]
      # @param remote_fields [Array<Crm::RemoteFieldRequest>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Crm::LeadRequest]
      def initialize(owner: nil, lead_source: nil, title: nil, company: nil, first_name: nil, last_name: nil,
                     addresses: nil, email_addresses: nil, phone_numbers: nil, converted_date: nil, converted_contact: nil, converted_account: nil, integration_params: nil, linked_account_params: nil, remote_fields: nil, additional_properties: nil)
        # @type [Crm::LeadRequestOwner] The lead's owner.
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
        # @type [Array<Crm::AddressRequest>]
        @addresses = addresses
        # @type [Array<Crm::EmailAddressRequest>]
        @email_addresses = email_addresses
        # @type [Array<Crm::PhoneNumberRequest>]
        @phone_numbers = phone_numbers
        # @type [DateTime] When the lead was converted.
        @converted_date = converted_date
        # @type [Crm::LeadRequestConvertedContact] The contact of the converted lead.
        @converted_contact = converted_contact
        # @type [Crm::LeadRequestConvertedAccount] The account of the converted lead.
        @converted_account = converted_account
        # @type [Hash{String => String}]
        @integration_params = integration_params
        # @type [Hash{String => String}]
        @linked_account_params = linked_account_params
        # @type [Array<Crm::RemoteFieldRequest>]
        @remote_fields = remote_fields
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of LeadRequest
      #
      # @param json_object [JSON]
      # @return [Crm::LeadRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["owner"].nil?
          owner = nil
        else
          owner = parsed_json["owner"].to_json
          owner = Crm::LeadRequestOwner.from_json(json_object: owner)
        end
        lead_source = struct.lead_source
        title = struct.title
        company = struct.company
        first_name = struct.first_name
        last_name = struct.last_name
        addresses = parsed_json["addresses"]&.map do |v|
          v = v.to_json
          Crm::AddressRequest.from_json(json_object: v)
        end
        email_addresses = parsed_json["email_addresses"]&.map do |v|
          v = v.to_json
          Crm::EmailAddressRequest.from_json(json_object: v)
        end
        phone_numbers = parsed_json["phone_numbers"]&.map do |v|
          v = v.to_json
          Crm::PhoneNumberRequest.from_json(json_object: v)
        end
        converted_date = (DateTime.parse(parsed_json["converted_date"]) unless parsed_json["converted_date"].nil?)
        if parsed_json["converted_contact"].nil?
          converted_contact = nil
        else
          converted_contact = parsed_json["converted_contact"].to_json
          converted_contact = Crm::LeadRequestConvertedContact.from_json(json_object: converted_contact)
        end
        if parsed_json["converted_account"].nil?
          converted_account = nil
        else
          converted_account = parsed_json["converted_account"].to_json
          converted_account = Crm::LeadRequestConvertedAccount.from_json(json_object: converted_account)
        end
        integration_params = struct.integration_params
        linked_account_params = struct.linked_account_params
        remote_fields = parsed_json["remote_fields"]&.map do |v|
          v = v.to_json
          Crm::RemoteFieldRequest.from_json(json_object: v)
        end
        new(owner: owner, lead_source: lead_source, title: title, company: company, first_name: first_name,
            last_name: last_name, addresses: addresses, email_addresses: email_addresses, phone_numbers: phone_numbers, converted_date: converted_date, converted_contact: converted_contact, converted_account: converted_account, integration_params: integration_params, linked_account_params: linked_account_params, remote_fields: remote_fields, additional_properties: struct)
      end

      # Serialize an instance of LeadRequest to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "owner": @owner,
          "lead_source": @lead_source,
          "title": @title,
          "company": @company,
          "first_name": @first_name,
          "last_name": @last_name,
          "addresses": @addresses,
          "email_addresses": @email_addresses,
          "phone_numbers": @phone_numbers,
          "converted_date": @converted_date,
          "converted_contact": @converted_contact,
          "converted_account": @converted_account,
          "integration_params": @integration_params,
          "linked_account_params": @linked_account_params,
          "remote_fields": @remote_fields
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.owner.nil? || Crm::LeadRequestOwner.validate_raw(obj: obj.owner)
        obj.lead_source&.is_a?(String) != false || raise("Passed value for field obj.lead_source is not the expected type, validation failed.")
        obj.title&.is_a?(String) != false || raise("Passed value for field obj.title is not the expected type, validation failed.")
        obj.company&.is_a?(String) != false || raise("Passed value for field obj.company is not the expected type, validation failed.")
        obj.first_name&.is_a?(String) != false || raise("Passed value for field obj.first_name is not the expected type, validation failed.")
        obj.last_name&.is_a?(String) != false || raise("Passed value for field obj.last_name is not the expected type, validation failed.")
        obj.addresses&.is_a?(Array) != false || raise("Passed value for field obj.addresses is not the expected type, validation failed.")
        obj.email_addresses&.is_a?(Array) != false || raise("Passed value for field obj.email_addresses is not the expected type, validation failed.")
        obj.phone_numbers&.is_a?(Array) != false || raise("Passed value for field obj.phone_numbers is not the expected type, validation failed.")
        obj.converted_date&.is_a?(DateTime) != false || raise("Passed value for field obj.converted_date is not the expected type, validation failed.")
        obj.converted_contact.nil? || Crm::LeadRequestConvertedContact.validate_raw(obj: obj.converted_contact)
        obj.converted_account.nil? || Crm::LeadRequestConvertedAccount.validate_raw(obj: obj.converted_account)
        obj.integration_params&.is_a?(Hash) != false || raise("Passed value for field obj.integration_params is not the expected type, validation failed.")
        obj.linked_account_params&.is_a?(Hash) != false || raise("Passed value for field obj.linked_account_params is not the expected type, validation failed.")
        obj.remote_fields&.is_a?(Array) != false || raise("Passed value for field obj.remote_fields is not the expected type, validation failed.")
      end
    end
  end
end
