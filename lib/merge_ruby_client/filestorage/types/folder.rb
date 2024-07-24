# frozen_string_literal: true

require "date"
require_relative "folder_parent_folder"
require_relative "folder_drive"
require_relative "folder_permissions"
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
    class Folder
      # @return [String]
      attr_reader :id
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [DateTime] The datetime that this object was created by Merge.
      attr_reader :created_at
      # @return [DateTime] The datetime that this object was modified by Merge.
      attr_reader :modified_at
      # @return [String] The folder's name.
      attr_reader :name
      # @return [String] The URL to access the folder.
      attr_reader :folder_url
      # @return [Integer] The folder's size, in bytes.
      attr_reader :size
      # @return [String] The folder's description.
      attr_reader :description
      # @return [Merge::Filestorage::FolderParentFolder] The folder that the folder belongs to.
      attr_reader :parent_folder
      # @return [Merge::Filestorage::FolderDrive] The drive that the folder belongs to.
      attr_reader :drive
      # @return [Merge::Filestorage::FolderPermissions] The Permission object is used to represent a user's or group's access to a File
      #  or Folder. Permissions are unexpanded by default. Use the query param
      #  `expand=permissions` to see more details under `GET /folders`.
      attr_reader :permissions
      # @return [DateTime] When the third party's folder was created.
      attr_reader :remote_created_at
      # @return [DateTime] When the third party's folder was updated.
      attr_reader :remote_updated_at
      # @return [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform.
      attr_reader :remote_was_deleted
      # @return [Hash{String => Object}]
      attr_reader :field_mappings
      # @return [Array<Hash{String => Object}>]
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
      # @param name [String] The folder's name.
      # @param folder_url [String] The URL to access the folder.
      # @param size [Integer] The folder's size, in bytes.
      # @param description [String] The folder's description.
      # @param parent_folder [Merge::Filestorage::FolderParentFolder] The folder that the folder belongs to.
      # @param drive [Merge::Filestorage::FolderDrive] The drive that the folder belongs to.
      # @param permissions [Merge::Filestorage::FolderPermissions] The Permission object is used to represent a user's or group's access to a File
      #  or Folder. Permissions are unexpanded by default. Use the query param
      #  `expand=permissions` to see more details under `GET /folders`.
      # @param remote_created_at [DateTime] When the third party's folder was created.
      # @param remote_updated_at [DateTime] When the third party's folder was updated.
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform.
      # @param field_mappings [Hash{String => Object}]
      # @param remote_data [Array<Hash{String => Object}>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Filestorage::Folder]
      def initialize(id: OMIT, remote_id: OMIT, created_at: OMIT, modified_at: OMIT, name: OMIT, folder_url: OMIT,
                     size: OMIT, description: OMIT, parent_folder: OMIT, drive: OMIT, permissions: OMIT, remote_created_at: OMIT, remote_updated_at: OMIT, remote_was_deleted: OMIT, field_mappings: OMIT, remote_data: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @name = name if name != OMIT
        @folder_url = folder_url if folder_url != OMIT
        @size = size if size != OMIT
        @description = description if description != OMIT
        @parent_folder = parent_folder if parent_folder != OMIT
        @drive = drive if drive != OMIT
        @permissions = permissions if permissions != OMIT
        @remote_created_at = remote_created_at if remote_created_at != OMIT
        @remote_updated_at = remote_updated_at if remote_updated_at != OMIT
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
          "folder_url": folder_url,
          "size": size,
          "description": description,
          "parent_folder": parent_folder,
          "drive": drive,
          "permissions": permissions,
          "remote_created_at": remote_created_at,
          "remote_updated_at": remote_updated_at,
          "remote_was_deleted": remote_was_deleted,
          "field_mappings": field_mappings,
          "remote_data": remote_data
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of Folder
      #
      # @param json_object [String]
      # @return [Merge::Filestorage::Folder]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = parsed_json["id"]
        remote_id = parsed_json["remote_id"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        name = parsed_json["name"]
        folder_url = parsed_json["folder_url"]
        size = parsed_json["size"]
        description = parsed_json["description"]
        if parsed_json["parent_folder"].nil?
          parent_folder = nil
        else
          parent_folder = parsed_json["parent_folder"].to_json
          parent_folder = Merge::Filestorage::FolderParentFolder.from_json(json_object: parent_folder)
        end
        if parsed_json["drive"].nil?
          drive = nil
        else
          drive = parsed_json["drive"].to_json
          drive = Merge::Filestorage::FolderDrive.from_json(json_object: drive)
        end
        if parsed_json["permissions"].nil?
          permissions = nil
        else
          permissions = parsed_json["permissions"].to_json
          permissions = Merge::Filestorage::FolderPermissions.from_json(json_object: permissions)
        end
        remote_created_at = unless parsed_json["remote_created_at"].nil?
                              DateTime.parse(parsed_json["remote_created_at"])
                            end
        remote_updated_at = unless parsed_json["remote_updated_at"].nil?
                              DateTime.parse(parsed_json["remote_updated_at"])
                            end
        remote_was_deleted = parsed_json["remote_was_deleted"]
        field_mappings = parsed_json["field_mappings"]
        remote_data = parsed_json["remote_data"]
        new(
          id: id,
          remote_id: remote_id,
          created_at: created_at,
          modified_at: modified_at,
          name: name,
          folder_url: folder_url,
          size: size,
          description: description,
          parent_folder: parent_folder,
          drive: drive,
          permissions: permissions,
          remote_created_at: remote_created_at,
          remote_updated_at: remote_updated_at,
          remote_was_deleted: remote_was_deleted,
          field_mappings: field_mappings,
          remote_data: remote_data,
          additional_properties: struct
        )
      end

      # Serialize an instance of Folder to a JSON object
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
        obj.folder_url&.is_a?(String) != false || raise("Passed value for field obj.folder_url is not the expected type, validation failed.")
        obj.size&.is_a?(Integer) != false || raise("Passed value for field obj.size is not the expected type, validation failed.")
        obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
        obj.parent_folder.nil? || Merge::Filestorage::FolderParentFolder.validate_raw(obj: obj.parent_folder)
        obj.drive.nil? || Merge::Filestorage::FolderDrive.validate_raw(obj: obj.drive)
        obj.permissions.nil? || Merge::Filestorage::FolderPermissions.validate_raw(obj: obj.permissions)
        obj.remote_created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_created_at is not the expected type, validation failed.")
        obj.remote_updated_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_updated_at is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end
