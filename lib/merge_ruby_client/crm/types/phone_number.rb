# frozen_string_literal: true

require "date"
require "ostruct"
require "json"

module Merge
  module Crm
    # # The PhoneNumber Object
    #  ### Description
    #  The `PhoneNumber` object is used to represent an entity's phone number.
    #  ### Usage Example
    #  Fetch from the `GET Contact` endpoint and view their phone numbers.
    class PhoneNumber
      # @return [DateTime]
      attr_reader :created_at
      # @return [DateTime] This is the datetime that this object was last updated by Merge
      attr_reader :modified_at
      # @return [String] The phone number.
      attr_reader :phone_number
      # @return [String] The phone number's type.
      attr_reader :phone_number_type
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param created_at [DateTime]
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param phone_number [String] The phone number.
      # @param phone_number_type [String] The phone number's type.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Crm::PhoneNumber]
      def initialize(created_at: OMIT, modified_at: OMIT, phone_number: OMIT, phone_number_type: OMIT,
                     additional_properties: nil)
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @phone_number = phone_number if phone_number != OMIT
        @phone_number_type = phone_number_type if phone_number_type != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "created_at": created_at,
          "modified_at": modified_at,
          "phone_number": phone_number,
          "phone_number_type": phone_number_type
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of PhoneNumber
      #
      # @param json_object [String]
      # @return [Merge::Crm::PhoneNumber]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        phone_number = struct["phone_number"]
        phone_number_type = struct["phone_number_type"]
        new(
          created_at: created_at,
          modified_at: modified_at,
          phone_number: phone_number,
          phone_number_type: phone_number_type,
          additional_properties: struct
        )
      end

      # Serialize an instance of PhoneNumber to a JSON object
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
        obj.phone_number&.is_a?(String) != false || raise("Passed value for field obj.phone_number is not the expected type, validation failed.")
        obj.phone_number_type&.is_a?(String) != false || raise("Passed value for field obj.phone_number_type is not the expected type, validation failed.")
      end
    end
  end
end
