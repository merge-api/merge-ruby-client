# frozen_string_literal: true

require "ostruct"
require "json"

module Merge
  module Ticketing
    class WebhookReceiver
      # @return [String]
      attr_reader :event
      # @return [Boolean]
      attr_reader :is_active
      # @return [String]
      attr_reader :key
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param event [String]
      # @param is_active [Boolean]
      # @param key [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Ticketing::WebhookReceiver]
      def initialize(event:, is_active:, key: OMIT, additional_properties: nil)
        @event = event
        @is_active = is_active
        @key = key if key != OMIT
        @additional_properties = additional_properties
        @_field_set = { "event": event, "is_active": is_active, "key": key }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of WebhookReceiver
      #
      # @param json_object [String]
      # @return [Merge::Ticketing::WebhookReceiver]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        event = struct["event"]
        is_active = struct["is_active"]
        key = struct["key"]
        new(
          event: event,
          is_active: is_active,
          key: key,
          additional_properties: struct
        )
      end

      # Serialize an instance of WebhookReceiver to a JSON object
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
        obj.event.is_a?(String) != false || raise("Passed value for field obj.event is not the expected type, validation failed.")
        obj.is_active.is_a?(Boolean) != false || raise("Passed value for field obj.is_active is not the expected type, validation failed.")
        obj.key&.is_a?(String) != false || raise("Passed value for field obj.key is not the expected type, validation failed.")
      end
    end
  end
end
