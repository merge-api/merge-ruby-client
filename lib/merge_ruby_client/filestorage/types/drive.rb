# frozen_string_literal: true

require "date"
require "json"

module Merge
  module Filestorage
    # # The Drive Object
    #
    # ### Description
    #
    # The `Drive` object is used to represent a drive that contains the folders and files in the user's workspace.
    #
    # ### Usage Example
    #
    # Fetch from the `GET /api/filestorage/v1/drives` endpoint and view their drives.
    class Drive
      attr_reader :id, :remote_id, :name, :remote_created_at, :drive_url, :remote_was_deleted, :created_at,
                  :modified_at, :field_mappings, :remote_data, :additional_properties

      # @param id [String]
      # @param remote_id [String] The third-party API ID of the matching object.
      # @param name [String] The drive's name.
      # @param remote_created_at [DateTime] When the third party's drive was created.
      # @param drive_url [String] The drive's url.
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party platform.
      # @param created_at [DateTime]
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param field_mappings [Hash{String => String}]
      # @param remote_data [Array<Hash>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Filestorage::Drive]
      def initialize(id: nil, remote_id: nil, name: nil, remote_created_at: nil, drive_url: nil,
                     remote_was_deleted: nil, created_at: nil, modified_at: nil, field_mappings: nil, remote_data: nil, additional_properties: nil)
        # @type [String]
        @id = id
        # @type [String] The third-party API ID of the matching object.
        @remote_id = remote_id
        # @type [String] The drive's name.
        @name = name
        # @type [DateTime] When the third party's drive was created.
        @remote_created_at = remote_created_at
        # @type [String] The drive's url.
        @drive_url = drive_url
        # @type [Boolean] Indicates whether or not this object has been deleted in the third party platform.
        @remote_was_deleted = remote_was_deleted
        # @type [DateTime]
        @created_at = created_at
        # @type [DateTime] This is the datetime that this object was last updated by Merge
        @modified_at = modified_at
        # @type [Hash{String => String}]
        @field_mappings = field_mappings
        # @type [Array<Hash>]
        @remote_data = remote_data
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of Drive
      #
      # @param json_object [JSON]
      # @return [Filestorage::Drive]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = struct.id
        remote_id = struct.remote_id
        name = struct.name
        remote_created_at = unless parsed_json["remote_created_at"].nil?
                              DateTime.parse(parsed_json["remote_created_at"])
                            end
        drive_url = struct.drive_url
        remote_was_deleted = struct.remote_was_deleted
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        field_mappings = struct.field_mappings
        remote_data = struct.remote_data
        new(id: id, remote_id: remote_id, name: name, remote_created_at: remote_created_at, drive_url: drive_url,
            remote_was_deleted: remote_was_deleted, created_at: created_at, modified_at: modified_at, field_mappings: field_mappings, remote_data: remote_data, additional_properties: struct)
      end

      # Serialize an instance of Drive to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "id": @id,
          "remote_id": @remote_id,
          "name": @name,
          "remote_created_at": @remote_created_at,
          "drive_url": @drive_url,
          "remote_was_deleted": @remote_was_deleted,
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
        obj.remote_created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_created_at is not the expected type, validation failed.")
        obj.drive_url&.is_a?(String) != false || raise("Passed value for field obj.drive_url is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end
