# frozen_string_literal: true

require "json"

module Merge
  module Ats
    class WebhookReceiver
      attr_reader :event, :is_active, :key, :additional_properties

      # @param event [String]
      # @param is_active [Boolean]
      # @param key [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Ats::WebhookReceiver]
      def initialize(event:, is_active:, key: nil, additional_properties: nil)
        # @type [String]
        @event = event
        # @type [Boolean]
        @is_active = is_active
        # @type [String]
        @key = key
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of WebhookReceiver
      #
      # @param json_object [JSON]
      # @return [Ats::WebhookReceiver]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        JSON.parse(json_object)
        event = struct.event
        is_active = struct.is_active
        key = struct.key
        new(event: event, is_active: is_active, key: key, additional_properties: struct)
      end

      # Serialize an instance of WebhookReceiver to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "event": @event, "is_active": @is_active, "key": @key }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.event.is_a?(String) != false || raise("Passed value for field obj.event is not the expected type, validation failed.")
        obj.is_active.is_a?(Boolean) != false || raise("Passed value for field obj.is_active is not the expected type, validation failed.")
        obj.key&.is_a?(String) != false || raise("Passed value for field obj.key is not the expected type, validation failed.")
      end
    end
  end
end
