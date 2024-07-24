# frozen_string_literal: true

require_relative "reason_enum"
require "ostruct"
require "json"

module Merge
  module Crm
    class IgnoreCommonModelRequest
      # @return [Merge::Crm::ReasonEnum]
      attr_reader :reason
      # @return [String]
      attr_reader :message
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param reason [Merge::Crm::ReasonEnum]
      # @param message [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Crm::IgnoreCommonModelRequest]
      def initialize(reason:, message: OMIT, additional_properties: nil)
        @reason = reason
        @message = message if message != OMIT
        @additional_properties = additional_properties
        @_field_set = { "reason": reason, "message": message }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of IgnoreCommonModelRequest
      #
      # @param json_object [String]
      # @return [Merge::Crm::IgnoreCommonModelRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        reason = parsed_json["reason"]
        message = parsed_json["message"]
        new(
          reason: reason,
          message: message,
          additional_properties: struct
        )
      end

      # Serialize an instance of IgnoreCommonModelRequest to a JSON object
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
        obj.reason.is_a?(Merge::Crm::ReasonEnum) != false || raise("Passed value for field obj.reason is not the expected type, validation failed.")
        obj.message&.is_a?(String) != false || raise("Passed value for field obj.message is not the expected type, validation failed.")
      end
    end
  end
end
