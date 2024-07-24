# frozen_string_literal: true

require_relative "external_target_field_api"
require "ostruct"
require "json"

module Merge
  module Filestorage
    class ExternalTargetFieldApiResponse
      # @return [Array<Merge::Filestorage::ExternalTargetFieldApi>]
      attr_reader :file
      # @return [Array<Merge::Filestorage::ExternalTargetFieldApi>]
      attr_reader :folder
      # @return [Array<Merge::Filestorage::ExternalTargetFieldApi>]
      attr_reader :drive
      # @return [Array<Merge::Filestorage::ExternalTargetFieldApi>]
      attr_reader :group
      # @return [Array<Merge::Filestorage::ExternalTargetFieldApi>]
      attr_reader :user
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param file [Array<Merge::Filestorage::ExternalTargetFieldApi>]
      # @param folder [Array<Merge::Filestorage::ExternalTargetFieldApi>]
      # @param drive [Array<Merge::Filestorage::ExternalTargetFieldApi>]
      # @param group [Array<Merge::Filestorage::ExternalTargetFieldApi>]
      # @param user [Array<Merge::Filestorage::ExternalTargetFieldApi>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Filestorage::ExternalTargetFieldApiResponse]
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

      # Deserialize a JSON object to an instance of ExternalTargetFieldApiResponse
      #
      # @param json_object [String]
      # @return [Merge::Filestorage::ExternalTargetFieldApiResponse]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        file = parsed_json["File"]&.map do |item|
          item = item.to_json
          Merge::Filestorage::ExternalTargetFieldApi.from_json(json_object: item)
        end
        folder = parsed_json["Folder"]&.map do |item|
          item = item.to_json
          Merge::Filestorage::ExternalTargetFieldApi.from_json(json_object: item)
        end
        drive = parsed_json["Drive"]&.map do |item|
          item = item.to_json
          Merge::Filestorage::ExternalTargetFieldApi.from_json(json_object: item)
        end
        group = parsed_json["Group"]&.map do |item|
          item = item.to_json
          Merge::Filestorage::ExternalTargetFieldApi.from_json(json_object: item)
        end
        user = parsed_json["User"]&.map do |item|
          item = item.to_json
          Merge::Filestorage::ExternalTargetFieldApi.from_json(json_object: item)
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

      # Serialize an instance of ExternalTargetFieldApiResponse to a JSON object
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
