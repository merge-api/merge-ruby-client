# frozen_string_literal: true
require_relative "phone_number_request_phone_number_type"
require "json"

module Merge
  module Ats
    # # The PhoneNumber Object 
### Description

The `PhoneNumber` object is used to represent a candidate's phone number.

### Usage Example

Fetch from the `GET Candidate` endpoint and view their phone numbers.
    class PhoneNumberRequest
      attr_reader :value, :phone_number_type, :integration_params, :linked_account_params, :additional_properties
      # @param value [String] The phone number.
      # @param phone_number_type [Ats::PhoneNumberRequestPhoneNumberType] The type of phone number.  - `HOME` - HOME
- `WORK` - WORK
- `MOBILE` - MOBILE
- `SKYPE` - SKYPE
- `OTHER` - OTHER
      # @param integration_params [Hash{String => String}] 
      # @param linked_account_params [Hash{String => String}] 
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Ats::PhoneNumberRequest]
      def initialize(value: nil, phone_number_type: nil, integration_params: nil, linked_account_params: nil, additional_properties: nil)
        # @type [String] The phone number.
        @value = value
        # @type [Ats::PhoneNumberRequestPhoneNumberType] The type of phone number. 
- `HOME` - HOME
- `WORK` - WORK
- `MOBILE` - MOBILE
- `SKYPE` - SKYPE
- `OTHER` - OTHER
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
      # @return [Ats::PhoneNumberRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        value = struct.value
        phone_number_type = struct.phone_number_type.to_h.to_json()
        phone_number_type = Ats::PhoneNumberRequestPhoneNumberType.from_json(json_object: phone_number_type)
        integration_params = struct.integration_params
        linked_account_params = struct.linked_account_params
        new(value: value, phone_number_type: phone_number_type, integration_params: integration_params, linked_account_params: linked_account_params, additional_properties: struct)
      end
      # Serialize an instance of PhoneNumberRequest to a JSON object
      #
      # @return [JSON]
      def to_json
        { "value": @value, "phone_number_type": @phone_number_type, "integration_params": @integration_params, "linked_account_params": @linked_account_params }.to_json()
      end
      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object] 
      # @return [Void]
      def self.validate_raw(obj:)
        obj.value&.is_a?(String) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
        obj.phone_number_type.nil?() || Ats::PhoneNumberRequestPhoneNumberType.validate_raw(obj: obj.phone_number_type)
        obj.integration_params&.is_a?(Hash) != false || raise("Passed value for field obj.integration_params is not the expected type, validation failed.")
        obj.linked_account_params&.is_a?(Hash) != false || raise("Passed value for field obj.linked_account_params is not the expected type, validation failed.")
      end
    end
  end
end