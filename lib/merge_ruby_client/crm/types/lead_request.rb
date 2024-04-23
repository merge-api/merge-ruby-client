# frozen_string_literal: true

require_relative "lead_request_owner"
require_relative "address_request"
require_relative "email_address_request"
require_relative "phone_number_request"
require "date"
require_relative "lead_request_converted_contact"
require_relative "lead_request_converted_account"
require_relative "remote_field_request"
require "ostruct"
require "json"

module Merge
  module Crm
    # # The Lead Object
    #  ### Description
    #  The `Lead` object is used to represent an individual who is a potential
    #  customer.
    #  ### Usage Example
    #  TODO
    class LeadRequest
      # @return [Merge::Crm::LeadRequestOwner] The lead's owner.
      attr_reader :owner
      # @return [String] The lead's source.
      attr_reader :lead_source
      # @return [String] The lead's title.
      attr_reader :title
      # @return [String] The lead's company.
      attr_reader :company
      # @return [String] The lead's first name.
      attr_reader :first_name
      # @return [String] The lead's last name.
      attr_reader :last_name
      # @return [Array<Merge::Crm::AddressRequest>]
      attr_reader :addresses
      # @return [Array<Merge::Crm::EmailAddressRequest>]
      attr_reader :email_addresses
      # @return [Array<Merge::Crm::PhoneNumberRequest>]
      attr_reader :phone_numbers
      # @return [DateTime] When the lead was converted.
      attr_reader :converted_date
      # @return [Merge::Crm::LeadRequestConvertedContact] The contact of the converted lead.
      attr_reader :converted_contact
      # @return [Merge::Crm::LeadRequestConvertedAccount] The account of the converted lead.
      attr_reader :converted_account
      # @return [Hash{String => Object}]
      attr_reader :integration_params
      # @return [Hash{String => Object}]
      attr_reader :linked_account_params
      # @return [Array<Merge::Crm::RemoteFieldRequest>]
      attr_reader :remote_fields
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param owner [Merge::Crm::LeadRequestOwner] The lead's owner.
      # @param lead_source [String] The lead's source.
      # @param title [String] The lead's title.
      # @param company [String] The lead's company.
      # @param first_name [String] The lead's first name.
      # @param last_name [String] The lead's last name.
      # @param addresses [Array<Merge::Crm::AddressRequest>]
      # @param email_addresses [Array<Merge::Crm::EmailAddressRequest>]
      # @param phone_numbers [Array<Merge::Crm::PhoneNumberRequest>]
      # @param converted_date [DateTime] When the lead was converted.
      # @param converted_contact [Merge::Crm::LeadRequestConvertedContact] The contact of the converted lead.
      # @param converted_account [Merge::Crm::LeadRequestConvertedAccount] The account of the converted lead.
      # @param integration_params [Hash{String => Object}]
      # @param linked_account_params [Hash{String => Object}]
      # @param remote_fields [Array<Merge::Crm::RemoteFieldRequest>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Crm::LeadRequest]
      def initialize(owner: OMIT, lead_source: OMIT, title: OMIT, company: OMIT, first_name: OMIT, last_name: OMIT,
                     addresses: OMIT, email_addresses: OMIT, phone_numbers: OMIT, converted_date: OMIT, converted_contact: OMIT, converted_account: OMIT, integration_params: OMIT, linked_account_params: OMIT, remote_fields: OMIT, additional_properties: nil)
        @owner = owner if owner != OMIT
        @lead_source = lead_source if lead_source != OMIT
        @title = title if title != OMIT
        @company = company if company != OMIT
        @first_name = first_name if first_name != OMIT
        @last_name = last_name if last_name != OMIT
        @addresses = addresses if addresses != OMIT
        @email_addresses = email_addresses if email_addresses != OMIT
        @phone_numbers = phone_numbers if phone_numbers != OMIT
        @converted_date = converted_date if converted_date != OMIT
        @converted_contact = converted_contact if converted_contact != OMIT
        @converted_account = converted_account if converted_account != OMIT
        @integration_params = integration_params if integration_params != OMIT
        @linked_account_params = linked_account_params if linked_account_params != OMIT
        @remote_fields = remote_fields if remote_fields != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "owner": owner,
          "lead_source": lead_source,
          "title": title,
          "company": company,
          "first_name": first_name,
          "last_name": last_name,
          "addresses": addresses,
          "email_addresses": email_addresses,
          "phone_numbers": phone_numbers,
          "converted_date": converted_date,
          "converted_contact": converted_contact,
          "converted_account": converted_account,
          "integration_params": integration_params,
          "linked_account_params": linked_account_params,
          "remote_fields": remote_fields
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of LeadRequest
      #
      # @param json_object [String]
      # @return [Merge::Crm::LeadRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["owner"].nil?
          owner = nil
        else
          owner = parsed_json["owner"].to_json
          owner = Merge::Crm::LeadRequestOwner.from_json(json_object: owner)
        end
        lead_source = struct["lead_source"]
        title = struct["title"]
        company = struct["company"]
        first_name = struct["first_name"]
        last_name = struct["last_name"]
        addresses = parsed_json["addresses"]&.map do |v|
          v = v.to_json
          Merge::Crm::AddressRequest.from_json(json_object: v)
        end
        email_addresses = parsed_json["email_addresses"]&.map do |v|
          v = v.to_json
          Merge::Crm::EmailAddressRequest.from_json(json_object: v)
        end
        phone_numbers = parsed_json["phone_numbers"]&.map do |v|
          v = v.to_json
          Merge::Crm::PhoneNumberRequest.from_json(json_object: v)
        end
        converted_date = (DateTime.parse(parsed_json["converted_date"]) unless parsed_json["converted_date"].nil?)
        if parsed_json["converted_contact"].nil?
          converted_contact = nil
        else
          converted_contact = parsed_json["converted_contact"].to_json
          converted_contact = Merge::Crm::LeadRequestConvertedContact.from_json(json_object: converted_contact)
        end
        if parsed_json["converted_account"].nil?
          converted_account = nil
        else
          converted_account = parsed_json["converted_account"].to_json
          converted_account = Merge::Crm::LeadRequestConvertedAccount.from_json(json_object: converted_account)
        end
        integration_params = struct["integration_params"]
        linked_account_params = struct["linked_account_params"]
        remote_fields = parsed_json["remote_fields"]&.map do |v|
          v = v.to_json
          Merge::Crm::RemoteFieldRequest.from_json(json_object: v)
        end
        new(
          owner: owner,
          lead_source: lead_source,
          title: title,
          company: company,
          first_name: first_name,
          last_name: last_name,
          addresses: addresses,
          email_addresses: email_addresses,
          phone_numbers: phone_numbers,
          converted_date: converted_date,
          converted_contact: converted_contact,
          converted_account: converted_account,
          integration_params: integration_params,
          linked_account_params: linked_account_params,
          remote_fields: remote_fields,
          additional_properties: struct
        )
      end

      # Serialize an instance of LeadRequest to a JSON object
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
        obj.owner.nil? || Merge::Crm::LeadRequestOwner.validate_raw(obj: obj.owner)
        obj.lead_source&.is_a?(String) != false || raise("Passed value for field obj.lead_source is not the expected type, validation failed.")
        obj.title&.is_a?(String) != false || raise("Passed value for field obj.title is not the expected type, validation failed.")
        obj.company&.is_a?(String) != false || raise("Passed value for field obj.company is not the expected type, validation failed.")
        obj.first_name&.is_a?(String) != false || raise("Passed value for field obj.first_name is not the expected type, validation failed.")
        obj.last_name&.is_a?(String) != false || raise("Passed value for field obj.last_name is not the expected type, validation failed.")
        obj.addresses&.is_a?(Array) != false || raise("Passed value for field obj.addresses is not the expected type, validation failed.")
        obj.email_addresses&.is_a?(Array) != false || raise("Passed value for field obj.email_addresses is not the expected type, validation failed.")
        obj.phone_numbers&.is_a?(Array) != false || raise("Passed value for field obj.phone_numbers is not the expected type, validation failed.")
        obj.converted_date&.is_a?(DateTime) != false || raise("Passed value for field obj.converted_date is not the expected type, validation failed.")
        obj.converted_contact.nil? || Merge::Crm::LeadRequestConvertedContact.validate_raw(obj: obj.converted_contact)
        obj.converted_account.nil? || Merge::Crm::LeadRequestConvertedAccount.validate_raw(obj: obj.converted_account)
        obj.integration_params&.is_a?(Hash) != false || raise("Passed value for field obj.integration_params is not the expected type, validation failed.")
        obj.linked_account_params&.is_a?(Hash) != false || raise("Passed value for field obj.linked_account_params is not the expected type, validation failed.")
        obj.remote_fields&.is_a?(Array) != false || raise("Passed value for field obj.remote_fields is not the expected type, validation failed.")
      end
    end
  end
end
