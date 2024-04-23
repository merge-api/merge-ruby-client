# frozen_string_literal: true

require "json"
require_relative "permission_request"

module Merge
  module Filestorage
    # The Permission object is used to represent a user's or group's access to a File
    #  or Folder. Permissions are unexpanded by default. Use the query param
    #  `expand=permissions` to see more details under `GET /files`.
    class FileRequestPermissions
      # Deserialize a JSON object to an instance of FileRequestPermissions
      #
      # @param json_object [String]
      # @return [Merge::Filestorage::FileRequestPermissions]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        begin
          struct.is_a?(String) != false || raise("Passed value for field struct is not the expected type, validation failed.")
          return json_object unless json_object.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          Merge::Filestorage::PermissionRequest.validate_raw(obj: struct)
          return Merge::Filestorage::PermissionRequest.from_json(json_object: json_object) unless json_object.nil?

          return nil
        rescue StandardError
          # noop
        end
        begin
          struct.is_a?(Array) != false || raise("Passed value for field struct is not the expected type, validation failed.")
          return nil if json_object.nil?

          return json_object&.map do |v|
                   v = v.to_json
                   Merge::Filestorage::FileRequestPermissionsItem.from_json(json_object: v)
                 end
        rescue StandardError
          # noop
        end
        struct
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given
      #  hash and check each fields type against the current object's property
      #  definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        begin
          return obj.is_a?(String) != false || raise("Passed value for field obj is not the expected type, validation failed.")
        rescue StandardError
          # noop
        end
        begin
          return Merge::Filestorage::PermissionRequest.validate_raw(obj: obj)
        rescue StandardError
          # noop
        end
        begin
          return obj.is_a?(Array) != false || raise("Passed value for field obj is not the expected type, validation failed.")
        rescue StandardError
          # noop
        end
        raise("Passed value matched no type within the union, validation failed.")
      end
    end
  end
end
