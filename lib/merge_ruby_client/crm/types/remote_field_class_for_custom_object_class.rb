# frozen_string_literal: true

require_relative "field_type_enum"
require_relative "field_format_enum"
require_relative "remote_field_class_for_custom_object_class_field_choices_item"
require_relative "remote_field_class_for_custom_object_class_item_schema"
require "date"
require "json"

module Merge
  module Crm
    class RemoteFieldClassForCustomObjectClass
      attr_reader :display_name, :remote_key_name, :description, :is_required, :field_type, :field_format,
                  :field_choices, :item_schema, :created_at, :modified_at, :additional_properties

      # @param display_name [String]
      # @param remote_key_name [String]
      # @param description [String]
      # @param is_required [Boolean]
      # @param field_type [FIELD_TYPE_ENUM]
      # @param field_format [FIELD_FORMAT_ENUM]
      # @param field_choices [Array<Crm::RemoteFieldClassForCustomObjectClassFieldChoicesItem>]
      # @param item_schema [Crm::RemoteFieldClassForCustomObjectClassItemSchema]
      # @param created_at [DateTime]
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Crm::RemoteFieldClassForCustomObjectClass]
      def initialize(display_name: nil, remote_key_name: nil, description: nil, is_required: nil, field_type: nil,
                     field_format: nil, field_choices: nil, item_schema: nil, created_at: nil, modified_at: nil, additional_properties: nil)
        # @type [String]
        @display_name = display_name
        # @type [String]
        @remote_key_name = remote_key_name
        # @type [String]
        @description = description
        # @type [Boolean]
        @is_required = is_required
        # @type [FIELD_TYPE_ENUM]
        @field_type = field_type
        # @type [FIELD_FORMAT_ENUM]
        @field_format = field_format
        # @type [Array<Crm::RemoteFieldClassForCustomObjectClassFieldChoicesItem>]
        @field_choices = field_choices
        # @type [Crm::RemoteFieldClassForCustomObjectClassItemSchema]
        @item_schema = item_schema
        # @type [DateTime]
        @created_at = created_at
        # @type [DateTime] This is the datetime that this object was last updated by Merge
        @modified_at = modified_at
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of RemoteFieldClassForCustomObjectClass
      #
      # @param json_object [JSON]
      # @return [Crm::RemoteFieldClassForCustomObjectClass]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        display_name = struct.display_name
        remote_key_name = struct.remote_key_name
        description = struct.description
        is_required = struct.is_required
        field_type = Crm::FIELD_TYPE_ENUM.key(parsed_json["field_type"]) || parsed_json["field_type"]
        field_format = Crm::FIELD_FORMAT_ENUM.key(parsed_json["field_format"]) || parsed_json["field_format"]
        field_choices = parsed_json["field_choices"]&.map do |v|
          v = v.to_json
          Crm::RemoteFieldClassForCustomObjectClassFieldChoicesItem.from_json(json_object: v)
        end
        if parsed_json["item_schema"].nil?
          item_schema = nil
        else
          item_schema = parsed_json["item_schema"].to_json
          item_schema = Crm::RemoteFieldClassForCustomObjectClassItemSchema.from_json(json_object: item_schema)
        end
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        new(display_name: display_name, remote_key_name: remote_key_name, description: description,
            is_required: is_required, field_type: field_type, field_format: field_format, field_choices: field_choices, item_schema: item_schema, created_at: created_at, modified_at: modified_at, additional_properties: struct)
      end

      # Serialize an instance of RemoteFieldClassForCustomObjectClass to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "display_name": @display_name,
          "remote_key_name": @remote_key_name,
          "description": @description,
          "is_required": @is_required,
          "field_type": Crm::FIELD_TYPE_ENUM[@field_type] || @field_type,
          "field_format": Crm::FIELD_FORMAT_ENUM[@field_format] || @field_format,
          "field_choices": @field_choices,
          "item_schema": @item_schema,
          "created_at": @created_at,
          "modified_at": @modified_at
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.display_name&.is_a?(String) != false || raise("Passed value for field obj.display_name is not the expected type, validation failed.")
        obj.remote_key_name&.is_a?(String) != false || raise("Passed value for field obj.remote_key_name is not the expected type, validation failed.")
        obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
        obj.is_required&.is_a?(Boolean) != false || raise("Passed value for field obj.is_required is not the expected type, validation failed.")
        obj.field_type&.is_a?(Crm::FIELD_TYPE_ENUM) != false || raise("Passed value for field obj.field_type is not the expected type, validation failed.")
        obj.field_format&.is_a?(Crm::FIELD_FORMAT_ENUM) != false || raise("Passed value for field obj.field_format is not the expected type, validation failed.")
        obj.field_choices&.is_a?(Array) != false || raise("Passed value for field obj.field_choices is not the expected type, validation failed.")
        obj.item_schema.nil? || Crm::RemoteFieldClassForCustomObjectClassItemSchema.validate_raw(obj: obj.item_schema)
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
      end
    end
  end
end
