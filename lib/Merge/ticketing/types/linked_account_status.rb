# frozen_string_literal: true

require "json"

module Merge
  module Ticketing
    class LinkedAccountStatus
      attr_reader :linked_account_status, :can_make_request, :additional_properties

      # @param linked_account_status [String]
      # @param can_make_request [Boolean]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Ticketing::LinkedAccountStatus]
      def initialize(linked_account_status:, can_make_request:, additional_properties: nil)
        # @type [String]
        @linked_account_status = linked_account_status
        # @type [Boolean]
        @can_make_request = can_make_request
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of LinkedAccountStatus
      #
      # @param json_object [JSON]
      # @return [Ticketing::LinkedAccountStatus]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        linked_account_status = struct.linked_account_status
        can_make_request = struct.can_make_request
        new(linked_account_status: linked_account_status, can_make_request: can_make_request,
            additional_properties: struct)
      end

      # Serialize an instance of LinkedAccountStatus to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "linked_account_status": @linked_account_status, "can_make_request": @can_make_request }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
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
