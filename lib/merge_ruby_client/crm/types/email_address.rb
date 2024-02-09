# frozen_string_literal: true

require "date"
require "json"

module Merge
  module Crm
    # # The EmailAddress Object
    #
    # ### Description
    #
    # The `EmailAddress` object is used to represent an entity's email address.
    #
    # ### Usage Example
    #
    # Fetch from the `GET Contact` endpoint and view their email addresses.
    class EmailAddress
      attr_reader :email_address, :email_address_type, :created_at, :modified_at, :additional_properties

      # @param email_address [String] The email address.
      # @param email_address_type [String] The email address's type.
      # @param created_at [DateTime]
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Crm::EmailAddress]
      def initialize(email_address: nil, email_address_type: nil, created_at: nil, modified_at: nil,
                     additional_properties: nil)
        # @type [String] The email address.
        @email_address = email_address
        # @type [String] The email address's type.
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
      # @return [Crm::EmailAddress]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        email_address = struct.email_address
        email_address_type = struct.email_address_type
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        new(email_address: email_address, email_address_type: email_address_type, created_at: created_at,
            modified_at: modified_at, additional_properties: struct)
      end

      # Serialize an instance of EmailAddress to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "email_address": @email_address,
          "email_address_type": @email_address_type,
          "created_at": @created_at,
          "modified_at": @modified_at
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.email_address&.is_a?(String) != false || raise("Passed value for field obj.email_address is not the expected type, validation failed.")
        obj.email_address_type&.is_a?(String) != false || raise("Passed value for field obj.email_address_type is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
      end
    end
  end
end
