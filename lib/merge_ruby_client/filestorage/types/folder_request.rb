# frozen_string_literal: true

require_relative "folder_request_parent_folder"
require_relative "folder_request_drive"
require_relative "folder_request_permissions"
require "ostruct"
require "json"

module Merge
  module Filestorage
    # # The Folder Object
    #  ### Description
    #  The `Folder` object is used to represent a collection of files and/or folders in
    #  the workspace. Could be within a drive, if it exists.
    #  ### Usage Example
    #  Fetch from the `GET /api/filestorage/v1/folders` endpoint and view their
    #  folders.
    class FolderRequest
      # @return [String] The folder's name.
      attr_reader :name
      # @return [String] The URL to access the folder.
      attr_reader :folder_url
      # @return [Long] The folder's size, in bytes.
      attr_reader :size
      # @return [String] The folder's description.
      attr_reader :description
      # @return [Merge::Filestorage::FolderRequestParentFolder] The folder that the folder belongs to.
      attr_reader :parent_folder
      # @return [Merge::Filestorage::FolderRequestDrive] The drive that the folder belongs to.
      attr_reader :drive
      # @return [Merge::Filestorage::FolderRequestPermissions] The Permission object is used to represent a user's or group's access to a File
      #  or Folder. Permissions are unexpanded by default. Use the query param
      #  `expand=permissions` to see more details under `GET /folders`.
      attr_reader :permissions
      # @return [Hash{String => Object}]
      attr_reader :integration_params
      # @return [Hash{String => Object}]
      attr_reader :linked_account_params
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param name [String] The folder's name.
      # @param folder_url [String] The URL to access the folder.
      # @param size [Long] The folder's size, in bytes.
      # @param description [String] The folder's description.
      # @param parent_folder [Merge::Filestorage::FolderRequestParentFolder] The folder that the folder belongs to.
      # @param drive [Merge::Filestorage::FolderRequestDrive] The drive that the folder belongs to.
      # @param permissions [Merge::Filestorage::FolderRequestPermissions] The Permission object is used to represent a user's or group's access to a File
      #  or Folder. Permissions are unexpanded by default. Use the query param
      #  `expand=permissions` to see more details under `GET /folders`.
      # @param integration_params [Hash{String => Object}]
      # @param linked_account_params [Hash{String => Object}]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Filestorage::FolderRequest]
      def initialize(name: OMIT, folder_url: OMIT, size: OMIT, description: OMIT, parent_folder: OMIT, drive: OMIT,
                     permissions: OMIT, integration_params: OMIT, linked_account_params: OMIT, additional_properties: nil)
        @name = name if name != OMIT
        @folder_url = folder_url if folder_url != OMIT
        @size = size if size != OMIT
        @description = description if description != OMIT
        @parent_folder = parent_folder if parent_folder != OMIT
        @drive = drive if drive != OMIT
        @permissions = permissions if permissions != OMIT
        @integration_params = integration_params if integration_params != OMIT
        @linked_account_params = linked_account_params if linked_account_params != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "name": name,
          "folder_url": folder_url,
          "size": size,
          "description": description,
          "parent_folder": parent_folder,
          "drive": drive,
          "permissions": permissions,
          "integration_params": integration_params,
          "linked_account_params": linked_account_params
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of FolderRequest
      #
      # @param json_object [String]
      # @return [Merge::Filestorage::FolderRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        name = parsed_json["name"]
        folder_url = parsed_json["folder_url"]
        size = parsed_json["size"]
        description = parsed_json["description"]
        if parsed_json["parent_folder"].nil?
          parent_folder = nil
        else
          parent_folder = parsed_json["parent_folder"].to_json
          parent_folder = Merge::Filestorage::FolderRequestParentFolder.from_json(json_object: parent_folder)
        end
        if parsed_json["drive"].nil?
          drive = nil
        else
          drive = parsed_json["drive"].to_json
          drive = Merge::Filestorage::FolderRequestDrive.from_json(json_object: drive)
        end
        if parsed_json["permissions"].nil?
          permissions = nil
        else
          permissions = parsed_json["permissions"].to_json
          permissions = Merge::Filestorage::FolderRequestPermissions.from_json(json_object: permissions)
        end
        integration_params = parsed_json["integration_params"]
        linked_account_params = parsed_json["linked_account_params"]
        new(
          name: name,
          folder_url: folder_url,
          size: size,
          description: description,
          parent_folder: parent_folder,
          drive: drive,
          permissions: permissions,
          integration_params: integration_params,
          linked_account_params: linked_account_params,
          additional_properties: struct
        )
      end

      # Serialize an instance of FolderRequest to a JSON object
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
        obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.folder_url&.is_a?(String) != false || raise("Passed value for field obj.folder_url is not the expected type, validation failed.")
        obj.size&.is_a?(Long) != false || raise("Passed value for field obj.size is not the expected type, validation failed.")
        obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
        obj.parent_folder.nil? || Merge::Filestorage::FolderRequestParentFolder.validate_raw(obj: obj.parent_folder)
        obj.drive.nil? || Merge::Filestorage::FolderRequestDrive.validate_raw(obj: obj.drive)
        obj.permissions.nil? || Merge::Filestorage::FolderRequestPermissions.validate_raw(obj: obj.permissions)
        obj.integration_params&.is_a?(Hash) != false || raise("Passed value for field obj.integration_params is not the expected type, validation failed.")
        obj.linked_account_params&.is_a?(Hash) != false || raise("Passed value for field obj.linked_account_params is not the expected type, validation failed.")
      end
    end
  end
end
