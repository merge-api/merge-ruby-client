# frozen_string_literal: true

require_relative "item_type_enum"
require_relative "item_format_enum"
require "ostruct"
require "json"

module Merge
  module Accounting
    class ItemSchema
      # @return [Merge::Accounting::ItemTypeEnum]
      attr_reader :item_type
      # @return [Merge::Accounting::ItemFormatEnum]
      attr_reader :item_format
      # @return [Array<String>]
      attr_reader :item_choices
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param item_type [Merge::Accounting::ItemTypeEnum]
      # @param item_format [Merge::Accounting::ItemFormatEnum]
      # @param item_choices [Array<String>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Accounting::ItemSchema]
      def initialize(item_type: OMIT, item_format: OMIT, item_choices: OMIT, additional_properties: nil)
        @item_type = item_type if item_type != OMIT
        @item_format = item_format if item_format != OMIT
        @item_choices = item_choices if item_choices != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "item_type": item_type,
          "item_format": item_format,
          "item_choices": item_choices
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of ItemSchema
      #
      # @param json_object [String]
      # @return [Merge::Accounting::ItemSchema]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        item_type = parsed_json["item_type"]
        item_format = parsed_json["item_format"]
        item_choices = parsed_json["item_choices"]
        new(
          item_type: item_type,
          item_format: item_format,
          item_choices: item_choices,
          additional_properties: struct
        )
      end

      # Serialize an instance of ItemSchema to a JSON object
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
        obj.item_type&.is_a?(Merge::Accounting::ItemTypeEnum) != false || raise("Passed value for field obj.item_type is not the expected type, validation failed.")
        obj.item_format&.is_a?(Merge::Accounting::ItemFormatEnum) != false || raise("Passed value for field obj.item_format is not the expected type, validation failed.")
        obj.item_choices&.is_a?(Array) != false || raise("Passed value for field obj.item_choices is not the expected type, validation failed.")
      end
    end
  end
end
