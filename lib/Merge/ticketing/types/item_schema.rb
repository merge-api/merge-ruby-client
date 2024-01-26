# frozen_string_literal: true

require "json"

module Merge
  module Ticketing
    class ItemSchema
      attr_reader :item_type, :item_format, :item_choices, :additional_properties

      # @param item_type [Hash{String => String}]
      # @param item_format [Hash{String => String}]
      # @param item_choices [Array<String>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Ticketing::ItemSchema]
      def initialize(item_type: nil, item_format: nil, item_choices: nil, additional_properties: nil)
        # @type [Hash{String => String}]
        @item_type = item_type
        # @type [Hash{String => String}]
        @item_format = item_format
        # @type [Array<String>]
        @item_choices = item_choices
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of ItemSchema
      #
      # @param json_object [JSON]
      # @return [Ticketing::ItemSchema]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        item_type = ITEM_TYPE_ENUM.key(struct.item_type)
        item_format = ITEM_FORMAT_ENUM.key(struct.item_format)
        item_choices = struct.item_choices
        new(item_type: item_type, item_format: item_format, item_choices: item_choices, additional_properties: struct)
      end

      # Serialize an instance of ItemSchema to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        { "item_type": @item_type, "item_format": @item_format, "item_choices": @item_choices }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.item_type&.is_a?(ITEM_TYPE_ENUM) != false || raise("Passed value for field obj.item_type is not the expected type, validation failed.")
        obj.item_format&.is_a?(ITEM_FORMAT_ENUM) != false || raise("Passed value for field obj.item_format is not the expected type, validation failed.")
        obj.item_choices&.is_a?(Array) != false || raise("Passed value for field obj.item_choices is not the expected type, validation failed.")
      end
    end
  end
end
