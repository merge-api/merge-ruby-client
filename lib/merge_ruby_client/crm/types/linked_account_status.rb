# frozen_string_literal: true

require "ostruct"
require "json"

module Merge
  module Crm
    class LinkedAccountStatus
      # @return [String]
      attr_reader :linked_account_status
      # @return [Boolean]
      attr_reader :can_make_request
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param linked_account_status [String]
      # @param can_make_request [Boolean]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Crm::LinkedAccountStatus]
      def initialize(linked_account_status:, can_make_request:, additional_properties: nil)
        @linked_account_status = linked_account_status
        @can_make_request = can_make_request
        @additional_properties = additional_properties
        @_field_set = { "linked_account_status": linked_account_status, "can_make_request": can_make_request }
      end

      # Deserialize a JSON object to an instance of LinkedAccountStatus
      #
      # @param json_object [String]
      # @return [Merge::Crm::LinkedAccountStatus]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        linked_account_status = parsed_json["linked_account_status"]
        can_make_request = parsed_json["can_make_request"]
        new(
          linked_account_status: linked_account_status,
          can_make_request: can_make_request,
          additional_properties: struct
        )
      end

      # Serialize an instance of LinkedAccountStatus to a JSON object
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
        obj.linked_account_status.is_a?(String) != false || raise("Passed value for field obj.linked_account_status is not the expected type, validation failed.")
        obj.can_make_request.is_a?(Boolean) != false || raise("Passed value for field obj.can_make_request is not the expected type, validation failed.")
      end
    end
  end
end
