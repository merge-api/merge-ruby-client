# frozen_string_literal: true

require "json"

module Merge
  module Crm
    class IgnoreCommonModelRequest
      attr_reader :reason, :message, :additional_properties

      # @param reason [Hash{String => String}]
      # @param message [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Crm::IgnoreCommonModelRequest]
      def initialize(reason:, message: nil, additional_properties: nil)
        # @type [Hash{String => String}]
        @reason = reason
        # @type [String]
        @message = message
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of IgnoreCommonModelRequest
      #
      # @param json_object [JSON]
      # @return [Crm::IgnoreCommonModelRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        reason = REASON_ENUM.key(struct.reason)
        message = struct.message
        new(reason: reason, message: message, additional_properties: struct)
      end

      # Serialize an instance of IgnoreCommonModelRequest to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "reason": @reason, "message": @message }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.reason.is_a?(REASON_ENUM) != false || raise("Passed value for field obj.reason is not the expected type, validation failed.")
        obj.message&.is_a?(String) != false || raise("Passed value for field obj.message is not the expected type, validation failed.")
      end
    end
  end
end
