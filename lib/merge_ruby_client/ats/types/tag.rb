# frozen_string_literal: true

require "date"
require "json"

module Merge
  module Ats
    # # The Tag Object
    #
    # ### Description
    #
    # The `Tag` object is used to represent a tag for a candidate.
    #
    # ### Usage Example
    #
    # Fetch from the `LIST Tags` endpoint and view the tags used within a company.
    class Tag
      attr_reader :remote_id, :name, :remote_was_deleted, :created_at, :modified_at, :field_mappings, :remote_data,
                  :additional_properties

      # @param remote_id [String] The third-party API ID of the matching object.
      # @param name [String] The tag's name.
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party platform.
      # @param created_at [DateTime]
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param field_mappings [Hash{String => String}]
      # @param remote_data [Array<Hash>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Ats::Tag]
      def initialize(remote_id: nil, name: nil, remote_was_deleted: nil, created_at: nil, modified_at: nil,
                     field_mappings: nil, remote_data: nil, additional_properties: nil)
        # @type [String] The third-party API ID of the matching object.
        @remote_id = remote_id
        # @type [String] The tag's name.
        @name = name
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

      # Deserialize a JSON object to an instance of Tag
      #
      # @param json_object [JSON]
      # @return [Ats::Tag]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        remote_id = struct.remote_id
        name = struct.name
        remote_was_deleted = struct.remote_was_deleted
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        field_mappings = struct.field_mappings
        remote_data = struct.remote_data
        new(remote_id: remote_id, name: name, remote_was_deleted: remote_was_deleted, created_at: created_at,
            modified_at: modified_at, field_mappings: field_mappings, remote_data: remote_data, additional_properties: struct)
      end

      # Serialize an instance of Tag to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "remote_id": @remote_id,
          "name": @name,
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
        obj.remote_id&.is_a?(String) != false || raise("Passed value for field obj.remote_id is not the expected type, validation failed.")
        obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end
