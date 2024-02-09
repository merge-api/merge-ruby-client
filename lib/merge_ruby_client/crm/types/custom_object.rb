# frozen_string_literal: true

require "date"
require_relative "remote_field"
require "json"

module Merge
  module Crm
    # # The CustomObject Object
    #
    # ### Description
    #
    # The `Custom Object` record refers to an instance of a Custom Object Class.
    #
    # ### Usage Example
    #
    # TODO
    class CustomObject
      attr_reader :object_class, :fields, :remote_id, :id, :created_at, :modified_at, :remote_fields,
                  :additional_properties

      # @param object_class [String]
      # @param fields [Hash{String => String}]
      # @param remote_id [String] The third-party API ID of the matching object.
      # @param id [String]
      # @param created_at [DateTime]
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param remote_fields [Array<Crm::RemoteField>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Crm::CustomObject]
      def initialize(object_class: nil, fields: nil, remote_id: nil, id: nil, created_at: nil, modified_at: nil,
                     remote_fields: nil, additional_properties: nil)
        # @type [String]
        @object_class = object_class
        # @type [Hash{String => String}]
        @fields = fields
        # @type [String] The third-party API ID of the matching object.
        @remote_id = remote_id
        # @type [String]
        @id = id
        # @type [DateTime]
        @created_at = created_at
        # @type [DateTime] This is the datetime that this object was last updated by Merge
        @modified_at = modified_at
        # @type [Array<Crm::RemoteField>]
        @remote_fields = remote_fields
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of CustomObject
      #
      # @param json_object [JSON]
      # @return [Crm::CustomObject]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        object_class = struct.object_class
        fields = struct.fields
        remote_id = struct.remote_id
        id = struct.id
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        remote_fields = parsed_json["remote_fields"]&.map do |v|
          v = v.to_json
          Crm::RemoteField.from_json(json_object: v)
        end
        new(object_class: object_class, fields: fields, remote_id: remote_id, id: id, created_at: created_at,
            modified_at: modified_at, remote_fields: remote_fields, additional_properties: struct)
      end

      # Serialize an instance of CustomObject to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "object_class": @object_class,
          "fields": @fields,
          "remote_id": @remote_id,
          "id": @id,
          "created_at": @created_at,
          "modified_at": @modified_at,
          "remote_fields": @remote_fields
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.object_class&.is_a?(String) != false || raise("Passed value for field obj.object_class is not the expected type, validation failed.")
        obj.fields&.is_a?(Hash) != false || raise("Passed value for field obj.fields is not the expected type, validation failed.")
        obj.remote_id&.is_a?(String) != false || raise("Passed value for field obj.remote_id is not the expected type, validation failed.")
        obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
        obj.remote_fields&.is_a?(Array) != false || raise("Passed value for field obj.remote_fields is not the expected type, validation failed.")
      end
    end
  end
end
