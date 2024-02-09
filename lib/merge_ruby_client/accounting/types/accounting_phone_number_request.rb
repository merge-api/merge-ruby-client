# frozen_string_literal: true

require "json"

module Merge
  module Accounting
    # # The AccountingPhoneNumber Object
    #
    # ### Description
    #
    # The `AccountingPhoneNumber` object is used to represent a contact's or company's phone number.
    #
    # ### Usage Example
    #
    # Fetch from the `GET CompanyInfo` endpoint and view the company's phone numbers.
    class AccountingPhoneNumberRequest
      attr_reader :number, :type, :integration_params, :linked_account_params, :additional_properties

      # @param number [String] The phone number.
      # @param type [String] The phone number's type.
      # @param integration_params [Hash{String => String}]
      # @param linked_account_params [Hash{String => String}]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Accounting::AccountingPhoneNumberRequest]
      def initialize(number: nil, type: nil, integration_params: nil, linked_account_params: nil,
                     additional_properties: nil)
        # @type [String] The phone number.
        @number = number
        # @type [String] The phone number's type.
        @type = type
        # @type [Hash{String => String}]
        @integration_params = integration_params
        # @type [Hash{String => String}]
        @linked_account_params = linked_account_params
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of AccountingPhoneNumberRequest
      #
      # @param json_object [JSON]
      # @return [Accounting::AccountingPhoneNumberRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        number = struct.number
        type = struct.type
        integration_params = struct.integration_params
        linked_account_params = struct.linked_account_params
        new(number: number, type: type, integration_params: integration_params,
            linked_account_params: linked_account_params, additional_properties: struct)
      end

      # Serialize an instance of AccountingPhoneNumberRequest to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "number": @number,
          "type": @type,
          "integration_params": @integration_params,
          "linked_account_params": @linked_account_params
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.number&.is_a?(String) != false || raise("Passed value for field obj.number is not the expected type, validation failed.")
        obj.type&.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
        obj.integration_params&.is_a?(Hash) != false || raise("Passed value for field obj.integration_params is not the expected type, validation failed.")
        obj.linked_account_params&.is_a?(Hash) != false || raise("Passed value for field obj.linked_account_params is not the expected type, validation failed.")
      end
    end
  end
end
