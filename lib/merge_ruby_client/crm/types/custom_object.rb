# frozen_string_literal: true

require "date"
require_relative "remote_field"
require "ostruct"
require "json"

module Merge
  module Crm
    # # The CustomObject Object
    #  ### Description
    #  The `Custom Object` record refers to an instance of a Custom Object Class.
    #  ### Usage Example
    #  TODO
    class CustomObject
      # @return [String]
      attr_reader :id
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [DateTime]
      attr_reader :created_at
      # @return [DateTime] This is the datetime that this object was last updated by Merge
      attr_reader :modified_at
      # @return [String]
      attr_reader :object_class
      # @return [Hash{String => Object}]
      attr_reader :fields
      # @return [Array<Merge::Crm::RemoteField>]
      attr_reader :remote_fields
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param id [String]
      # @param remote_id [String] The third-party API ID of the matching object.
      # @param created_at [DateTime]
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param object_class [String]
      # @param fields [Hash{String => Object}]
      # @param remote_fields [Array<Merge::Crm::RemoteField>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Crm::CustomObject]
      def initialize(id: OMIT, remote_id: OMIT, created_at: OMIT, modified_at: OMIT, object_class: OMIT, fields: OMIT,
                     remote_fields: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @object_class = object_class if object_class != OMIT
        @fields = fields if fields != OMIT
        @remote_fields = remote_fields if remote_fields != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "remote_id": remote_id,
          "created_at": created_at,
          "modified_at": modified_at,
          "object_class": object_class,
          "fields": fields,
          "remote_fields": remote_fields
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of CustomObject
      #
      # @param json_object [String]
      # @return [Merge::Crm::CustomObject]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = struct["id"]
        remote_id = struct["remote_id"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        object_class = struct["object_class"]
        fields = struct["fields"]
        remote_fields = parsed_json["remote_fields"]&.map do |v|
          v = v.to_json
          Merge::Crm::RemoteField.from_json(json_object: v)
        end
        new(
          id: id,
          remote_id: remote_id,
          created_at: created_at,
          modified_at: modified_at,
          object_class: object_class,
          fields: fields,
          remote_fields: remote_fields,
          additional_properties: struct
        )
      end

      # Serialize an instance of CustomObject to a JSON object
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
        obj.remote_id&.is_a?(String) != false || raise("Passed value for field obj.remote_id is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
        obj.object_class&.is_a?(String) != false || raise("Passed value for field obj.object_class is not the expected type, validation failed.")
        obj.fields&.is_a?(Hash) != false || raise("Passed value for field obj.fields is not the expected type, validation failed.")
        obj.remote_fields&.is_a?(Array) != false || raise("Passed value for field obj.remote_fields is not the expected type, validation failed.")
      end
    end
  end
end
