# frozen_string_literal: true

require "ostruct"
require "json"

module Merge
  module Accounting
    class AdvancedMetadata
      # @return [String]
      attr_reader :id
      # @return [String]
      attr_reader :display_name
      # @return [String]
      attr_reader :description
      # @return [Boolean]
      attr_reader :is_required
      # @return [Boolean]
      attr_reader :is_custom
      # @return [Array<Object>]
      attr_reader :field_choices
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param id [String]
      # @param display_name [String]
      # @param description [String]
      # @param is_required [Boolean]
      # @param is_custom [Boolean]
      # @param field_choices [Array<Object>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Accounting::AdvancedMetadata]
      def initialize(id:, display_name: OMIT, description: OMIT, is_required: OMIT, is_custom: OMIT,
                     field_choices: OMIT, additional_properties: nil)
        @id = id
        @display_name = display_name if display_name != OMIT
        @description = description if description != OMIT
        @is_required = is_required if is_required != OMIT
        @is_custom = is_custom if is_custom != OMIT
        @field_choices = field_choices if field_choices != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "display_name": display_name,
          "description": description,
          "is_required": is_required,
          "is_custom": is_custom,
          "field_choices": field_choices
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of AdvancedMetadata
      #
      # @param json_object [String]
      # @return [Merge::Accounting::AdvancedMetadata]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = parsed_json["id"]
        display_name = parsed_json["display_name"]
        description = parsed_json["description"]
        is_required = parsed_json["is_required"]
        is_custom = parsed_json["is_custom"]
        field_choices = parsed_json["field_choices"]
        new(
          id: id,
          display_name: display_name,
          description: description,
          is_required: is_required,
          is_custom: is_custom,
          field_choices: field_choices,
          additional_properties: struct
        )
      end

      # Serialize an instance of AdvancedMetadata to a JSON object
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
        obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.display_name&.is_a?(String) != false || raise("Passed value for field obj.display_name is not the expected type, validation failed.")
        obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
        obj.is_required&.is_a?(Boolean) != false || raise("Passed value for field obj.is_required is not the expected type, validation failed.")
        obj.is_custom&.is_a?(Boolean) != false || raise("Passed value for field obj.is_custom is not the expected type, validation failed.")
        obj.field_choices&.is_a?(Array) != false || raise("Passed value for field obj.field_choices is not the expected type, validation failed.")
      end
    end
  end
end
