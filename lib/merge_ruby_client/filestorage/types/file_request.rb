# frozen_string_literal: true

require_relative "file_request_folder"
require_relative "file_request_permissions"
require_relative "file_request_drive"
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
    class FileRequest
      attr_reader :name, :file_url, :file_thumbnail_url, :size, :mime_type, :description, :folder, :permissions,
                  :drive, :integration_params, :linked_account_params, :additional_properties

      # @param name [String] The file's name.
      # @param file_url [String] The URL to access the file.
      # @param file_thumbnail_url [String] The URL that produces a thumbnail preview of the file. Typically an image.
      # @param size [Integer] The file's size, in bytes.
      # @param mime_type [String] The file's mime type.
      # @param description [String] The file's description.
      # @param folder [Filestorage::FileRequestFolder] The folder that the file belongs to.
      # @param permissions [Filestorage::FileRequestPermissions] The Permission object is used to represent a user's or group's access to a File or Folder. Permissions are unexpanded by default. Use the query param `expand=permissions` to see more details under `GET /files`.
      # @param drive [Filestorage::FileRequestDrive] The drive that the file belongs to.
      # @param integration_params [Hash{String => String}]
      # @param linked_account_params [Hash{String => String}]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Filestorage::FileRequest]
      def initialize(name: nil, file_url: nil, file_thumbnail_url: nil, size: nil, mime_type: nil, description: nil,
                     folder: nil, permissions: nil, drive: nil, integration_params: nil, linked_account_params: nil, additional_properties: nil)
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
        # @type [Filestorage::FileRequestFolder] The folder that the file belongs to.
        @folder = folder
        # @type [Filestorage::FileRequestPermissions] The Permission object is used to represent a user's or group's access to a File or Folder. Permissions are unexpanded by default. Use the query param `expand=permissions` to see more details under `GET /files`.
        @permissions = permissions
        # @type [Filestorage::FileRequestDrive] The drive that the file belongs to.
        @drive = drive
        # @type [Hash{String => String}]
        @integration_params = integration_params
        # @type [Hash{String => String}]
        @linked_account_params = linked_account_params
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of FileRequest
      #
      # @param json_object [JSON]
      # @return [Filestorage::FileRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
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
          folder = Filestorage::FileRequestFolder.from_json(json_object: folder)
        end
        if parsed_json["permissions"].nil?
          permissions = nil
        else
          permissions = parsed_json["permissions"].to_json
          permissions = Filestorage::FileRequestPermissions.from_json(json_object: permissions)
        end
        if parsed_json["drive"].nil?
          drive = nil
        else
          drive = parsed_json["drive"].to_json
          drive = Filestorage::FileRequestDrive.from_json(json_object: drive)
        end
        integration_params = struct.integration_params
        linked_account_params = struct.linked_account_params
        new(name: name, file_url: file_url, file_thumbnail_url: file_thumbnail_url, size: size, mime_type: mime_type,
            description: description, folder: folder, permissions: permissions, drive: drive, integration_params: integration_params, linked_account_params: linked_account_params, additional_properties: struct)
      end

      # Serialize an instance of FileRequest to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "name": @name,
          "file_url": @file_url,
          "file_thumbnail_url": @file_thumbnail_url,
          "size": @size,
          "mime_type": @mime_type,
          "description": @description,
          "folder": @folder,
          "permissions": @permissions,
          "drive": @drive,
          "integration_params": @integration_params,
          "linked_account_params": @linked_account_params
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.file_url&.is_a?(String) != false || raise("Passed value for field obj.file_url is not the expected type, validation failed.")
        obj.file_thumbnail_url&.is_a?(String) != false || raise("Passed value for field obj.file_thumbnail_url is not the expected type, validation failed.")
        obj.size&.is_a?(Integer) != false || raise("Passed value for field obj.size is not the expected type, validation failed.")
        obj.mime_type&.is_a?(String) != false || raise("Passed value for field obj.mime_type is not the expected type, validation failed.")
        obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
        obj.folder.nil? || Filestorage::FileRequestFolder.validate_raw(obj: obj.folder)
        obj.permissions.nil? || Filestorage::FileRequestPermissions.validate_raw(obj: obj.permissions)
        obj.drive.nil? || Filestorage::FileRequestDrive.validate_raw(obj: obj.drive)
        obj.integration_params&.is_a?(Hash) != false || raise("Passed value for field obj.integration_params is not the expected type, validation failed.")
        obj.linked_account_params&.is_a?(Hash) != false || raise("Passed value for field obj.linked_account_params is not the expected type, validation failed.")
      end
    end
  end
end
