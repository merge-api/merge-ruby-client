# frozen_string_literal: true

require "date"
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
    class AccountingPhoneNumber
      # @return [DateTime] The datetime that this object was created by Merge.
      attr_reader :created_at
      # @return [DateTime] The datetime that this object was modified by Merge.
      attr_reader :modified_at
      # @return [String] The phone number.
      attr_reader :number
      # @return [String] The phone number's type.
      attr_reader :type
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param created_at [DateTime] The datetime that this object was created by Merge.
      # @param modified_at [DateTime] The datetime that this object was modified by Merge.
      # @param number [String] The phone number.
      # @param type [String] The phone number's type.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Accounting::AccountingPhoneNumber]
      def initialize(created_at: OMIT, modified_at: OMIT, number: OMIT, type: OMIT, additional_properties: nil)
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @number = number if number != OMIT
        @type = type if type != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "created_at": created_at,
          "modified_at": modified_at,
          "number": number,
          "type": type
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of AccountingPhoneNumber
      #
      # @param json_object [String]
      # @return [Merge::Accounting::AccountingPhoneNumber]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        number = struct["number"]
        type = struct["type"]
        new(
          created_at: created_at,
          modified_at: modified_at,
          number: number,
          type: type,
          additional_properties: struct
        )
      end

      # Serialize an instance of AccountingPhoneNumber to a JSON object
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
        obj.number&.is_a?(String) != false || raise("Passed value for field obj.number is not the expected type, validation failed.")
        obj.type&.is_a?(String) != false || raise("Passed value for field obj.type is not the expected type, validation failed.")
      end
    end
  end
end
