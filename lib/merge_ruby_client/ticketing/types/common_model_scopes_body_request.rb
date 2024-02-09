# frozen_string_literal: true

require_relative "enabled_actions_enum"
require "json"

module Merge
  module Ticketing
    class CommonModelScopesBodyRequest
      attr_reader :model_id, :enabled_actions, :disabled_fields, :additional_properties

      # @param model_id [String]
      # @param enabled_actions [Array<Ticketing::ENABLED_ACTIONS_ENUM>]
      # @param disabled_fields [Array<String>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Ticketing::CommonModelScopesBodyRequest]
      def initialize(model_id:, enabled_actions:, disabled_fields:, additional_properties: nil)
        # @type [String]
        @model_id = model_id
        # @type [Array<Ticketing::ENABLED_ACTIONS_ENUM>]
        @enabled_actions = enabled_actions
        # @type [Array<String>]
        @disabled_fields = disabled_fields
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of CommonModelScopesBodyRequest
      #
      # @param json_object [JSON]
      # @return [Ticketing::CommonModelScopesBodyRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        model_id = struct.model_id
        enabled_actions = parsed_json["enabled_actions"]&.map do |v|
          v = v.to_json
          Ticketing::ENABLED_ACTIONS_ENUM.key(v) || v
        end
        disabled_fields = struct.disabled_fields
        new(model_id: model_id, enabled_actions: enabled_actions, disabled_fields: disabled_fields,
            additional_properties: struct)
      end

      # Serialize an instance of CommonModelScopesBodyRequest to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "model_id": @model_id, "enabled_actions": @enabled_actions, "disabled_fields": @disabled_fields }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.model_id.is_a?(String) != false || raise("Passed value for field obj.model_id is not the expected type, validation failed.")
        obj.enabled_actions.is_a?(Array) != false || raise("Passed value for field obj.enabled_actions is not the expected type, validation failed.")
        obj.disabled_fields.is_a?(Array) != false || raise("Passed value for field obj.disabled_fields is not the expected type, validation failed.")
      end
    end
  end
end
