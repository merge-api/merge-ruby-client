# frozen_string_literal: true

require "json"

module Merge
  module Crm
    # # The PhoneNumber Object
    #
    # ### Description
    #
    # The `PhoneNumber` object is used to represent an entity's phone number.
    #
    # ### Usage Example
    #
    # Fetch from the `GET Contact` endpoint and view their phone numbers.
    class PhoneNumberRequest
      attr_reader :phone_number, :phone_number_type, :integration_params, :linked_account_params, :additional_properties

      # @param phone_number [String] The phone number.
      # @param phone_number_type [String] The phone number's type.
      # @param integration_params [Hash{String => String}]
      # @param linked_account_params [Hash{String => String}]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Crm::PhoneNumberRequest]
      def initialize(phone_number: nil, phone_number_type: nil, integration_params: nil, linked_account_params: nil,
                     additional_properties: nil)
        # @type [String] The phone number.
        @phone_number = phone_number
        # @type [String] The phone number's type.
        @phone_number_type = phone_number_type
        # @type [Hash{String => String}]
        @integration_params = integration_params
        # @type [Hash{String => String}]
        @linked_account_params = linked_account_params
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of PhoneNumberRequest
      #
      # @param json_object [JSON]
      # @return [Crm::PhoneNumberRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        phone_number = struct.phone_number
        phone_number_type = struct.phone_number_type
        integration_params = struct.integration_params
        linked_account_params = struct.linked_account_params
        new(phone_number: phone_number, phone_number_type: phone_number_type, integration_params: integration_params,
            linked_account_params: linked_account_params, additional_properties: struct)
      end

      # Serialize an instance of PhoneNumberRequest to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "phone_number": @phone_number,
          "phone_number_type": @phone_number_type,
          "integration_params": @integration_params,
          "linked_account_params": @linked_account_params
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.phone_number&.is_a?(String) != false || raise("Passed value for field obj.phone_number is not the expected type, validation failed.")
        obj.phone_number_type&.is_a?(String) != false || raise("Passed value for field obj.phone_number_type is not the expected type, validation failed.")
        obj.integration_params&.is_a?(Hash) != false || raise("Passed value for field obj.integration_params is not the expected type, validation failed.")
        obj.linked_account_params&.is_a?(Hash) != false || raise("Passed value for field obj.linked_account_params is not the expected type, validation failed.")
      end
    end
  end
end
