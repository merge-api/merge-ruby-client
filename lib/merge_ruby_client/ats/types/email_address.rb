# frozen_string_literal: true

require_relative "email_address_type_enum"
require "date"
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
    class EmailAddress
      attr_reader :value, :email_address_type, :created_at, :modified_at, :additional_properties

      # @param value [String] The email address.
      # @param email_address_type [EMAIL_ADDRESS_TYPE_ENUM] The type of email address.
      #   - `PERSONAL` - PERSONAL
      #   - `WORK` - WORK
      #   - `OTHER` - OTHER
      # @param created_at [DateTime]
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Ats::EmailAddress]
      def initialize(value: nil, email_address_type: nil, created_at: nil, modified_at: nil, additional_properties: nil)
        # @type [String] The email address.
        @value = value
        # @type [EMAIL_ADDRESS_TYPE_ENUM] The type of email address.
        #   - `PERSONAL` - PERSONAL
        #   - `WORK` - WORK
        #   - `OTHER` - OTHER
        @email_address_type = email_address_type
        # @type [DateTime]
        @created_at = created_at
        # @type [DateTime] This is the datetime that this object was last updated by Merge
        @modified_at = modified_at
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of EmailAddress
      #
      # @param json_object [JSON]
      # @return [Ats::EmailAddress]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        value = struct.value
        email_address_type = Ats::EMAIL_ADDRESS_TYPE_ENUM.key(parsed_json["email_address_type"]) || parsed_json["email_address_type"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        new(value: value, email_address_type: email_address_type, created_at: created_at, modified_at: modified_at,
            additional_properties: struct)
      end

      # Serialize an instance of EmailAddress to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "value": @value,
          "email_address_type": Ats::EMAIL_ADDRESS_TYPE_ENUM[@email_address_type] || @email_address_type,
          "created_at": @created_at,
          "modified_at": @modified_at
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.value&.is_a?(String) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
        obj.email_address_type&.is_a?(Ats::EMAIL_ADDRESS_TYPE_ENUM) != false || raise("Passed value for field obj.email_address_type is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
      end
    end
  end
end
