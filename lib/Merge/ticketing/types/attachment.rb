# frozen_string_literal: true
require_relative "attachment_ticket"
require "date"
require "date"
require "date"
require_relative "remote_data"
require "json"

module Merge
  module Ticketing
    # # The Attachment Object 
### Description

The `Attachment` object is used to represent an attachment for a ticket.

### Usage Example

TODO
    class Attachment
      attr_reader :id, :remote_id, :file_name, :ticket, :file_url, :content_type, :uploaded_by, :remote_created_at, :remote_was_deleted, :created_at, :modified_at, :field_mappings, :remote_data, :additional_properties
      # @param id [String] 
      # @param remote_id [String] The third-party API ID of the matching object.
      # @param file_name [String] The attachment's name. It is required to include the file extension in the attachment's name.
      # @param ticket [Ticketing::AttachmentTicket] The ticket associated with the attachment.
      # @param file_url [String] The attachment's url. It is required to include the file extension in the file's URL.
      # @param content_type [String] The attachment's file format.
      # @param uploaded_by [String] The user who uploaded the attachment.
      # @param remote_created_at [DateTime] When the third party's attachment was created.
      # @param remote_was_deleted [Boolean] 
      # @param created_at [DateTime] 
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param field_mappings [Hash{String => String}] 
      # @param remote_data [Array<Ticketing::RemoteData>] 
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Ticketing::Attachment]
      def initialize(id: nil, remote_id: nil, file_name: nil, ticket: nil, file_url: nil, content_type: nil, uploaded_by: nil, remote_created_at: nil, remote_was_deleted: nil, created_at: nil, modified_at: nil, field_mappings: nil, remote_data: nil, additional_properties: nil)
        # @type [String] 
        @id = id
        # @type [String] The third-party API ID of the matching object.
        @remote_id = remote_id
        # @type [String] The attachment's name. It is required to include the file extension in the attachment's name.
        @file_name = file_name
        # @type [Ticketing::AttachmentTicket] The ticket associated with the attachment.
        @ticket = ticket
        # @type [String] The attachment's url. It is required to include the file extension in the file's URL.
        @file_url = file_url
        # @type [String] The attachment's file format.
        @content_type = content_type
        # @type [String] The user who uploaded the attachment.
        @uploaded_by = uploaded_by
        # @type [DateTime] When the third party's attachment was created.
        @remote_created_at = remote_created_at
        # @type [Boolean] 
        @remote_was_deleted = remote_was_deleted
        # @type [DateTime] 
        @created_at = created_at
        # @type [DateTime] This is the datetime that this object was last updated by Merge
        @modified_at = modified_at
        # @type [Hash{String => String}] 
        @field_mappings = field_mappings
        # @type [Array<Ticketing::RemoteData>] 
        @remote_data = remote_data
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end
      # Deserialize a JSON object to an instance of Attachment
      #
      # @param json_object [JSON] 
      # @return [Ticketing::Attachment]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        id = struct.id
        remote_id = struct.remote_id
        file_name = struct.file_name
        ticket = struct.ticket.to_h.to_json()
        ticket = Ticketing::AttachmentTicket.from_json(json_object: ticket)
        file_url = struct.file_url
        content_type = struct.content_type
        uploaded_by = struct.uploaded_by
        remote_created_at = DateTime.parse(struct.remote_created_at)
        remote_was_deleted = struct.remote_was_deleted
        created_at = DateTime.parse(struct.created_at)
        modified_at = DateTime.parse(struct.modified_at)
        field_mappings = struct.field_mappings
        remote_data = struct.remote_data.map() do | v |
  v = v.to_h.to_json()
  Ticketing::RemoteData.from_json(json_object: v)
end
        new(id: id, remote_id: remote_id, file_name: file_name, ticket: ticket, file_url: file_url, content_type: content_type, uploaded_by: uploaded_by, remote_created_at: remote_created_at, remote_was_deleted: remote_was_deleted, created_at: created_at, modified_at: modified_at, field_mappings: field_mappings, remote_data: remote_data, additional_properties: struct)
      end
      # Serialize an instance of Attachment to a JSON object
      #
      # @return [JSON]
      def to_json
        { "id": @id, "remote_id": @remote_id, "file_name": @file_name, "ticket": @ticket, "file_url": @file_url, "content_type": @content_type, "uploaded_by": @uploaded_by, "remote_created_at": @remote_created_at, "remote_was_deleted": @remote_was_deleted, "created_at": @created_at, "modified_at": @modified_at, "field_mappings": @field_mappings, "remote_data": @remote_data }.to_json()
      end
      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object] 
      # @return [Void]
      def self.validate_raw(obj:)
        obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.remote_id&.is_a?(String) != false || raise("Passed value for field obj.remote_id is not the expected type, validation failed.")
        obj.file_name&.is_a?(String) != false || raise("Passed value for field obj.file_name is not the expected type, validation failed.")
        obj.ticket.nil?() || Ticketing::AttachmentTicket.validate_raw(obj: obj.ticket)
        obj.file_url&.is_a?(String) != false || raise("Passed value for field obj.file_url is not the expected type, validation failed.")
        obj.content_type&.is_a?(String) != false || raise("Passed value for field obj.content_type is not the expected type, validation failed.")
        obj.uploaded_by&.is_a?(String) != false || raise("Passed value for field obj.uploaded_by is not the expected type, validation failed.")
        obj.remote_created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_created_at is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end