# frozen_string_literal: true

require "ostruct"
require "json"

module Merge
  module Crm
    # # The PhoneNumber Object
    #  ### Description
    #  The `PhoneNumber` object is used to represent an entity's phone number.
    #  ### Usage Example
    #  Fetch from the `GET Contact` endpoint and view their phone numbers.
    class PhoneNumberRequest
      # @return [String] The phone number.
      attr_reader :phone_number
      # @return [String] The phone number's type.
      attr_reader :phone_number_type
      # @return [Hash{String => Object}]
      attr_reader :integration_params
      # @return [Hash{String => Object}]
      attr_reader :linked_account_params
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param phone_number [String] The phone number.
      # @param phone_number_type [String] The phone number's type.
      # @param integration_params [Hash{String => Object}]
      # @param linked_account_params [Hash{String => Object}]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Crm::PhoneNumberRequest]
      def initialize(phone_number: OMIT, phone_number_type: OMIT, integration_params: OMIT,
                     linked_account_params: OMIT, additional_properties: nil)
        @phone_number = phone_number if phone_number != OMIT
        @phone_number_type = phone_number_type if phone_number_type != OMIT
        @integration_params = integration_params if integration_params != OMIT
        @linked_account_params = linked_account_params if linked_account_params != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "phone_number": phone_number,
          "phone_number_type": phone_number_type,
          "integration_params": integration_params,
          "linked_account_params": linked_account_params
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of PhoneNumberRequest
      #
      # @param json_object [String]
      # @return [Merge::Crm::PhoneNumberRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        phone_number = struct["phone_number"]
        phone_number_type = struct["phone_number_type"]
        integration_params = struct["integration_params"]
        linked_account_params = struct["linked_account_params"]
        new(
          phone_number: phone_number,
          phone_number_type: phone_number_type,
          integration_params: integration_params,
          linked_account_params: linked_account_params,
          additional_properties: struct
        )
      end

      # Serialize an instance of PhoneNumberRequest to a JSON object
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
        obj.phone_number&.is_a?(String) != false || raise("Passed value for field obj.phone_number is not the expected type, validation failed.")
        obj.phone_number_type&.is_a?(String) != false || raise("Passed value for field obj.phone_number_type is not the expected type, validation failed.")
        obj.integration_params&.is_a?(Hash) != false || raise("Passed value for field obj.integration_params is not the expected type, validation failed.")
        obj.linked_account_params&.is_a?(Hash) != false || raise("Passed value for field obj.linked_account_params is not the expected type, validation failed.")
      end
    end
  end
end
