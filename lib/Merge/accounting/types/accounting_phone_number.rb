# frozen_string_literal: true
require "date"
require "date"
require "json"

module Merge
  module Accounting
    # # The AccountingPhoneNumber Object 
### Description

The `AccountingPhoneNumber` object is used to represent a contact's or company's phone number.

### Usage Example

Fetch from the `GET CompanyInfo` endpoint and view the company's phone numbers.
    class AccountingPhoneNumber
      attr_reader :number, :type, :created_at, :modified_at, :additional_properties
      # @param number [String] The phone number.
      # @param type [String] The phone number's type.
      # @param created_at [DateTime] 
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Accounting::AccountingPhoneNumber]
      def initialize(number: nil, type: nil, created_at: nil, modified_at: nil, additional_properties: nil)
        # @type [String] The phone number.
        @number = number
        # @type [String] The phone number's type.
        @type = type
        # @type [DateTime] 
        @created_at = created_at
        # @type [DateTime] This is the datetime that this object was last updated by Merge
        @modified_at = modified_at
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end
      # Deserialize a JSON object to an instance of AccountingPhoneNumber
      #
      # @param json_object [JSON] 
      # @return [Accounting::AccountingPhoneNumber]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        number = struct.number
        type = struct.type
        created_at = DateTime.parse(struct.created_at)
        modified_at = DateTime.parse(struct.modified_at)
        new(number: number, type: type, created_at: created_at, modified_at: modified_at, additional_properties: struct)
      end
      # Serialize an instance of AccountingPhoneNumber to a JSON object
      #
      # @return [JSON]
      def to_json
        { "number": @number, "type": @type, "created_at": @created_at, "modified_at": @modified_at }.to_json()
      end
      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object] 
      # @return [Void]
      def self.validate_raw(obj:)
        obj.number&.is_a?(String) != false || raise("Passed value for field obj.number is not the expected type, validation failed.")
        obj.type&.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
      end
    end
  end
end