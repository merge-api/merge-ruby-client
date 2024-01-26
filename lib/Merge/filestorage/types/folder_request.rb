# frozen_string_literal: true
require_relative "folder_request_parent_folder"
require_relative "folder_request_drive"
require_relative "folder_request_permissions"
require "json"

module Merge
  module Filestorage
    # # The Folder Object 
### Description

The `Folder` object is used to represent a collection of files and/or folders in the workspace. Could be within a drive, if it exists.

### Usage Example

Fetch from the `GET /api/filestorage/v1/folders` endpoint and view their folders.
    class FolderRequest
      attr_reader :name, :folder_url, :size, :description, :parent_folder, :drive, :permissions, :integration_params, :linked_account_params, :additional_properties
      # @param name [String] The folder's name.
      # @param folder_url [String] The URL to access the folder.
      # @param size [Integer] The folder's size, in bytes.
      # @param description [String] The folder's description.
      # @param parent_folder [Filestorage::FolderRequestParentFolder] The folder that the folder belongs to.
      # @param drive [Filestorage::FolderRequestDrive] The drive that the folder belongs to.
      # @param permissions [Filestorage::FolderRequestPermissions] The Permission object is used to represent a user's or group's access to a File or Folder. Permissions are unexpanded by default. Use the query param `expand=permissions` to see more details under `GET /folders`.
      # @param integration_params [Hash{String => String}] 
      # @param linked_account_params [Hash{String => String}] 
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Filestorage::FolderRequest]
      def initialize(name: nil, folder_url: nil, size: nil, description: nil, parent_folder: nil, drive: nil, permissions: nil, integration_params: nil, linked_account_params: nil, additional_properties: nil)
        # @type [String] The folder's name.
        @name = name
        # @type [String] The URL to access the folder.
        @folder_url = folder_url
        # @type [Integer] The folder's size, in bytes.
        @size = size
        # @type [String] The folder's description.
        @description = description
        # @type [Filestorage::FolderRequestParentFolder] The folder that the folder belongs to.
        @parent_folder = parent_folder
        # @type [Filestorage::FolderRequestDrive] The drive that the folder belongs to.
        @drive = drive
        # @type [Filestorage::FolderRequestPermissions] The Permission object is used to represent a user's or group's access to a File or Folder. Permissions are unexpanded by default. Use the query param `expand=permissions` to see more details under `GET /folders`.
        @permissions = permissions
        # @type [Hash{String => String}] 
        @integration_params = integration_params
        # @type [Hash{String => String}] 
        @linked_account_params = linked_account_params
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end
      # Deserialize a JSON object to an instance of FolderRequest
      #
      # @param json_object [JSON] 
      # @return [Filestorage::FolderRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        name = struct.name
        folder_url = struct.folder_url
        size = struct.size
        description = struct.description
        parent_folder = struct.parent_folder.to_h.to_json()
        parent_folder = Filestorage::FolderRequestParentFolder.from_json(json_object: parent_folder)
        drive = struct.drive.to_h.to_json()
        drive = Filestorage::FolderRequestDrive.from_json(json_object: drive)
        permissions = struct.permissions.to_h.to_json()
        permissions = Filestorage::FolderRequestPermissions.from_json(json_object: permissions)
        integration_params = struct.integration_params
        linked_account_params = struct.linked_account_params
        new(name: name, folder_url: folder_url, size: size, description: description, parent_folder: parent_folder, drive: drive, permissions: permissions, integration_params: integration_params, linked_account_params: linked_account_params, additional_properties: struct)
      end
      # Serialize an instance of FolderRequest to a JSON object
      #
      # @return [JSON]
      def to_json
        { "name": @name, "folder_url": @folder_url, "size": @size, "description": @description, "parent_folder": @parent_folder, "drive": @drive, "permissions": @permissions, "integration_params": @integration_params, "linked_account_params": @linked_account_params }.to_json()
      end
      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object] 
      # @return [Void]
      def self.validate_raw(obj:)
        obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.folder_url&.is_a?(String) != false || raise("Passed value for field obj.folder_url is not the expected type, validation failed.")
        obj.size&.is_a?(Integer) != false || raise("Passed value for field obj.size is not the expected type, validation failed.")
        obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
        obj.parent_folder.nil?() || Filestorage::FolderRequestParentFolder.validate_raw(obj: obj.parent_folder)
        obj.drive.nil?() || Filestorage::FolderRequestDrive.validate_raw(obj: obj.drive)
        obj.permissions.nil?() || Filestorage::FolderRequestPermissions.validate_raw(obj: obj.permissions)
        obj.integration_params&.is_a?(Hash) != false || raise("Passed value for field obj.integration_params is not the expected type, validation failed.")
        obj.linked_account_params&.is_a?(Hash) != false || raise("Passed value for field obj.linked_account_params is not the expected type, validation failed.")
      end
    end
  end
end