# frozen_string_literal: true

require_relative "contact_request_account"
require "ostruct"
require "json"

module Merge
  module Ticketing
    # # The Contact Object
    #  ### Description
    #  The `Contact` object is used to represent the customer, lead, or external user
    #  that a ticket is associated with.
    #  ### Usage Example
    #  TODO
    class ContactRequest
      # @return [String] The contact's name.
      attr_reader :name
      # @return [String] The contact's email address.
      attr_reader :email_address
      # @return [String] The contact's phone number.
      attr_reader :phone_number
      # @return [String] The contact's details.
      attr_reader :details
      # @return [Merge::Ticketing::ContactRequestAccount] The contact's account.
      attr_reader :account
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
      # @param email_address [String] The contact's email address.
      # @param phone_number [String] The contact's phone number.
      # @param details [String] The contact's details.
      # @param account [Merge::Ticketing::ContactRequestAccount] The contact's account.
      # @param integration_params [Hash{String => Object}]
      # @param linked_account_params [Hash{String => Object}]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Ticketing::ContactRequest]
      def initialize(name: OMIT, email_address: OMIT, phone_number: OMIT, details: OMIT, account: OMIT,
                     integration_params: OMIT, linked_account_params: OMIT, additional_properties: nil)
        @name = name if name != OMIT
        @email_address = email_address if email_address != OMIT
        @phone_number = phone_number if phone_number != OMIT
        @details = details if details != OMIT
        @account = account if account != OMIT
        @integration_params = integration_params if integration_params != OMIT
        @linked_account_params = linked_account_params if linked_account_params != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "name": name,
          "email_address": email_address,
          "phone_number": phone_number,
          "details": details,
          "account": account,
          "integration_params": integration_params,
          "linked_account_params": linked_account_params
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of ContactRequest
      #
      # @param json_object [String]
      # @return [Merge::Ticketing::ContactRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        name = struct["name"]
        email_address = struct["email_address"]
        phone_number = struct["phone_number"]
        details = struct["details"]
        if parsed_json["account"].nil?
          account = nil
        else
          account = parsed_json["account"].to_json
          account = Merge::Ticketing::ContactRequestAccount.from_json(json_object: account)
        end
        integration_params = struct["integration_params"]
        linked_account_params = struct["linked_account_params"]
        new(
          name: name,
          email_address: email_address,
          phone_number: phone_number,
          details: details,
          account: account,
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
        obj.email_address&.is_a?(String) != false || raise("Passed value for field obj.email_address is not the expected type, validation failed.")
        obj.phone_number&.is_a?(String) != false || raise("Passed value for field obj.phone_number is not the expected type, validation failed.")
        obj.details&.is_a?(String) != false || raise("Passed value for field obj.details is not the expected type, validation failed.")
        obj.account.nil? || Merge::Ticketing::ContactRequestAccount.validate_raw(obj: obj.account)
        obj.integration_params&.is_a?(Hash) != false || raise("Passed value for field obj.integration_params is not the expected type, validation failed.")
        obj.linked_account_params&.is_a?(Hash) != false || raise("Passed value for field obj.linked_account_params is not the expected type, validation failed.")
      end
    end
  end
end
