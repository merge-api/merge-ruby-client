# frozen_string_literal: true

require_relative "email_address_request_email_address_type"
require "json"

module Merge
  module Ats
    # # The EmailAddress Object
    #
    # ### Description
    #
    # The `EmailAddress` object is used to represent a candidate's email address.
    #
    # ### Usage Example
    #
    # Fetch from the `GET Candidate` endpoint and view their email addresses.
    class EmailAddressRequest
      attr_reader :value, :email_address_type, :integration_params, :linked_account_params, :additional_properties

      # @param value [String] The email address.
      # @param email_address_type [Ats::EmailAddressRequestEmailAddressType] The type of email address.
      #   - `PERSONAL` - PERSONAL
      #   - `WORK` - WORK
      #   - `OTHER` - OTHER
      # @param integration_params [Hash{String => String}]
      # @param linked_account_params [Hash{String => String}]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Ats::EmailAddressRequest]
      def initialize(value: nil, email_address_type: nil, integration_params: nil, linked_account_params: nil,
                     additional_properties: nil)
        # @type [String] The email address.
        @value = value
        # @type [Ats::EmailAddressRequestEmailAddressType] The type of email address.
        #   - `PERSONAL` - PERSONAL
        #   - `WORK` - WORK
        #   - `OTHER` - OTHER
        @email_address_type = email_address_type
        # @type [Hash{String => String}]
        @integration_params = integration_params
        # @type [Hash{String => String}]
        @linked_account_params = linked_account_params
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of EmailAddressRequest
      #
      # @param json_object [JSON]
      # @return [Ats::EmailAddressRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        value = struct.value
        if parsed_json["email_address_type"].nil?
          email_address_type = nil
        else
          email_address_type = parsed_json["email_address_type"].to_json
          email_address_type = Ats::EmailAddressRequestEmailAddressType.from_json(json_object: email_address_type)
        end
        integration_params = struct.integration_params
        linked_account_params = struct.linked_account_params
        new(value: value, email_address_type: email_address_type, integration_params: integration_params,
            linked_account_params: linked_account_params, additional_properties: struct)
      end

      # Serialize an instance of EmailAddressRequest to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "value": @value,
          "email_address_type": @email_address_type,
          "integration_params": @integration_params,
          "linked_account_params": @linked_account_params
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.value&.is_a?(String) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
        obj.email_address_type.nil? || Ats::EmailAddressRequestEmailAddressType.validate_raw(obj: obj.email_address_type)
        obj.integration_params&.is_a?(Hash) != false || raise("Passed value for field obj.integration_params is not the expected type, validation failed.")
        obj.linked_account_params&.is_a?(Hash) != false || raise("Passed value for field obj.linked_account_params is not the expected type, validation failed.")
      end
    end
  end
end
