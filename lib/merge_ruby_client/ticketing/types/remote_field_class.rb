# frozen_string_literal: true

require_relative "field_type_enum"
require_relative "field_format_enum"
require_relative "remote_field_class_field_choices_item"
require_relative "item_schema"
require "ostruct"
require "json"

module Merge
  module Ticketing
    class RemoteFieldClass
      # @return [String]
      attr_reader :id
      # @return [String]
      attr_reader :display_name
      # @return [String]
      attr_reader :remote_key_name
      # @return [String]
      attr_reader :description
      # @return [Boolean]
      attr_reader :is_custom
      # @return [Boolean]
      attr_reader :is_required
      # @return [Merge::Ticketing::FieldTypeEnum]
      attr_reader :field_type
      # @return [Merge::Ticketing::FieldFormatEnum]
      attr_reader :field_format
      # @return [Array<Merge::Ticketing::RemoteFieldClassFieldChoicesItem>]
      attr_reader :field_choices
      # @return [Merge::Ticketing::ItemSchema]
      attr_reader :item_schema
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param id [String]
      # @param display_name [String]
      # @param remote_key_name [String]
      # @param description [String]
      # @param is_custom [Boolean]
      # @param is_required [Boolean]
      # @param field_type [Merge::Ticketing::FieldTypeEnum]
      # @param field_format [Merge::Ticketing::FieldFormatEnum]
      # @param field_choices [Array<Merge::Ticketing::RemoteFieldClassFieldChoicesItem>]
      # @param item_schema [Merge::Ticketing::ItemSchema]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Ticketing::RemoteFieldClass]
      def initialize(id: OMIT, display_name: OMIT, remote_key_name: OMIT, description: OMIT, is_custom: OMIT,
                     is_required: OMIT, field_type: OMIT, field_format: OMIT, field_choices: OMIT, item_schema: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @display_name = display_name if display_name != OMIT
        @remote_key_name = remote_key_name if remote_key_name != OMIT
        @description = description if description != OMIT
        @is_custom = is_custom if is_custom != OMIT
        @is_required = is_required if is_required != OMIT
        @field_type = field_type if field_type != OMIT
        @field_format = field_format if field_format != OMIT
        @field_choices = field_choices if field_choices != OMIT
        @item_schema = item_schema if item_schema != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "display_name": display_name,
          "remote_key_name": remote_key_name,
          "description": description,
          "is_custom": is_custom,
          "is_required": is_required,
          "field_type": field_type,
          "field_format": field_format,
          "field_choices": field_choices,
          "item_schema": item_schema
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of RemoteFieldClass
      #
      # @param json_object [String]
      # @return [Merge::Ticketing::RemoteFieldClass]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = struct["id"]
        display_name = struct["display_name"]
        remote_key_name = struct["remote_key_name"]
        description = struct["description"]
        is_custom = struct["is_custom"]
        is_required = struct["is_required"]
        field_type = struct["field_type"]
        field_format = struct["field_format"]
        field_choices = parsed_json["field_choices"]&.map do |v|
          v = v.to_json
          Merge::Ticketing::RemoteFieldClassFieldChoicesItem.from_json(json_object: v)
        end
        if parsed_json["item_schema"].nil?
          item_schema = nil
        else
          item_schema = parsed_json["item_schema"].to_json
          item_schema = Merge::Ticketing::ItemSchema.from_json(json_object: item_schema)
        end
        new(
          id: id,
          display_name: display_name,
          remote_key_name: remote_key_name,
          description: description,
          is_custom: is_custom,
          is_required: is_required,
          field_type: field_type,
          field_format: field_format,
          field_choices: field_choices,
          item_schema: item_schema,
          additional_properties: struct
        )
      end

      # Serialize an instance of RemoteFieldClass to a JSON object
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
        obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.display_name&.is_a?(String) != false || raise("Passed value for field obj.display_name is not the expected type, validation failed.")
        obj.remote_key_name&.is_a?(String) != false || raise("Passed value for field obj.remote_key_name is not the expected type, validation failed.")
        obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
        obj.is_custom&.is_a?(Boolean) != false || raise("Passed value for field obj.is_custom is not the expected type, validation failed.")
        obj.is_required&.is_a?(Boolean) != false || raise("Passed value for field obj.is_required is not the expected type, validation failed.")
        obj.field_type&.is_a?(Merge::Ticketing::FieldTypeEnum) != false || raise("Passed value for field obj.field_type is not the expected type, validation failed.")
        obj.field_format&.is_a?(Merge::Ticketing::FieldFormatEnum) != false || raise("Passed value for field obj.field_format is not the expected type, validation failed.")
        obj.field_choices&.is_a?(Array) != false || raise("Passed value for field obj.field_choices is not the expected type, validation failed.")
        obj.item_schema.nil? || Merge::Ticketing::ItemSchema.validate_raw(obj: obj.item_schema)
      end
    end
  end
end
