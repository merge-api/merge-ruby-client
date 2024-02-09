# frozen_string_literal: true

require_relative "folder_parent_folder"
require_relative "folder_drive"
require_relative "folder_permissions"
require "date"
require "json"

module Merge
  module Filestorage
    # # The Folder Object
    #
    # ### Description
    #
    # The `Folder` object is used to represent a collection of files and/or folders in the workspace. Could be within a drive, if it exists.
    #
    # ### Usage Example
    #
    # Fetch from the `GET /api/filestorage/v1/folders` endpoint and view their folders.
    class Folder
      attr_reader :id, :remote_id, :name, :folder_url, :size, :description, :parent_folder, :drive, :permissions,
                  :remote_created_at, :remote_updated_at, :remote_was_deleted, :created_at, :modified_at, :field_mappings, :remote_data, :additional_properties

      # @param id [String]
      # @param remote_id [String] The third-party API ID of the matching object.
      # @param name [String] The folder's name.
      # @param folder_url [String] The URL to access the folder.
      # @param size [Integer] The folder's size, in bytes.
      # @param description [String] The folder's description.
      # @param parent_folder [Filestorage::FolderParentFolder] The folder that the folder belongs to.
      # @param drive [Filestorage::FolderDrive] The drive that the folder belongs to.
      # @param permissions [Filestorage::FolderPermissions] The Permission object is used to represent a user's or group's access to a File or Folder. Permissions are unexpanded by default. Use the query param `expand=permissions` to see more details under `GET /folders`.
      # @param remote_created_at [DateTime] When the third party's folder was created.
      # @param remote_updated_at [DateTime] When the third party's folder was updated.
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party platform.
      # @param created_at [DateTime]
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param field_mappings [Hash{String => String}]
      # @param remote_data [Array<Hash>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Filestorage::Folder]
      def initialize(id: nil, remote_id: nil, name: nil, folder_url: nil, size: nil, description: nil,
                     parent_folder: nil, drive: nil, permissions: nil, remote_created_at: nil, remote_updated_at: nil, remote_was_deleted: nil, created_at: nil, modified_at: nil, field_mappings: nil, remote_data: nil, additional_properties: nil)
        # @type [String]
        @id = id
        # @type [String] The third-party API ID of the matching object.
        @remote_id = remote_id
        # @type [String] The folder's name.
        @name = name
        # @type [String] The URL to access the folder.
        @folder_url = folder_url
        # @type [Integer] The folder's size, in bytes.
        @size = size
        # @type [String] The folder's description.
        @description = description
        # @type [Filestorage::FolderParentFolder] The folder that the folder belongs to.
        @parent_folder = parent_folder
        # @type [Filestorage::FolderDrive] The drive that the folder belongs to.
        @drive = drive
        # @type [Filestorage::FolderPermissions] The Permission object is used to represent a user's or group's access to a File or Folder. Permissions are unexpanded by default. Use the query param `expand=permissions` to see more details under `GET /folders`.
        @permissions = permissions
        # @type [DateTime] When the third party's folder was created.
        @remote_created_at = remote_created_at
        # @type [DateTime] When the third party's folder was updated.
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

      # Deserialize a JSON object to an instance of Folder
      #
      # @param json_object [JSON]
      # @return [Filestorage::Folder]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = struct.id
        remote_id = struct.remote_id
        name = struct.name
        folder_url = struct.folder_url
        size = struct.size
        description = struct.description
        if parsed_json["parent_folder"].nil?
          parent_folder = nil
        else
          parent_folder = parsed_json["parent_folder"].to_json
          parent_folder = Filestorage::FolderParentFolder.from_json(json_object: parent_folder)
        end
        if parsed_json["drive"].nil?
          drive = nil
        else
          drive = parsed_json["drive"].to_json
          drive = Filestorage::FolderDrive.from_json(json_object: drive)
        end
        if parsed_json["permissions"].nil?
          permissions = nil
        else
          permissions = parsed_json["permissions"].to_json
          permissions = Filestorage::FolderPermissions.from_json(json_object: permissions)
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
        new(id: id, remote_id: remote_id, name: name, folder_url: folder_url, size: size, description: description,
            parent_folder: parent_folder, drive: drive, permissions: permissions, remote_created_at: remote_created_at, remote_updated_at: remote_updated_at, remote_was_deleted: remote_was_deleted, created_at: created_at, modified_at: modified_at, field_mappings: field_mappings, remote_data: remote_data, additional_properties: struct)
      end

      # Serialize an instance of Folder to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "id": @id,
          "remote_id": @remote_id,
          "name": @name,
          "folder_url": @folder_url,
          "size": @size,
          "description": @description,
          "parent_folder": @parent_folder,
          "drive": @drive,
          "permissions": @permissions,
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
        obj.folder_url&.is_a?(String) != false || raise("Passed value for field obj.folder_url is not the expected type, validation failed.")
        obj.size&.is_a?(Integer) != false || raise("Passed value for field obj.size is not the expected type, validation failed.")
        obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
        obj.parent_folder.nil? || Filestorage::FolderParentFolder.validate_raw(obj: obj.parent_folder)
        obj.drive.nil? || Filestorage::FolderDrive.validate_raw(obj: obj.drive)
        obj.permissions.nil? || Filestorage::FolderPermissions.validate_raw(obj: obj.permissions)
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
