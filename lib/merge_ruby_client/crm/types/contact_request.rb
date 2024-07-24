# frozen_string_literal: true

require_relative "contact_request_account"
require_relative "contact_request_owner"
require_relative "address_request"
require_relative "email_address_request"
require_relative "phone_number_request"
require "date"
require_relative "remote_field_request"
require "ostruct"
require "json"

module Merge
  module Crm
    # # The Contact Object
    #  ### Description
    #  The `Contact` object is used to represent an existing point of contact at a
    #  company in a CRM system.
    #  ### Usage Example
    #  TODO
    class ContactRequest
      # @return [String] The contact's first name.
      attr_reader :first_name
      # @return [String] The contact's last name.
      attr_reader :last_name
      # @return [Merge::Crm::ContactRequestAccount] The contact's account.
      attr_reader :account
      # @return [Merge::Crm::ContactRequestOwner] The contact's owner.
      attr_reader :owner
      # @return [Array<Merge::Crm::AddressRequest>]
      attr_reader :addresses
      # @return [Array<Merge::Crm::EmailAddressRequest>]
      attr_reader :email_addresses
      # @return [Array<Merge::Crm::PhoneNumberRequest>]
      attr_reader :phone_numbers
      # @return [DateTime] When the contact's last activity occurred.
      attr_reader :last_activity_at
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

      # @param first_name [String] The contact's first name.
      # @param last_name [String] The contact's last name.
      # @param account [Merge::Crm::ContactRequestAccount] The contact's account.
      # @param owner [Merge::Crm::ContactRequestOwner] The contact's owner.
      # @param addresses [Array<Merge::Crm::AddressRequest>]
      # @param email_addresses [Array<Merge::Crm::EmailAddressRequest>]
      # @param phone_numbers [Array<Merge::Crm::PhoneNumberRequest>]
      # @param last_activity_at [DateTime] When the contact's last activity occurred.
      # @param integration_params [Hash{String => Object}]
      # @param linked_account_params [Hash{String => Object}]
      # @param remote_fields [Array<Merge::Crm::RemoteFieldRequest>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Crm::ContactRequest]
      def initialize(first_name: OMIT, last_name: OMIT, account: OMIT, owner: OMIT, addresses: OMIT,
                     email_addresses: OMIT, phone_numbers: OMIT, last_activity_at: OMIT, integration_params: OMIT, linked_account_params: OMIT, remote_fields: OMIT, additional_properties: nil)
        @first_name = first_name if first_name != OMIT
        @last_name = last_name if last_name != OMIT
        @account = account if account != OMIT
        @owner = owner if owner != OMIT
        @addresses = addresses if addresses != OMIT
        @email_addresses = email_addresses if email_addresses != OMIT
        @phone_numbers = phone_numbers if phone_numbers != OMIT
        @last_activity_at = last_activity_at if last_activity_at != OMIT
        @integration_params = integration_params if integration_params != OMIT
        @linked_account_params = linked_account_params if linked_account_params != OMIT
        @remote_fields = remote_fields if remote_fields != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "first_name": first_name,
          "last_name": last_name,
          "account": account,
          "owner": owner,
          "addresses": addresses,
          "email_addresses": email_addresses,
          "phone_numbers": phone_numbers,
          "last_activity_at": last_activity_at,
          "integration_params": integration_params,
          "linked_account_params": linked_account_params,
          "remote_fields": remote_fields
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of ContactRequest
      #
      # @param json_object [String]
      # @return [Merge::Crm::ContactRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        first_name = parsed_json["first_name"]
        last_name = parsed_json["last_name"]
        if parsed_json["account"].nil?
          account = nil
        else
          account = parsed_json["account"].to_json
          account = Merge::Crm::ContactRequestAccount.from_json(json_object: account)
        end
        if parsed_json["owner"].nil?
          owner = nil
        else
          owner = parsed_json["owner"].to_json
          owner = Merge::Crm::ContactRequestOwner.from_json(json_object: owner)
        end
        addresses = parsed_json["addresses"]&.map do |item|
          item = item.to_json
          Merge::Crm::AddressRequest.from_json(json_object: item)
        end
        email_addresses = parsed_json["email_addresses"]&.map do |item|
          item = item.to_json
          Merge::Crm::EmailAddressRequest.from_json(json_object: item)
        end
        phone_numbers = parsed_json["phone_numbers"]&.map do |item|
          item = item.to_json
          Merge::Crm::PhoneNumberRequest.from_json(json_object: item)
        end
        last_activity_at = (DateTime.parse(parsed_json["last_activity_at"]) unless parsed_json["last_activity_at"].nil?)
        integration_params = parsed_json["integration_params"]
        linked_account_params = parsed_json["linked_account_params"]
        remote_fields = parsed_json["remote_fields"]&.map do |item|
          item = item.to_json
          Merge::Crm::RemoteFieldRequest.from_json(json_object: item)
        end
        new(
          first_name: first_name,
          last_name: last_name,
          account: account,
          owner: owner,
          addresses: addresses,
          email_addresses: email_addresses,
          phone_numbers: phone_numbers,
          last_activity_at: last_activity_at,
          integration_params: integration_params,
          linked_account_params: linked_account_params,
          remote_fields: remote_fields,
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
        obj.first_name&.is_a?(String) != false || raise("Passed value for field obj.first_name is not the expected type, validation failed.")
        obj.last_name&.is_a?(String) != false || raise("Passed value for field obj.last_name is not the expected type, validation failed.")
        obj.account.nil? || Merge::Crm::ContactRequestAccount.validate_raw(obj: obj.account)
        obj.owner.nil? || Merge::Crm::ContactRequestOwner.validate_raw(obj: obj.owner)
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
