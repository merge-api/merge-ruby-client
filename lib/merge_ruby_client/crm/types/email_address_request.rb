# frozen_string_literal: true

require "ostruct"
require "json"

module Merge
  module Crm
    # # The EmailAddress Object
    #  ### Description
    #  The `EmailAddress` object is used to represent an entity's email address.
    #  ### Usage Example
    #  Fetch from the `GET Contact` endpoint and view their email addresses.
    class EmailAddressRequest
      # @return [String] The email address.
      attr_reader :email_address
      # @return [String] The email address's type.
      attr_reader :email_address_type
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

      # @param email_address [String] The email address.
      # @param email_address_type [String] The email address's type.
      # @param integration_params [Hash{String => Object}]
      # @param linked_account_params [Hash{String => Object}]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Crm::EmailAddressRequest]
      def initialize(email_address: OMIT, email_address_type: OMIT, integration_params: OMIT,
                     linked_account_params: OMIT, additional_properties: nil)
        @email_address = email_address if email_address != OMIT
        @email_address_type = email_address_type if email_address_type != OMIT
        @integration_params = integration_params if integration_params != OMIT
        @linked_account_params = linked_account_params if linked_account_params != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "email_address": email_address,
          "email_address_type": email_address_type,
          "integration_params": integration_params,
          "linked_account_params": linked_account_params
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of EmailAddressRequest
      #
      # @param json_object [String]
      # @return [Merge::Crm::EmailAddressRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        email_address = struct["email_address"]
        email_address_type = struct["email_address_type"]
        integration_params = struct["integration_params"]
        linked_account_params = struct["linked_account_params"]
        new(
          email_address: email_address,
          email_address_type: email_address_type,
          integration_params: integration_params,
          linked_account_params: linked_account_params,
          additional_properties: struct
        )
      end

      # Serialize an instance of EmailAddressRequest to a JSON object
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
        obj.email_address&.is_a?(String) != false || raise("Passed value for field obj.email_address is not the expected type, validation failed.")
        obj.email_address_type&.is_a?(String) != false || raise("Passed value for field obj.email_address_type is not the expected type, validation failed.")
        obj.integration_params&.is_a?(Hash) != false || raise("Passed value for field obj.integration_params is not the expected type, validation failed.")
        obj.linked_account_params&.is_a?(Hash) != false || raise("Passed value for field obj.linked_account_params is not the expected type, validation failed.")
      end
    end
  end
end
