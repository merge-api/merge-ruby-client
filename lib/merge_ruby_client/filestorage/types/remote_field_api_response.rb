# frozen_string_literal: true

require_relative "remote_field_api"
require "ostruct"
require "json"

module Merge
  module Filestorage
    class RemoteFieldApiResponse
      # @return [Array<Merge::Filestorage::RemoteFieldApi>]
      attr_reader :file
      # @return [Array<Merge::Filestorage::RemoteFieldApi>]
      attr_reader :folder
      # @return [Array<Merge::Filestorage::RemoteFieldApi>]
      attr_reader :drive
      # @return [Array<Merge::Filestorage::RemoteFieldApi>]
      attr_reader :group
      # @return [Array<Merge::Filestorage::RemoteFieldApi>]
      attr_reader :user
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param file [Array<Merge::Filestorage::RemoteFieldApi>]
      # @param folder [Array<Merge::Filestorage::RemoteFieldApi>]
      # @param drive [Array<Merge::Filestorage::RemoteFieldApi>]
      # @param group [Array<Merge::Filestorage::RemoteFieldApi>]
      # @param user [Array<Merge::Filestorage::RemoteFieldApi>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Filestorage::RemoteFieldApiResponse]
      def initialize(file: OMIT, folder: OMIT, drive: OMIT, group: OMIT, user: OMIT, additional_properties: nil)
        @file = file if file != OMIT
        @folder = folder if folder != OMIT
        @drive = drive if drive != OMIT
        @group = group if group != OMIT
        @user = user if user != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "File": file,
          "Folder": folder,
          "Drive": drive,
          "Group": group,
          "User": user
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of RemoteFieldApiResponse
      #
      # @param json_object [String]
      # @return [Merge::Filestorage::RemoteFieldApiResponse]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        file = parsed_json["File"]&.map do |v|
          v = v.to_json
          Merge::Filestorage::RemoteFieldApi.from_json(json_object: v)
        end
        folder = parsed_json["Folder"]&.map do |v|
          v = v.to_json
          Merge::Filestorage::RemoteFieldApi.from_json(json_object: v)
        end
        drive = parsed_json["Drive"]&.map do |v|
          v = v.to_json
          Merge::Filestorage::RemoteFieldApi.from_json(json_object: v)
        end
        group = parsed_json["Group"]&.map do |v|
          v = v.to_json
          Merge::Filestorage::RemoteFieldApi.from_json(json_object: v)
        end
        user = parsed_json["User"]&.map do |v|
          v = v.to_json
          Merge::Filestorage::RemoteFieldApi.from_json(json_object: v)
        end
        new(
          file: file,
          folder: folder,
          drive: drive,
          group: group,
          user: user,
          additional_properties: struct
        )
      end

      # Serialize an instance of RemoteFieldApiResponse to a JSON object
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
        obj.file&.is_a?(Array) != false || raise("Passed value for field obj.file is not the expected type, validation failed.")
        obj.folder&.is_a?(Array) != false || raise("Passed value for field obj.folder is not the expected type, validation failed.")
        obj.drive&.is_a?(Array) != false || raise("Passed value for field obj.drive is not the expected type, validation failed.")
        obj.group&.is_a?(Array) != false || raise("Passed value for field obj.group is not the expected type, validation failed.")
        obj.user&.is_a?(Array) != false || raise("Passed value for field obj.user is not the expected type, validation failed.")
      end
    end
  end
end
