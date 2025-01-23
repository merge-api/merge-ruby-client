# frozen_string_literal: true

require "date"
require_relative "attachment_ticket"
require_relative "remote_data"
require "ostruct"
require "json"

module Merge
  module Ticketing
    # # The Attachment Object
    #  ### Description
    #  The `Attachment` object is used to represent an attachment for a ticket.
    #  ### Usage Example
    #  TODO
    class Attachment
      # @return [String]
      attr_reader :id
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [DateTime] The datetime that this object was created by Merge.
      attr_reader :created_at
      # @return [DateTime] The datetime that this object was modified by Merge.
      attr_reader :modified_at
      # @return [String] The attachment's name. It is required to include the file extension in the
      #  attachment's name.
      attr_reader :file_name
      # @return [Merge::Ticketing::AttachmentTicket] The ticket associated with the attachment.
      attr_reader :ticket
      # @return [String] The attachment's url. It is required to include the file extension in the file's
      #  URL.
      attr_reader :file_url
      # @return [String] The attachment's file format.
      attr_reader :content_type
      # @return [String] The user who uploaded the attachment.
      attr_reader :uploaded_by
      # @return [DateTime] When the third party's attachment was created.
      attr_reader :remote_created_at
      # @return [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      attr_reader :remote_was_deleted
      # @return [Hash{String => Object}]
      attr_reader :field_mappings
      # @return [Array<Merge::Ticketing::RemoteData>]
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
      # @param file_name [String] The attachment's name. It is required to include the file extension in the
      #  attachment's name.
      # @param ticket [Merge::Ticketing::AttachmentTicket] The ticket associated with the attachment.
      # @param file_url [String] The attachment's url. It is required to include the file extension in the file's
      #  URL.
      # @param content_type [String] The attachment's file format.
      # @param uploaded_by [String] The user who uploaded the attachment.
      # @param remote_created_at [DateTime] When the third party's attachment was created.
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      # @param field_mappings [Hash{String => Object}]
      # @param remote_data [Array<Merge::Ticketing::RemoteData>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Ticketing::Attachment]
      def initialize(id: OMIT, remote_id: OMIT, created_at: OMIT, modified_at: OMIT, file_name: OMIT, ticket: OMIT,
                     file_url: OMIT, content_type: OMIT, uploaded_by: OMIT, remote_created_at: OMIT, remote_was_deleted: OMIT, field_mappings: OMIT, remote_data: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @file_name = file_name if file_name != OMIT
        @ticket = ticket if ticket != OMIT
        @file_url = file_url if file_url != OMIT
        @content_type = content_type if content_type != OMIT
        @uploaded_by = uploaded_by if uploaded_by != OMIT
        @remote_created_at = remote_created_at if remote_created_at != OMIT
        @remote_was_deleted = remote_was_deleted if remote_was_deleted != OMIT
        @field_mappings = field_mappings if field_mappings != OMIT
        @remote_data = remote_data if remote_data != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "remote_id": remote_id,
          "created_at": created_at,
          "modified_at": modified_at,
          "file_name": file_name,
          "ticket": ticket,
          "file_url": file_url,
          "content_type": content_type,
          "uploaded_by": uploaded_by,
          "remote_created_at": remote_created_at,
          "remote_was_deleted": remote_was_deleted,
          "field_mappings": field_mappings,
          "remote_data": remote_data
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of Attachment
      #
      # @param json_object [String]
      # @return [Merge::Ticketing::Attachment]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = parsed_json["id"]
        remote_id = parsed_json["remote_id"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        file_name = parsed_json["file_name"]
        if parsed_json["ticket"].nil?
          ticket = nil
        else
          ticket = parsed_json["ticket"].to_json
          ticket = Merge::Ticketing::AttachmentTicket.from_json(json_object: ticket)
        end
        file_url = parsed_json["file_url"]
        content_type = parsed_json["content_type"]
        uploaded_by = parsed_json["uploaded_by"]
        remote_created_at = unless parsed_json["remote_created_at"].nil?
                              DateTime.parse(parsed_json["remote_created_at"])
                            end
        remote_was_deleted = parsed_json["remote_was_deleted"]
        field_mappings = parsed_json["field_mappings"]
        remote_data = parsed_json["remote_data"]&.map do |item|
          item = item.to_json
          Merge::Ticketing::RemoteData.from_json(json_object: item)
        end
        new(
          id: id,
          remote_id: remote_id,
          created_at: created_at,
          modified_at: modified_at,
          file_name: file_name,
          ticket: ticket,
          file_url: file_url,
          content_type: content_type,
          uploaded_by: uploaded_by,
          remote_created_at: remote_created_at,
          remote_was_deleted: remote_was_deleted,
          field_mappings: field_mappings,
          remote_data: remote_data,
          additional_properties: struct
        )
      end

      # Serialize an instance of Attachment to a JSON object
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
        obj.file_name&.is_a?(String) != false || raise("Passed value for field obj.file_name is not the expected type, validation failed.")
        obj.ticket.nil? || Merge::Ticketing::AttachmentTicket.validate_raw(obj: obj.ticket)
        obj.file_url&.is_a?(String) != false || raise("Passed value for field obj.file_url is not the expected type, validation failed.")
        obj.content_type&.is_a?(String) != false || raise("Passed value for field obj.content_type is not the expected type, validation failed.")
        obj.uploaded_by&.is_a?(String) != false || raise("Passed value for field obj.uploaded_by is not the expected type, validation failed.")
        obj.remote_created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_created_at is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end
