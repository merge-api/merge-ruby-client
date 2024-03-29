# frozen_string_literal: true

require_relative "collection_type_enum"
require_relative "collection_parent_collection"
require_relative "access_level_enum"
require "date"
require_relative "remote_data"
require "json"

module Merge
  module Ticketing
    # # The Collection Object
    #
    # ### Description
    #
    # The `Collection` object is used to represent collections of tickets. Collections may include other collections as
    # sub collections.
    #
    # ### Usage Example
    #
    # TODO
    class Collection
      attr_reader :id, :remote_id, :name, :description, :collection_type, :parent_collection, :remote_was_deleted,
                  :access_level, :created_at, :modified_at, :field_mappings, :remote_data, :additional_properties

      # @param id [String]
      # @param remote_id [String] The third-party API ID of the matching object.
      # @param name [String] The collection's name.
      # @param description [String] The collection's description.
      # @param collection_type [COLLECTION_TYPE_ENUM] The collection's type.
      #   - `LIST` - LIST
      #   - `PROJECT` - PROJECT
      # @param parent_collection [Ticketing::CollectionParentCollection] The parent collection for this collection.
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party platform.
      # @param access_level [ACCESS_LEVEL_ENUM] The level of access a User has to the Collection and its sub-objects.
      #   - `PRIVATE` - PRIVATE
      #   - `COMPANY` - COMPANY
      #   - `PUBLIC` - PUBLIC
      # @param created_at [DateTime]
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param field_mappings [Hash{String => String}]
      # @param remote_data [Array<Ticketing::RemoteData>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Ticketing::Collection]
      def initialize(id: nil, remote_id: nil, name: nil, description: nil, collection_type: nil,
                     parent_collection: nil, remote_was_deleted: nil, access_level: nil, created_at: nil, modified_at: nil, field_mappings: nil, remote_data: nil, additional_properties: nil)
        # @type [String]
        @id = id
        # @type [String] The third-party API ID of the matching object.
        @remote_id = remote_id
        # @type [String] The collection's name.
        @name = name
        # @type [String] The collection's description.
        @description = description
        # @type [COLLECTION_TYPE_ENUM] The collection's type.
        #   - `LIST` - LIST
        #   - `PROJECT` - PROJECT
        @collection_type = collection_type
        # @type [Ticketing::CollectionParentCollection] The parent collection for this collection.
        @parent_collection = parent_collection
        # @type [Boolean] Indicates whether or not this object has been deleted in the third party platform.
        @remote_was_deleted = remote_was_deleted
        # @type [ACCESS_LEVEL_ENUM] The level of access a User has to the Collection and its sub-objects.
        #   - `PRIVATE` - PRIVATE
        #   - `COMPANY` - COMPANY
        #   - `PUBLIC` - PUBLIC
        @access_level = access_level
        # @type [DateTime]
        @created_at = created_at
        # @type [DateTime] This is the datetime that this object was last updated by Merge
        @modified_at = modified_at
        # @type [Hash{String => String}]
        @field_mappings = field_mappings
        # @type [Array<Ticketing::RemoteData>]
        @remote_data = remote_data
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of Collection
      #
      # @param json_object [JSON]
      # @return [Ticketing::Collection]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = struct.id
        remote_id = struct.remote_id
        name = struct.name
        description = struct.description
        collection_type = Ticketing::COLLECTION_TYPE_ENUM.key(parsed_json["collection_type"]) || parsed_json["collection_type"]
        if parsed_json["parent_collection"].nil?
          parent_collection = nil
        else
          parent_collection = parsed_json["parent_collection"].to_json
          parent_collection = Ticketing::CollectionParentCollection.from_json(json_object: parent_collection)
        end
        remote_was_deleted = struct.remote_was_deleted
        access_level = Ticketing::ACCESS_LEVEL_ENUM.key(parsed_json["access_level"]) || parsed_json["access_level"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        field_mappings = struct.field_mappings
        remote_data = parsed_json["remote_data"]&.map do |v|
          v = v.to_json
          Ticketing::RemoteData.from_json(json_object: v)
        end
        new(id: id, remote_id: remote_id, name: name, description: description, collection_type: collection_type,
            parent_collection: parent_collection, remote_was_deleted: remote_was_deleted, access_level: access_level, created_at: created_at, modified_at: modified_at, field_mappings: field_mappings, remote_data: remote_data, additional_properties: struct)
      end

      # Serialize an instance of Collection to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "id": @id,
          "remote_id": @remote_id,
          "name": @name,
          "description": @description,
          "collection_type": Ticketing::COLLECTION_TYPE_ENUM[@collection_type] || @collection_type,
          "parent_collection": @parent_collection,
          "remote_was_deleted": @remote_was_deleted,
          "access_level": Ticketing::ACCESS_LEVEL_ENUM[@access_level] || @access_level,
          "created_at": @created_at,
          "modified_at": @modified_at,
          "field_mappings": @field_mappings,
          "remote_data": @remote_data
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.remote_id&.is_a?(String) != false || raise("Passed value for field obj.remote_id is not the expected type, validation failed.")
        obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
        obj.collection_type&.is_a?(Ticketing::COLLECTION_TYPE_ENUM) != false || raise("Passed value for field obj.collection_type is not the expected type, validation failed.")
        obj.parent_collection.nil? || Ticketing::CollectionParentCollection.validate_raw(obj: obj.parent_collection)
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.access_level&.is_a?(Ticketing::ACCESS_LEVEL_ENUM) != false || raise("Passed value for field obj.access_level is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end
