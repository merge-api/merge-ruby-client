# frozen_string_literal: true

require "date"
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
    class PhoneNumber
      attr_reader :phone_number, :phone_number_type, :created_at, :modified_at, :additional_properties

      # @param phone_number [String] The phone number.
      # @param phone_number_type [String] The phone number's type.
      # @param created_at [DateTime]
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Crm::PhoneNumber]
      def initialize(phone_number: nil, phone_number_type: nil, created_at: nil, modified_at: nil,
                     additional_properties: nil)
        # @type [String] The phone number.
        @phone_number = phone_number
        # @type [String] The phone number's type.
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
      # @return [Crm::PhoneNumber]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        phone_number = struct.phone_number
        phone_number_type = struct.phone_number_type
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        new(phone_number: phone_number, phone_number_type: phone_number_type, created_at: created_at,
            modified_at: modified_at, additional_properties: struct)
      end

      # Serialize an instance of PhoneNumber to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "phone_number": @phone_number,
          "phone_number_type": @phone_number_type,
          "created_at": @created_at,
          "modified_at": @modified_at
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.phone_number&.is_a?(String) != false || raise("Passed value for field obj.phone_number is not the expected type, validation failed.")
        obj.phone_number_type&.is_a?(String) != false || raise("Passed value for field obj.phone_number_type is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
      end
    end
  end
end
