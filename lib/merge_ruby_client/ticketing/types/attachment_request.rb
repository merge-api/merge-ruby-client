# frozen_string_literal: true

require_relative "attachment_request_ticket"
require "ostruct"
require "json"

module Merge
  module Ticketing
    # # The Attachment Object
    #  ### Description
    #  The `Attachment` object is used to represent an attachment for a ticket.
    #  ### Usage Example
    #  TODO
    class AttachmentRequest
      # @return [String] The attachment's name. It is required to include the file extension in the
      #  attachment's name.
      attr_reader :file_name
      # @return [Merge::Ticketing::AttachmentRequestTicket] The ticket associated with the attachment.
      attr_reader :ticket
      # @return [String] The attachment's url. It is required to include the file extension in the file's
      #  URL.
      attr_reader :file_url
      # @return [String] The attachment's file format.
      attr_reader :content_type
      # @return [String] The user who uploaded the attachment.
      attr_reader :uploaded_by
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

      # @param file_name [String] The attachment's name. It is required to include the file extension in the
      #  attachment's name.
      # @param ticket [Merge::Ticketing::AttachmentRequestTicket] The ticket associated with the attachment.
      # @param file_url [String] The attachment's url. It is required to include the file extension in the file's
      #  URL.
      # @param content_type [String] The attachment's file format.
      # @param uploaded_by [String] The user who uploaded the attachment.
      # @param integration_params [Hash{String => Object}]
      # @param linked_account_params [Hash{String => Object}]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Ticketing::AttachmentRequest]
      def initialize(file_name: OMIT, ticket: OMIT, file_url: OMIT, content_type: OMIT, uploaded_by: OMIT,
                     integration_params: OMIT, linked_account_params: OMIT, additional_properties: nil)
        @file_name = file_name if file_name != OMIT
        @ticket = ticket if ticket != OMIT
        @file_url = file_url if file_url != OMIT
        @content_type = content_type if content_type != OMIT
        @uploaded_by = uploaded_by if uploaded_by != OMIT
        @integration_params = integration_params if integration_params != OMIT
        @linked_account_params = linked_account_params if linked_account_params != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "file_name": file_name,
          "ticket": ticket,
          "file_url": file_url,
          "content_type": content_type,
          "uploaded_by": uploaded_by,
          "integration_params": integration_params,
          "linked_account_params": linked_account_params
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of AttachmentRequest
      #
      # @param json_object [String]
      # @return [Merge::Ticketing::AttachmentRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        file_name = parsed_json["file_name"]
        if parsed_json["ticket"].nil?
          ticket = nil
        else
          ticket = parsed_json["ticket"].to_json
          ticket = Merge::Ticketing::AttachmentRequestTicket.from_json(json_object: ticket)
        end
        file_url = parsed_json["file_url"]
        content_type = parsed_json["content_type"]
        uploaded_by = parsed_json["uploaded_by"]
        integration_params = parsed_json["integration_params"]
        linked_account_params = parsed_json["linked_account_params"]
        new(
          file_name: file_name,
          ticket: ticket,
          file_url: file_url,
          content_type: content_type,
          uploaded_by: uploaded_by,
          integration_params: integration_params,
          linked_account_params: linked_account_params,
          additional_properties: struct
        )
      end

      # Serialize an instance of AttachmentRequest to a JSON object
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
        obj.file_name&.is_a?(String) != false || raise("Passed value for field obj.file_name is not the expected type, validation failed.")
        obj.ticket.nil? || Merge::Ticketing::AttachmentRequestTicket.validate_raw(obj: obj.ticket)
        obj.file_url&.is_a?(String) != false || raise("Passed value for field obj.file_url is not the expected type, validation failed.")
        obj.content_type&.is_a?(String) != false || raise("Passed value for field obj.content_type is not the expected type, validation failed.")
        obj.uploaded_by&.is_a?(String) != false || raise("Passed value for field obj.uploaded_by is not the expected type, validation failed.")
        obj.integration_params&.is_a?(Hash) != false || raise("Passed value for field obj.integration_params is not the expected type, validation failed.")
        obj.linked_account_params&.is_a?(Hash) != false || raise("Passed value for field obj.linked_account_params is not the expected type, validation failed.")
      end
    end
  end
end
