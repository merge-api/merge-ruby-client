# frozen_string_literal: true

require_relative "enabled_actions_enum"
require "ostruct"
require "json"

module Merge
  module Ats
    class CommonModelScopesBodyRequest
      # @return [String]
      attr_reader :model_id
      # @return [Array<Merge::Ats::EnabledActionsEnum>]
      attr_reader :enabled_actions
      # @return [Array<String>]
      attr_reader :disabled_fields
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param model_id [String]
      # @param enabled_actions [Array<Merge::Ats::EnabledActionsEnum>]
      # @param disabled_fields [Array<String>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Ats::CommonModelScopesBodyRequest]
      def initialize(model_id:, enabled_actions:, disabled_fields:, additional_properties: nil)
        @model_id = model_id
        @enabled_actions = enabled_actions
        @disabled_fields = disabled_fields
        @additional_properties = additional_properties
        @_field_set = { "model_id": model_id, "enabled_actions": enabled_actions, "disabled_fields": disabled_fields }
      end

      # Deserialize a JSON object to an instance of CommonModelScopesBodyRequest
      #
      # @param json_object [String]
      # @return [Merge::Ats::CommonModelScopesBodyRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        model_id = parsed_json["model_id"]
        enabled_actions = parsed_json["enabled_actions"]
        disabled_fields = parsed_json["disabled_fields"]
        new(
          model_id: model_id,
          enabled_actions: enabled_actions,
          disabled_fields: disabled_fields,
          additional_properties: struct
        )
      end

      # Serialize an instance of CommonModelScopesBodyRequest to a JSON object
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
        obj.model_id.is_a?(String) != false || raise("Passed value for field obj.model_id is not the expected type, validation failed.")
        obj.enabled_actions.is_a?(Array) != false || raise("Passed value for field obj.enabled_actions is not the expected type, validation failed.")
        obj.disabled_fields.is_a?(Array) != false || raise("Passed value for field obj.disabled_fields is not the expected type, validation failed.")
      end
    end
  end
end
