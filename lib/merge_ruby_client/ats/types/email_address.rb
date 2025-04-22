# frozen_string_literal: true

require "date"
require_relative "email_address_type_enum"
require "ostruct"
require "json"

module Merge
  module Ats
    # # The EmailAddress Object
    #  ### Description
    #  The `EmailAddress` object is used to represent a candidate's email address.
    #  ### Usage Example
    #  Fetch from the `GET Candidate` endpoint and view their email addresses.
    class EmailAddress
      # @return [DateTime] The datetime that this object was created by Merge.
      attr_reader :created_at
      # @return [DateTime] The datetime that this object was modified by Merge.
      attr_reader :modified_at
      # @return [String] The email address.
      attr_reader :value
      # @return [Merge::Ats::EmailAddressTypeEnum] The type of email address.
      #  * `PERSONAL` - PERSONAL
      #  * `WORK` - WORK
      #  * `OTHER` - OTHER
      attr_reader :email_address_type
      # @return [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      attr_reader :remote_was_deleted
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param created_at [DateTime] The datetime that this object was created by Merge.
      # @param modified_at [DateTime] The datetime that this object was modified by Merge.
      # @param value [String] The email address.
      # @param email_address_type [Merge::Ats::EmailAddressTypeEnum] The type of email address.
      #  * `PERSONAL` - PERSONAL
      #  * `WORK` - WORK
      #  * `OTHER` - OTHER
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Ats::EmailAddress]
      def initialize(created_at: OMIT, modified_at: OMIT, value: OMIT, email_address_type: OMIT,
                     remote_was_deleted: OMIT, additional_properties: nil)
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @value = value if value != OMIT
        @email_address_type = email_address_type if email_address_type != OMIT
        @remote_was_deleted = remote_was_deleted if remote_was_deleted != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "created_at": created_at,
          "modified_at": modified_at,
          "value": value,
          "email_address_type": email_address_type,
          "remote_was_deleted": remote_was_deleted
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of EmailAddress
      #
      # @param json_object [String]
      # @return [Merge::Ats::EmailAddress]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        value = parsed_json["value"]
        email_address_type = parsed_json["email_address_type"]
        remote_was_deleted = parsed_json["remote_was_deleted"]
        new(
          created_at: created_at,
          modified_at: modified_at,
          value: value,
          email_address_type: email_address_type,
          remote_was_deleted: remote_was_deleted,
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
        obj.value&.is_a?(String) != false || raise("Passed value for field obj.value is not the expected type, validation failed.")
        obj.email_address_type&.is_a?(Merge::Ats::EmailAddressTypeEnum) != false || raise("Passed value for field obj.email_address_type is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
      end
    end
  end
end
