# frozen_string_literal: true

require_relative "item_type_enum"
require_relative "item_format_enum"
require "json"

module Merge
  module Ticketing
    class ItemSchema
      attr_reader :item_type, :item_format, :item_choices, :additional_properties

      # @param item_type [ITEM_TYPE_ENUM]
      # @param item_format [ITEM_FORMAT_ENUM]
      # @param item_choices [Array<String>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Ticketing::ItemSchema]
      def initialize(item_type: nil, item_format: nil, item_choices: nil, additional_properties: nil)
        # @type [ITEM_TYPE_ENUM]
        @item_type = item_type
        # @type [ITEM_FORMAT_ENUM]
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
        parsed_json = JSON.parse(json_object)
        item_type = Ticketing::ITEM_TYPE_ENUM.key(parsed_json["item_type"]) || parsed_json["item_type"]
        item_format = Ticketing::ITEM_FORMAT_ENUM.key(parsed_json["item_format"]) || parsed_json["item_format"]
        item_choices = struct.item_choices
        new(item_type: item_type, item_format: item_format, item_choices: item_choices, additional_properties: struct)
      end

      # Serialize an instance of ItemSchema to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "item_type": Ticketing::ITEM_TYPE_ENUM[@item_type] || @item_type,
          "item_format": Ticketing::ITEM_FORMAT_ENUM[@item_format] || @item_format,
          "item_choices": @item_choices
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.item_type&.is_a?(Ticketing::ITEM_TYPE_ENUM) != false || raise("Passed value for field obj.item_type is not the expected type, validation failed.")
        obj.item_format&.is_a?(Ticketing::ITEM_FORMAT_ENUM) != false || raise("Passed value for field obj.item_format is not the expected type, validation failed.")
        obj.item_choices&.is_a?(Array) != false || raise("Passed value for field obj.item_choices is not the expected type, validation failed.")
      end
    end
  end
end
