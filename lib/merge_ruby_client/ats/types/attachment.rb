# frozen_string_literal: true

require_relative "attachment_type_enum"
require "date"
require_relative "remote_data"
require "json"

module Merge
  module Ats
    # # The Attachment Object
    #
    # ### Description
    #
    # The `Attachment` object is used to represent a file attached to a candidate.
    #
    # ### Usage Example
    #
    # Fetch from the `LIST Attachments` endpoint and view attachments accessible by a company.
    class Attachment
      attr_reader :id, :remote_id, :file_name, :file_url, :candidate, :attachment_type, :remote_was_deleted,
                  :created_at, :modified_at, :field_mappings, :remote_data, :additional_properties

      # @param id [String]
      # @param remote_id [String] The third-party API ID of the matching object.
      # @param file_name [String] The attachment's name.
      # @param file_url [String] The attachment's url.
      # @param candidate [String]
      # @param attachment_type [ATTACHMENT_TYPE_ENUM] The attachment's type.
      #   - `RESUME` - RESUME
      #   - `COVER_LETTER` - COVER_LETTER
      #   - `OFFER_LETTER` - OFFER_LETTER
      #   - `OTHER` - OTHER
      # @param remote_was_deleted [Boolean]
      # @param created_at [DateTime]
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param field_mappings [Hash{String => String}]
      # @param remote_data [Array<Ats::RemoteData>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Ats::Attachment]
      def initialize(id: nil, remote_id: nil, file_name: nil, file_url: nil, candidate: nil, attachment_type: nil,
                     remote_was_deleted: nil, created_at: nil, modified_at: nil, field_mappings: nil, remote_data: nil, additional_properties: nil)
        # @type [String]
        @id = id
        # @type [String] The third-party API ID of the matching object.
        @remote_id = remote_id
        # @type [String] The attachment's name.
        @file_name = file_name
        # @type [String] The attachment's url.
        @file_url = file_url
        # @type [String]
        @candidate = candidate
        # @type [ATTACHMENT_TYPE_ENUM] The attachment's type.
        #   - `RESUME` - RESUME
        #   - `COVER_LETTER` - COVER_LETTER
        #   - `OFFER_LETTER` - OFFER_LETTER
        #   - `OTHER` - OTHER
        @attachment_type = attachment_type
        # @type [Boolean]
        @remote_was_deleted = remote_was_deleted
        # @type [DateTime]
        @created_at = created_at
        # @type [DateTime] This is the datetime that this object was last updated by Merge
        @modified_at = modified_at
        # @type [Hash{String => String}]
        @field_mappings = field_mappings
        # @type [Array<Ats::RemoteData>]
        @remote_data = remote_data
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of Attachment
      #
      # @param json_object [JSON]
      # @return [Ats::Attachment]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = struct.id
        remote_id = struct.remote_id
        file_name = struct.file_name
        file_url = struct.file_url
        candidate = struct.candidate
        attachment_type = Ats::ATTACHMENT_TYPE_ENUM.key(parsed_json["attachment_type"]) || parsed_json["attachment_type"]
        remote_was_deleted = struct.remote_was_deleted
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        field_mappings = struct.field_mappings
        remote_data = parsed_json["remote_data"]&.map do |v|
          v = v.to_json
          Ats::RemoteData.from_json(json_object: v)
        end
        new(id: id, remote_id: remote_id, file_name: file_name, file_url: file_url, candidate: candidate,
            attachment_type: attachment_type, remote_was_deleted: remote_was_deleted, created_at: created_at, modified_at: modified_at, field_mappings: field_mappings, remote_data: remote_data, additional_properties: struct)
      end

      # Serialize an instance of Attachment to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "id": @id,
          "remote_id": @remote_id,
          "file_name": @file_name,
          "file_url": @file_url,
          "candidate": @candidate,
          "attachment_type": Ats::ATTACHMENT_TYPE_ENUM[@attachment_type] || @attachment_type,
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
        obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.remote_id&.is_a?(String) != false || raise("Passed value for field obj.remote_id is not the expected type, validation failed.")
        obj.file_name&.is_a?(String) != false || raise("Passed value for field obj.file_name is not the expected type, validation failed.")
        obj.file_url&.is_a?(String) != false || raise("Passed value for field obj.file_url is not the expected type, validation failed.")
        obj.candidate&.is_a?(String) != false || raise("Passed value for field obj.candidate is not the expected type, validation failed.")
        obj.attachment_type&.is_a?(Ats::ATTACHMENT_TYPE_ENUM) != false || raise("Passed value for field obj.attachment_type is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end
