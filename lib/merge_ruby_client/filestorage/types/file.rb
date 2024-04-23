# frozen_string_literal: true

require "date"
require_relative "file_folder"
require_relative "file_permissions"
require_relative "file_drive"
require "ostruct"
require "json"

module Merge
  module Filestorage
    # # The File Object
    #  ### Description
    #  The `File` object is used to represent a file in the workspace. The Object
    #  typically exists under a folder or drive, if it exists.
    #  ### Usage Example
    #  Fetch from the `GET /api/filestorage/v1/files` endpoint and view their files.
    class File
      # @return [String]
      attr_reader :id
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [DateTime]
      attr_reader :created_at
      # @return [DateTime] This is the datetime that this object was last updated by Merge
      attr_reader :modified_at
      # @return [String] The file's name.
      attr_reader :name
      # @return [String] The URL to access the file.
      attr_reader :file_url
      # @return [String] The URL that produces a thumbnail preview of the file. Typically an image.
      attr_reader :file_thumbnail_url
      # @return [Integer] The file's size, in bytes.
      attr_reader :size
      # @return [String] The file's mime type.
      attr_reader :mime_type
      # @return [String] The file's description.
      attr_reader :description
      # @return [Merge::Filestorage::FileFolder] The folder that the file belongs to.
      attr_reader :folder
      # @return [Merge::Filestorage::FilePermissions] The Permission object is used to represent a user's or group's access to a File
      #  or Folder. Permissions are unexpanded by default. Use the query param
      #  `expand=permissions` to see more details under `GET /files`.
      attr_reader :permissions
      # @return [Merge::Filestorage::FileDrive] The drive that the file belongs to.
      attr_reader :drive
      # @return [DateTime] When the third party's file was created.
      attr_reader :remote_created_at
      # @return [DateTime] When the third party's file was updated.
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
      # @param created_at [DateTime]
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param name [String] The file's name.
      # @param file_url [String] The URL to access the file.
      # @param file_thumbnail_url [String] The URL that produces a thumbnail preview of the file. Typically an image.
      # @param size [Integer] The file's size, in bytes.
      # @param mime_type [String] The file's mime type.
      # @param description [String] The file's description.
      # @param folder [Merge::Filestorage::FileFolder] The folder that the file belongs to.
      # @param permissions [Merge::Filestorage::FilePermissions] The Permission object is used to represent a user's or group's access to a File
      #  or Folder. Permissions are unexpanded by default. Use the query param
      #  `expand=permissions` to see more details under `GET /files`.
      # @param drive [Merge::Filestorage::FileDrive] The drive that the file belongs to.
      # @param remote_created_at [DateTime] When the third party's file was created.
      # @param remote_updated_at [DateTime] When the third party's file was updated.
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform.
      # @param field_mappings [Hash{String => Object}]
      # @param remote_data [Array<Hash{String => Object}>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Filestorage::File]
      def initialize(id: OMIT, remote_id: OMIT, created_at: OMIT, modified_at: OMIT, name: OMIT, file_url: OMIT,
                     file_thumbnail_url: OMIT, size: OMIT, mime_type: OMIT, description: OMIT, folder: OMIT, permissions: OMIT, drive: OMIT, remote_created_at: OMIT, remote_updated_at: OMIT, remote_was_deleted: OMIT, field_mappings: OMIT, remote_data: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @name = name if name != OMIT
        @file_url = file_url if file_url != OMIT
        @file_thumbnail_url = file_thumbnail_url if file_thumbnail_url != OMIT
        @size = size if size != OMIT
        @mime_type = mime_type if mime_type != OMIT
        @description = description if description != OMIT
        @folder = folder if folder != OMIT
        @permissions = permissions if permissions != OMIT
        @drive = drive if drive != OMIT
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
          "file_url": file_url,
          "file_thumbnail_url": file_thumbnail_url,
          "size": size,
          "mime_type": mime_type,
          "description": description,
          "folder": folder,
          "permissions": permissions,
          "drive": drive,
          "remote_created_at": remote_created_at,
          "remote_updated_at": remote_updated_at,
          "remote_was_deleted": remote_was_deleted,
          "field_mappings": field_mappings,
          "remote_data": remote_data
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of File
      #
      # @param json_object [String]
      # @return [Merge::Filestorage::File]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = struct["id"]
        remote_id = struct["remote_id"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        name = struct["name"]
        file_url = struct["file_url"]
        file_thumbnail_url = struct["file_thumbnail_url"]
        size = struct["size"]
        mime_type = struct["mime_type"]
        description = struct["description"]
        if parsed_json["folder"].nil?
          folder = nil
        else
          folder = parsed_json["folder"].to_json
          folder = Merge::Filestorage::FileFolder.from_json(json_object: folder)
        end
        if parsed_json["permissions"].nil?
          permissions = nil
        else
          permissions = parsed_json["permissions"].to_json
          permissions = Merge::Filestorage::FilePermissions.from_json(json_object: permissions)
        end
        if parsed_json["drive"].nil?
          drive = nil
        else
          drive = parsed_json["drive"].to_json
          drive = Merge::Filestorage::FileDrive.from_json(json_object: drive)
        end
        remote_created_at = unless parsed_json["remote_created_at"].nil?
                              DateTime.parse(parsed_json["remote_created_at"])
                            end
        remote_updated_at = unless parsed_json["remote_updated_at"].nil?
                              DateTime.parse(parsed_json["remote_updated_at"])
                            end
        remote_was_deleted = struct["remote_was_deleted"]
        field_mappings = struct["field_mappings"]
        remote_data = struct["remote_data"]
        new(
          id: id,
          remote_id: remote_id,
          created_at: created_at,
          modified_at: modified_at,
          name: name,
          file_url: file_url,
          file_thumbnail_url: file_thumbnail_url,
          size: size,
          mime_type: mime_type,
          description: description,
          folder: folder,
          permissions: permissions,
          drive: drive,
          remote_created_at: remote_created_at,
          remote_updated_at: remote_updated_at,
          remote_was_deleted: remote_was_deleted,
          field_mappings: field_mappings,
          remote_data: remote_data,
          additional_properties: struct
        )
      end

      # Serialize an instance of File to a JSON object
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
        obj.file_url&.is_a?(String) != false || raise("Passed value for field obj.file_url is not the expected type, validation failed.")
        obj.file_thumbnail_url&.is_a?(String) != false || raise("Passed value for field obj.file_thumbnail_url is not the expected type, validation failed.")
        obj.size&.is_a?(Integer) != false || raise("Passed value for field obj.size is not the expected type, validation failed.")
        obj.mime_type&.is_a?(String) != false || raise("Passed value for field obj.mime_type is not the expected type, validation failed.")
        obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
        obj.folder.nil? || Merge::Filestorage::FileFolder.validate_raw(obj: obj.folder)
        obj.permissions.nil? || Merge::Filestorage::FilePermissions.validate_raw(obj: obj.permissions)
        obj.drive.nil? || Merge::Filestorage::FileDrive.validate_raw(obj: obj.drive)
        obj.remote_created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_created_at is not the expected type, validation failed.")
        obj.remote_updated_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_updated_at is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end
