# frozen_string_literal: true

require_relative "file_folder"
require_relative "file_permissions"
require_relative "file_drive"
require "date"
require "json"

module Merge
  module Filestorage
    # # The File Object
    #
    # ### Description
    #
    # The `File` object is used to represent a file in the workspace. The Object typically exists under a folder or drive, if it exists.
    #
    # ### Usage Example
    #
    # Fetch from the `GET /api/filestorage/v1/files` endpoint and view their files.
    class File
      attr_reader :id, :remote_id, :name, :file_url, :file_thumbnail_url, :size, :mime_type, :description, :folder,
                  :permissions, :drive, :remote_created_at, :remote_updated_at, :remote_was_deleted, :created_at, :modified_at, :field_mappings, :remote_data, :additional_properties

      # @param id [String]
      # @param remote_id [String] The third-party API ID of the matching object.
      # @param name [String] The file's name.
      # @param file_url [String] The URL to access the file.
      # @param file_thumbnail_url [String] The URL that produces a thumbnail preview of the file. Typically an image.
      # @param size [Integer] The file's size, in bytes.
      # @param mime_type [String] The file's mime type.
      # @param description [String] The file's description.
      # @param folder [Filestorage::FileFolder] The folder that the file belongs to.
      # @param permissions [Filestorage::FilePermissions] The Permission object is used to represent a user's or group's access to a File or Folder. Permissions are unexpanded by default. Use the query param `expand=permissions` to see more details under `GET /files`.
      # @param drive [Filestorage::FileDrive] The drive that the file belongs to.
      # @param remote_created_at [DateTime] When the third party's file was created.
      # @param remote_updated_at [DateTime] When the third party's file was updated.
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party platform.
      # @param created_at [DateTime]
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param field_mappings [Hash{String => String}]
      # @param remote_data [Array<Hash>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Filestorage::File]
      def initialize(id: nil, remote_id: nil, name: nil, file_url: nil, file_thumbnail_url: nil, size: nil,
                     mime_type: nil, description: nil, folder: nil, permissions: nil, drive: nil, remote_created_at: nil, remote_updated_at: nil, remote_was_deleted: nil, created_at: nil, modified_at: nil, field_mappings: nil, remote_data: nil, additional_properties: nil)
        # @type [String]
        @id = id
        # @type [String] The third-party API ID of the matching object.
        @remote_id = remote_id
        # @type [String] The file's name.
        @name = name
        # @type [String] The URL to access the file.
        @file_url = file_url
        # @type [String] The URL that produces a thumbnail preview of the file. Typically an image.
        @file_thumbnail_url = file_thumbnail_url
        # @type [Integer] The file's size, in bytes.
        @size = size
        # @type [String] The file's mime type.
        @mime_type = mime_type
        # @type [String] The file's description.
        @description = description
        # @type [Filestorage::FileFolder] The folder that the file belongs to.
        @folder = folder
        # @type [Filestorage::FilePermissions] The Permission object is used to represent a user's or group's access to a File or Folder. Permissions are unexpanded by default. Use the query param `expand=permissions` to see more details under `GET /files`.
        @permissions = permissions
        # @type [Filestorage::FileDrive] The drive that the file belongs to.
        @drive = drive
        # @type [DateTime] When the third party's file was created.
        @remote_created_at = remote_created_at
        # @type [DateTime] When the third party's file was updated.
        @remote_updated_at = remote_updated_at
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

      # Deserialize a JSON object to an instance of File
      #
      # @param json_object [JSON]
      # @return [Filestorage::File]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = struct.id
        remote_id = struct.remote_id
        name = struct.name
        file_url = struct.file_url
        file_thumbnail_url = struct.file_thumbnail_url
        size = struct.size
        mime_type = struct.mime_type
        description = struct.description
        if parsed_json["folder"].nil?
          folder = nil
        else
          folder = parsed_json["folder"].to_json
          folder = Filestorage::FileFolder.from_json(json_object: folder)
        end
        if parsed_json["permissions"].nil?
          permissions = nil
        else
          permissions = parsed_json["permissions"].to_json
          permissions = Filestorage::FilePermissions.from_json(json_object: permissions)
        end
        if parsed_json["drive"].nil?
          drive = nil
        else
          drive = parsed_json["drive"].to_json
          drive = Filestorage::FileDrive.from_json(json_object: drive)
        end
        remote_created_at = unless parsed_json["remote_created_at"].nil?
                              DateTime.parse(parsed_json["remote_created_at"])
                            end
        remote_updated_at = unless parsed_json["remote_updated_at"].nil?
                              DateTime.parse(parsed_json["remote_updated_at"])
                            end
        remote_was_deleted = struct.remote_was_deleted
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        field_mappings = struct.field_mappings
        remote_data = struct.remote_data
        new(id: id, remote_id: remote_id, name: name, file_url: file_url, file_thumbnail_url: file_thumbnail_url,
            size: size, mime_type: mime_type, description: description, folder: folder, permissions: permissions, drive: drive, remote_created_at: remote_created_at, remote_updated_at: remote_updated_at, remote_was_deleted: remote_was_deleted, created_at: created_at, modified_at: modified_at, field_mappings: field_mappings, remote_data: remote_data, additional_properties: struct)
      end

      # Serialize an instance of File to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "id": @id,
          "remote_id": @remote_id,
          "name": @name,
          "file_url": @file_url,
          "file_thumbnail_url": @file_thumbnail_url,
          "size": @size,
          "mime_type": @mime_type,
          "description": @description,
          "folder": @folder,
          "permissions": @permissions,
          "drive": @drive,
          "remote_created_at": @remote_created_at,
          "remote_updated_at": @remote_updated_at,
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
        obj.file_url&.is_a?(String) != false || raise("Passed value for field obj.file_url is not the expected type, validation failed.")
        obj.file_thumbnail_url&.is_a?(String) != false || raise("Passed value for field obj.file_thumbnail_url is not the expected type, validation failed.")
        obj.size&.is_a?(Integer) != false || raise("Passed value for field obj.size is not the expected type, validation failed.")
        obj.mime_type&.is_a?(String) != false || raise("Passed value for field obj.mime_type is not the expected type, validation failed.")
        obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
        obj.folder.nil? || Filestorage::FileFolder.validate_raw(obj: obj.folder)
        obj.permissions.nil? || Filestorage::FilePermissions.validate_raw(obj: obj.permissions)
        obj.drive.nil? || Filestorage::FileDrive.validate_raw(obj: obj.drive)
        obj.remote_created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_created_at is not the expected type, validation failed.")
        obj.remote_updated_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_updated_at is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end
