# frozen_string_literal: true

require "ostruct"
require "json"

module Merge
  module Filestorage
    class AsyncPassthroughReciept
      # @return [String]
      attr_reader :async_passthrough_receipt_id
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param async_passthrough_receipt_id [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Filestorage::AsyncPassthroughReciept]
      def initialize(async_passthrough_receipt_id:, additional_properties: nil)
        @async_passthrough_receipt_id = async_passthrough_receipt_id
        @additional_properties = additional_properties
        @_field_set = { "async_passthrough_receipt_id": async_passthrough_receipt_id }
      end

      # Deserialize a JSON object to an instance of AsyncPassthroughReciept
      #
      # @param json_object [String]
      # @return [Merge::Filestorage::AsyncPassthroughReciept]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        async_passthrough_receipt_id = struct["async_passthrough_receipt_id"]
        new(async_passthrough_receipt_id: async_passthrough_receipt_id, additional_properties: struct)
      end

      # Serialize an instance of AsyncPassthroughReciept to a JSON object
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
        obj.async_passthrough_receipt_id.is_a?(String) != false || raise("Passed value for field obj.async_passthrough_receipt_id is not the expected type, validation failed.")
      end
    end
  end
end
