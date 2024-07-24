# frozen_string_literal: true

require "ostruct"
require "json"

module Merge
  module Accounting
    # # The AccountingPhoneNumber Object
    #  ### Description
    #  The `AccountingPhoneNumber` object is used to represent a contact's or company's
    #  phone number.
    #  ### Usage Example
    #  Fetch from the `GET CompanyInfo` endpoint and view the company's phone numbers.
    class AccountingPhoneNumberRequest
      # @return [String] The phone number.
      attr_reader :number
      # @return [String] The phone number's type.
      attr_reader :type
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

      # @param number [String] The phone number.
      # @param type [String] The phone number's type.
      # @param integration_params [Hash{String => Object}]
      # @param linked_account_params [Hash{String => Object}]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Accounting::AccountingPhoneNumberRequest]
      def initialize(number: OMIT, type: OMIT, integration_params: OMIT, linked_account_params: OMIT,
                     additional_properties: nil)
        @number = number if number != OMIT
        @type = type if type != OMIT
        @integration_params = integration_params if integration_params != OMIT
        @linked_account_params = linked_account_params if linked_account_params != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "number": number,
          "type": type,
          "integration_params": integration_params,
          "linked_account_params": linked_account_params
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of AccountingPhoneNumberRequest
      #
      # @param json_object [String]
      # @return [Merge::Accounting::AccountingPhoneNumberRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        number = parsed_json["number"]
        type = parsed_json["type"]
        integration_params = parsed_json["integration_params"]
        linked_account_params = parsed_json["linked_account_params"]
        new(
          number: number,
          type: type,
          integration_params: integration_params,
          linked_account_params: linked_account_params,
          additional_properties: struct
        )
      end

      # Serialize an instance of AccountingPhoneNumberRequest to a JSON object
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
        obj.number&.is_a?(String) != false || raise("Passed value for field obj.number is not the expected type, validation failed.")
        obj.type&.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
        obj.integration_params&.is_a?(Hash) != false || raise("Passed value for field obj.integration_params is not the expected type, validation failed.")
        obj.linked_account_params&.is_a?(Hash) != false || raise("Passed value for field obj.linked_account_params is not the expected type, validation failed.")
      end
    end
  end
end
