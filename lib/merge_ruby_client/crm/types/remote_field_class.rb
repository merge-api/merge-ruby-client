# frozen_string_literal: true

require_relative "field_type_enum"
require_relative "field_format_enum"
require_relative "remote_field_class_field_choices_item"
require_relative "item_schema"
require "json"

module Merge
  module Crm
    class RemoteFieldClass
      attr_reader :id, :display_name, :remote_key_name, :description, :is_custom, :is_required, :field_type,
                  :field_format, :field_choices, :item_schema, :additional_properties

      # @param id [String]
      # @param display_name [String]
      # @param remote_key_name [String]
      # @param description [String]
      # @param is_custom [Boolean]
      # @param is_required [Boolean]
      # @param field_type [FIELD_TYPE_ENUM]
      # @param field_format [FIELD_FORMAT_ENUM]
      # @param field_choices [Array<Crm::RemoteFieldClassFieldChoicesItem>]
      # @param item_schema [Crm::ItemSchema]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Crm::RemoteFieldClass]
      def initialize(id: nil, display_name: nil, remote_key_name: nil, description: nil, is_custom: nil,
                     is_required: nil, field_type: nil, field_format: nil, field_choices: nil, item_schema: nil, additional_properties: nil)
        # @type [String]
        @id = id
        # @type [String]
        @display_name = display_name
        # @type [String]
        @remote_key_name = remote_key_name
        # @type [String]
        @description = description
        # @type [Boolean]
        @is_custom = is_custom
        # @type [Boolean]
        @is_required = is_required
        # @type [FIELD_TYPE_ENUM]
        @field_type = field_type
        # @type [FIELD_FORMAT_ENUM]
        @field_format = field_format
        # @type [Array<Crm::RemoteFieldClassFieldChoicesItem>]
        @field_choices = field_choices
        # @type [Crm::ItemSchema]
        @item_schema = item_schema
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of RemoteFieldClass
      #
      # @param json_object [JSON]
      # @return [Crm::RemoteFieldClass]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = struct.id
        display_name = struct.display_name
        remote_key_name = struct.remote_key_name
        description = struct.description
        is_custom = struct.is_custom
        is_required = struct.is_required
        field_type = Crm::FIELD_TYPE_ENUM.key(parsed_json["field_type"]) || parsed_json["field_type"]
        field_format = Crm::FIELD_FORMAT_ENUM.key(parsed_json["field_format"]) || parsed_json["field_format"]
        field_choices = parsed_json["field_choices"]&.map do |v|
          v = v.to_json
          Crm::RemoteFieldClassFieldChoicesItem.from_json(json_object: v)
        end
        if parsed_json["item_schema"].nil?
          item_schema = nil
        else
          item_schema = parsed_json["item_schema"].to_json
          item_schema = Crm::ItemSchema.from_json(json_object: item_schema)
        end
        new(id: id, display_name: display_name, remote_key_name: remote_key_name, description: description,
            is_custom: is_custom, is_required: is_required, field_type: field_type, field_format: field_format, field_choices: field_choices, item_schema: item_schema, additional_properties: struct)
      end

      # Serialize an instance of RemoteFieldClass to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "id": @id,
          "display_name": @display_name,
          "remote_key_name": @remote_key_name,
          "description": @description,
          "is_custom": @is_custom,
          "is_required": @is_required,
          "field_type": Crm::FIELD_TYPE_ENUM[@field_type] || @field_type,
          "field_format": Crm::FIELD_FORMAT_ENUM[@field_format] || @field_format,
          "field_choices": @field_choices,
          "item_schema": @item_schema
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
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
        obj.field_type&.is_a?(Crm::FIELD_TYPE_ENUM) != false || raise("Passed value for field obj.field_type is not the expected type, validation failed.")
        obj.field_format&.is_a?(Crm::FIELD_FORMAT_ENUM) != false || raise("Passed value for field obj.field_format is not the expected type, validation failed.")
        obj.field_choices&.is_a?(Array) != false || raise("Passed value for field obj.field_choices is not the expected type, validation failed.")
        obj.item_schema.nil? || Crm::ItemSchema.validate_raw(obj: obj.item_schema)
      end
    end
  end
end
