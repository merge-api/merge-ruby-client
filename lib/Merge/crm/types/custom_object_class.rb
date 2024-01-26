# frozen_string_literal: true
require_relative "remote_field_class_for_custom_object_class"
require "date"
require "date"
require "json"

module Merge
  module Crm
    # # The Custom Object Class Object 
### Description

The `Custom Object Class` object is used to represent a Custom Object Schema in the remote system.

### Usage Example

TODO
    class CustomObjectClass
      attr_reader :name, :description, :labels, :fields, :association_types, :id, :remote_id, :created_at, :modified_at, :additional_properties
      # @param name [String] 
      # @param description [String] 
      # @param labels [Hash{String => String}] 
      # @param fields [Array<Crm::RemoteFieldClassForCustomObjectClass>] 
      # @param association_types [Array<Hash>] 
      # @param id [String] 
      # @param remote_id [String] The third-party API ID of the matching object.
      # @param created_at [DateTime] 
      # @param modified_at [DateTime] 
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Crm::CustomObjectClass]
      def initialize(name: nil, description: nil, labels: nil, fields: nil, association_types: nil, id: nil, remote_id: nil, created_at: nil, modified_at: nil, additional_properties: nil)
        # @type [String] 
        @name = name
        # @type [String] 
        @description = description
        # @type [Hash{String => String}] 
        @labels = labels
        # @type [Array<Crm::RemoteFieldClassForCustomObjectClass>] 
        @fields = fields
        # @type [Array<Hash>] 
        @association_types = association_types
        # @type [String] 
        @id = id
        # @type [String] The third-party API ID of the matching object.
        @remote_id = remote_id
        # @type [DateTime] 
        @created_at = created_at
        # @type [DateTime] 
        @modified_at = modified_at
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end
      # Deserialize a JSON object to an instance of CustomObjectClass
      #
      # @param json_object [JSON] 
      # @return [Crm::CustomObjectClass]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        name = struct.name
        description = struct.description
        labels = struct.labels
        fields = struct.fields.map() do | v |
  v = v.to_h.to_json()
  Crm::RemoteFieldClassForCustomObjectClass.from_json(json_object: v)
end
        association_types = struct.association_types
        id = struct.id
        remote_id = struct.remote_id
        created_at = DateTime.parse(struct.created_at)
        modified_at = DateTime.parse(struct.modified_at)
        new(name: name, description: description, labels: labels, fields: fields, association_types: association_types, id: id, remote_id: remote_id, created_at: created_at, modified_at: modified_at, additional_properties: struct)
      end
      # Serialize an instance of CustomObjectClass to a JSON object
      #
      # @return [JSON]
      def to_json
        { "name": @name, "description": @description, "labels": @labels, "fields": @fields, "association_types": @association_types, "id": @id, "remote_id": @remote_id, "created_at": @created_at, "modified_at": @modified_at }.to_json()
      end
      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object] 
      # @return [Void]
      def self.validate_raw(obj:)
        obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
        obj.labels&.is_a?(Hash) != false || raise("Passed value for field obj.labels is not the expected type, validation failed.")
        obj.fields&.is_a?(Array) != false || raise("Passed value for field obj.fields is not the expected type, validation failed.")
        obj.association_types&.is_a?(Array) != false || raise("Passed value for field obj.association_types is not the expected type, validation failed.")
        obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.remote_id&.is_a?(String) != false || raise("Passed value for field obj.remote_id is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
      end
    end
  end
end