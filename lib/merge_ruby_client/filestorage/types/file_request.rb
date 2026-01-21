# frozen_string_literal: true

require_relative "permission_request"
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
    class FileRequest
      # @return [String] The file's name.
      attr_reader :name
      # @return [String] The URL to access the file.
      attr_reader :file_url
      # @return [String] The URL that produces a thumbnail preview of the file. Typically an image.
      attr_reader :file_thumbnail_url
      # @return [Long] The file's size, in bytes.
      attr_reader :size
      # @return [String] The file's mime type.
      attr_reader :mime_type
      # @return [String] The file's description.
      attr_reader :description
      # @return [String] The folder that the file belongs to.
      attr_reader :folder
      # @return [Hash{String => Object}] This field stores file checksum data. 'type' indicates the algorithm (e.g.
      #  crc_32, sha1, sha256, quickXor, or md5), and 'content_hash' is the unique hash
      #  used to verify file integrity and detect alterations.
      attr_reader :checksum
      # @return [Array<Merge::Filestorage::PermissionRequest>]
      attr_reader :permissions
      # @return [String] The drive that the file belongs to.
      attr_reader :drive
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

      # @param name [String] The file's name.
      # @param file_url [String] The URL to access the file.
      # @param file_thumbnail_url [String] The URL that produces a thumbnail preview of the file. Typically an image.
      # @param size [Long] The file's size, in bytes.
      # @param mime_type [String] The file's mime type.
      # @param description [String] The file's description.
      # @param folder [String] The folder that the file belongs to.
      # @param checksum [Hash{String => Object}] This field stores file checksum data. 'type' indicates the algorithm (e.g.
      #  crc_32, sha1, sha256, quickXor, or md5), and 'content_hash' is the unique hash
      #  used to verify file integrity and detect alterations.
      # @param permissions [Array<Merge::Filestorage::PermissionRequest>]
      # @param drive [String] The drive that the file belongs to.
      # @param integration_params [Hash{String => Object}]
      # @param linked_account_params [Hash{String => Object}]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Filestorage::FileRequest]
      def initialize(name: OMIT, file_url: OMIT, file_thumbnail_url: OMIT, size: OMIT, mime_type: OMIT,
                     description: OMIT, folder: OMIT, checksum: OMIT, permissions: OMIT, drive: OMIT, integration_params: OMIT, linked_account_params: OMIT, additional_properties: nil)
        @name = name if name != OMIT
        @file_url = file_url if file_url != OMIT
        @file_thumbnail_url = file_thumbnail_url if file_thumbnail_url != OMIT
        @size = size if size != OMIT
        @mime_type = mime_type if mime_type != OMIT
        @description = description if description != OMIT
        @folder = folder if folder != OMIT
        @checksum = checksum if checksum != OMIT
        @permissions = permissions if permissions != OMIT
        @drive = drive if drive != OMIT
        @integration_params = integration_params if integration_params != OMIT
        @linked_account_params = linked_account_params if linked_account_params != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "name": name,
          "file_url": file_url,
          "file_thumbnail_url": file_thumbnail_url,
          "size": size,
          "mime_type": mime_type,
          "description": description,
          "folder": folder,
          "checksum": checksum,
          "permissions": permissions,
          "drive": drive,
          "integration_params": integration_params,
          "linked_account_params": linked_account_params
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of FileRequest
      #
      # @param json_object [String]
      # @return [Merge::Filestorage::FileRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        name = parsed_json["name"]
        file_url = parsed_json["file_url"]
        file_thumbnail_url = parsed_json["file_thumbnail_url"]
        size = parsed_json["size"]
        mime_type = parsed_json["mime_type"]
        description = parsed_json["description"]
        folder = parsed_json["folder"]
        checksum = parsed_json["checksum"]
        permissions = parsed_json["permissions"]&.map do |item|
          item = item.to_json
          Merge::Filestorage::PermissionRequest.from_json(json_object: item)
        end
        drive = parsed_json["drive"]
        integration_params = parsed_json["integration_params"]
        linked_account_params = parsed_json["linked_account_params"]
        new(
          name: name,
          file_url: file_url,
          file_thumbnail_url: file_thumbnail_url,
          size: size,
          mime_type: mime_type,
          description: description,
          folder: folder,
          checksum: checksum,
          permissions: permissions,
          drive: drive,
          integration_params: integration_params,
          linked_account_params: linked_account_params,
          additional_properties: struct
        )
      end

      # Serialize an instance of FileRequest to a JSON object
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
        obj.file_url&.is_a?(String) != false || raise("Passed value for field obj.file_url is not the expected type, validation failed.")
        obj.file_thumbnail_url&.is_a?(String) != false || raise("Passed value for field obj.file_thumbnail_url is not the expected type, validation failed.")
        obj.size&.is_a?(Long) != false || raise("Passed value for field obj.size is not the expected type, validation failed.")
        obj.mime_type&.is_a?(String) != false || raise("Passed value for field obj.mime_type is not the expected type, validation failed.")
        obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
        obj.folder&.is_a?(String) != false || raise("Passed value for field obj.folder is not the expected type, validation failed.")
        obj.checksum&.is_a?(Hash) != false || raise("Passed value for field obj.checksum is not the expected type, validation failed.")
        obj.permissions&.is_a?(Array) != false || raise("Passed value for field obj.permissions is not the expected type, validation failed.")
        obj.drive&.is_a?(String) != false || raise("Passed value for field obj.drive is not the expected type, validation failed.")
        obj.integration_params&.is_a?(Hash) != false || raise("Passed value for field obj.integration_params is not the expected type, validation failed.")
        obj.linked_account_params&.is_a?(Hash) != false || raise("Passed value for field obj.linked_account_params is not the expected type, validation failed.")
      end
    end
  end
end
