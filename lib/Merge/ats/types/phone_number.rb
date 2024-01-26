# frozen_string_literal: true
require_relative "phone_number_phone_number_type"
require "date"
require "date"
require "json"

module Merge
  module Ats
    # # The PhoneNumber Object 
### Description

The `PhoneNumber` object is used to represent a candidate's phone number.

### Usage Example

Fetch from the `GET Candidate` endpoint and view their phone numbers.
    class PhoneNumber
      attr_reader :value, :phone_number_type, :created_at, :modified_at, :additional_properties
      # @param value [String] The phone number.
      # @param phone_number_type [Ats::PhoneNumberPhoneNumberType] The type of phone number.  - `HOME` - HOME
- `WORK` - WORK
- `MOBILE` - MOBILE
- `SKYPE` - SKYPE
- `OTHER` - OTHER
      # @param created_at [DateTime] 
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Ats::PhoneNumber]
      def initialize(value: nil, phone_number_type: nil, created_at: nil, modified_at: nil, additional_properties: nil)
        # @type [String] The phone number.
        @value = value
        # @type [Ats::PhoneNumberPhoneNumberType] The type of phone number. 
- `HOME` - HOME
- `WORK` - WORK
- `MOBILE` - MOBILE
- `SKYPE` - SKYPE
- `OTHER` - OTHER
        @phone_number_type = phone_number_type
        # @type [DateTime] 
        @created_at = created_at
        # @type [DateTime] This is the datetime that this object was last updated by Merge
        @modified_at = modified_at
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end
      # Deserialize a JSON object to an instance of PhoneNumber
      #
      # @param json_object [JSON] 
      # @return [Ats::PhoneNumber]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        value = struct.value
        phone_number_type = struct.phone_number_type.to_h.to_json()
        phone_number_type = Ats::PhoneNumberPhoneNumberType.from_json(json_object: phone_number_type)
        created_at = DateTime.parse(struct.created_at)
        modified_at = DateTime.parse(struct.modified_at)
        new(value: value, phone_number_type: phone_number_type, created_at: created_at, modified_at: modified_at, additional_properties: struct)
      end
      # Serialize an instance of PhoneNumber to a JSON object
      #
      # @return [JSON]
      def to_json
        { "value": @value, "phone_number_type": @phone_number_type, "created_at": @created_at, "modified_at": @modified_at }.to_json()
      end
      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object] 
      # @return [Void]
      def self.validate_raw(obj:)
        obj.value&.is_a?(String) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
        obj.phone_number_type.nil?() || Ats::PhoneNumberPhoneNumberType.validate_raw(obj: obj.phone_number_type)
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
      end
    end
  end
end