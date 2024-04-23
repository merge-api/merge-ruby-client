# frozen_string_literal: true

require "date"
require "ostruct"
require "json"

module Merge
  module Crm
    # # The EmailAddress Object
    #  ### Description
    #  The `EmailAddress` object is used to represent an entity's email address.
    #  ### Usage Example
    #  Fetch from the `GET Contact` endpoint and view their email addresses.
    class EmailAddress
      # @return [DateTime]
      attr_reader :created_at
      # @return [DateTime] This is the datetime that this object was last updated by Merge
      attr_reader :modified_at
      # @return [String] The email address.
      attr_reader :email_address
      # @return [String] The email address's type.
      attr_reader :email_address_type
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param created_at [DateTime]
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param email_address [String] The email address.
      # @param email_address_type [String] The email address's type.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Crm::EmailAddress]
      def initialize(created_at: OMIT, modified_at: OMIT, email_address: OMIT, email_address_type: OMIT,
                     additional_properties: nil)
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @email_address = email_address if email_address != OMIT
        @email_address_type = email_address_type if email_address_type != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "created_at": created_at,
          "modified_at": modified_at,
          "email_address": email_address,
          "email_address_type": email_address_type
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of EmailAddress
      #
      # @param json_object [String]
      # @return [Merge::Crm::EmailAddress]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        email_address = struct["email_address"]
        email_address_type = struct["email_address_type"]
        new(
          created_at: created_at,
          modified_at: modified_at,
          email_address: email_address,
          email_address_type: email_address_type,
          additional_properties: struct
        )
      end

      # Serialize an instance of EmailAddress to a JSON object
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
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
        obj.email_address&.is_a?(String) != false || raise("Passed value for field obj.email_address is not the expected type, validation failed.")
        obj.email_address_type&.is_a?(String) != false || raise("Passed value for field obj.email_address_type is not the expected type, validation failed.")
      end
    end
  end
end
