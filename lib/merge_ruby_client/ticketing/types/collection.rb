# frozen_string_literal: true

require "date"
require_relative "collection_access_level_enum"
require_relative "collection_type_enum"
require_relative "collection_parent_collection"
require_relative "remote_data"
require "ostruct"
require "json"

module Merge
  module Ticketing
    # # The Collection Object
    #  ### Description
    #  The `Collection` object is used to represent one or more `Tickets`. There can be
    #  a hierarchy of `Collections`, in which a sub-collection belongs to a
    #  parent-collection.
    #  ### Usage Example
    #  TODO
    class Collection
      # @return [String]
      attr_reader :id
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [DateTime] The datetime that this object was created by Merge.
      attr_reader :created_at
      # @return [DateTime] The datetime that this object was modified by Merge.
      attr_reader :modified_at
      # @return [String] The collection's name.
      attr_reader :name
      # @return [String] The collection's description.
      attr_reader :description
      # @return [Merge::Ticketing::CollectionAccessLevelEnum] The level of access a User has to the Collection and its sub-objects.
      #  * `PRIVATE` - PRIVATE
      #  * `COMPANY` - COMPANY
      #  * `PUBLIC` - PUBLIC
      #  * `PARENT_COLLECTION` - PARENT_COLLECTION
      attr_reader :access_level
      # @return [Merge::Ticketing::CollectionTypeEnum] The collection's type.
      #  * `LIST` - LIST
      #  * `PROJECT` - PROJECT
      attr_reader :collection_type
      # @return [Merge::Ticketing::CollectionParentCollection] The parent collection for this collection.
      attr_reader :parent_collection
      # @return [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      attr_reader :remote_was_deleted
      # @return [Hash{String => Object}]
      attr_reader :field_mappings
      # @return [Array<Merge::Ticketing::RemoteData>]
      attr_reader :remote_data
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param id [String]
      # @param remote_id [String] The third-party API ID of the matching object.
      # @param created_at [DateTime] The datetime that this object was created by Merge.
      # @param modified_at [DateTime] The datetime that this object was modified by Merge.
      # @param name [String] The collection's name.
      # @param description [String] The collection's description.
      # @param access_level [Merge::Ticketing::CollectionAccessLevelEnum] The level of access a User has to the Collection and its sub-objects.
      #  * `PRIVATE` - PRIVATE
      #  * `COMPANY` - COMPANY
      #  * `PUBLIC` - PUBLIC
      #  * `PARENT_COLLECTION` - PARENT_COLLECTION
      # @param collection_type [Merge::Ticketing::CollectionTypeEnum] The collection's type.
      #  * `LIST` - LIST
      #  * `PROJECT` - PROJECT
      # @param parent_collection [Merge::Ticketing::CollectionParentCollection] The parent collection for this collection.
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      # @param field_mappings [Hash{String => Object}]
      # @param remote_data [Array<Merge::Ticketing::RemoteData>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Ticketing::Collection]
      def initialize(id: OMIT, remote_id: OMIT, created_at: OMIT, modified_at: OMIT, name: OMIT, description: OMIT,
                     access_level: OMIT, collection_type: OMIT, parent_collection: OMIT, remote_was_deleted: OMIT, field_mappings: OMIT, remote_data: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @name = name if name != OMIT
        @description = description if description != OMIT
        @access_level = access_level if access_level != OMIT
        @collection_type = collection_type if collection_type != OMIT
        @parent_collection = parent_collection if parent_collection != OMIT
        @remote_was_deleted = remote_was_deleted if remote_was_deleted != OMIT
        @field_mappings = field_mappings if field_mappings != OMIT
        @remote_data = remote_data if remote_data != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "remote_id": remote_id,
          "created_at": created_at,
          "modified_at": modified_at,
          "name": name,
          "description": description,
          "access_level": access_level,
          "collection_type": collection_type,
          "parent_collection": parent_collection,
          "remote_was_deleted": remote_was_deleted,
          "field_mappings": field_mappings,
          "remote_data": remote_data
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of Collection
      #
      # @param json_object [String]
      # @return [Merge::Ticketing::Collection]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = parsed_json["id"]
        remote_id = parsed_json["remote_id"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        name = parsed_json["name"]
        description = parsed_json["description"]
        access_level = parsed_json["access_level"]
        collection_type = parsed_json["collection_type"]
        if parsed_json["parent_collection"].nil?
          parent_collection = nil
        else
          parent_collection = parsed_json["parent_collection"].to_json
          parent_collection = Merge::Ticketing::CollectionParentCollection.from_json(json_object: parent_collection)
        end
        remote_was_deleted = parsed_json["remote_was_deleted"]
        field_mappings = parsed_json["field_mappings"]
        remote_data = parsed_json["remote_data"]&.map do |item|
          item = item.to_json
          Merge::Ticketing::RemoteData.from_json(json_object: item)
        end
        new(
          id: id,
          remote_id: remote_id,
          created_at: created_at,
          modified_at: modified_at,
          name: name,
          description: description,
          access_level: access_level,
          collection_type: collection_type,
          parent_collection: parent_collection,
          remote_was_deleted: remote_was_deleted,
          field_mappings: field_mappings,
          remote_data: remote_data,
          additional_properties: struct
        )
      end

      # Serialize an instance of Collection to a JSON object
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
        obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
        obj.access_level&.is_a?(Merge::Ticketing::CollectionAccessLevelEnum) != false || raise("Passed value for field obj.access_level is not the expected type, validation failed.")
        obj.collection_type&.is_a?(Merge::Ticketing::CollectionTypeEnum) != false || raise("Passed value for field obj.collection_type is not the expected type, validation failed.")
        obj.parent_collection.nil? || Merge::Ticketing::CollectionParentCollection.validate_raw(obj: obj.parent_collection)
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end
