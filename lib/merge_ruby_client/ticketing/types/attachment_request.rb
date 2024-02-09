# frozen_string_literal: true

require_relative "attachment_request_ticket"
require "json"

module Merge
  module Ticketing
    # # The Attachment Object
    #
    # ### Description
    #
    # The `Attachment` object is used to represent an attachment for a ticket.
    #
    # ### Usage Example
    #
    # TODO
    class AttachmentRequest
      attr_reader :file_name, :ticket, :file_url, :content_type, :uploaded_by, :integration_params,
                  :linked_account_params, :additional_properties

      # @param file_name [String] The attachment's name. It is required to include the file extension in the attachment's name.
      # @param ticket [Ticketing::AttachmentRequestTicket] The ticket associated with the attachment.
      # @param file_url [String] The attachment's url. It is required to include the file extension in the file's URL.
      # @param content_type [String] The attachment's file format.
      # @param uploaded_by [String] The user who uploaded the attachment.
      # @param integration_params [Hash{String => String}]
      # @param linked_account_params [Hash{String => String}]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Ticketing::AttachmentRequest]
      def initialize(file_name: nil, ticket: nil, file_url: nil, content_type: nil, uploaded_by: nil,
                     integration_params: nil, linked_account_params: nil, additional_properties: nil)
        # @type [String] The attachment's name. It is required to include the file extension in the attachment's name.
        @file_name = file_name
        # @type [Ticketing::AttachmentRequestTicket] The ticket associated with the attachment.
        @ticket = ticket
        # @type [String] The attachment's url. It is required to include the file extension in the file's URL.
        @file_url = file_url
        # @type [String] The attachment's file format.
        @content_type = content_type
        # @type [String] The user who uploaded the attachment.
        @uploaded_by = uploaded_by
        # @type [Hash{String => String}]
        @integration_params = integration_params
        # @type [Hash{String => String}]
        @linked_account_params = linked_account_params
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of AttachmentRequest
      #
      # @param json_object [JSON]
      # @return [Ticketing::AttachmentRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        file_name = struct.file_name
        if parsed_json["ticket"].nil?
          ticket = nil
        else
          ticket = parsed_json["ticket"].to_json
          ticket = Ticketing::AttachmentRequestTicket.from_json(json_object: ticket)
        end
        file_url = struct.file_url
        content_type = struct.content_type
        uploaded_by = struct.uploaded_by
        integration_params = struct.integration_params
        linked_account_params = struct.linked_account_params
        new(file_name: file_name, ticket: ticket, file_url: file_url, content_type: content_type,
            uploaded_by: uploaded_by, integration_params: integration_params, linked_account_params: linked_account_params, additional_properties: struct)
      end

      # Serialize an instance of AttachmentRequest to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "file_name": @file_name,
          "ticket": @ticket,
          "file_url": @file_url,
          "content_type": @content_type,
          "uploaded_by": @uploaded_by,
          "integration_params": @integration_params,
          "linked_account_params": @linked_account_params
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.file_name&.is_a?(String) != false || raise("Passed value for field obj.file_name is not the expected type, validation failed.")
        obj.ticket.nil? || Ticketing::AttachmentRequestTicket.validate_raw(obj: obj.ticket)
        obj.file_url&.is_a?(String) != false || raise("Passed value for field obj.file_url is not the expected type, validation failed.")
        obj.content_type&.is_a?(String) != false || raise("Passed value for field obj.content_type is not the expected type, validation failed.")
        obj.uploaded_by&.is_a?(String) != false || raise("Passed value for field obj.uploaded_by is not the expected type, validation failed.")
        obj.integration_params&.is_a?(Hash) != false || raise("Passed value for field obj.integration_params is not the expected type, validation failed.")
        obj.linked_account_params&.is_a?(Hash) != false || raise("Passed value for field obj.linked_account_params is not the expected type, validation failed.")
      end
    end
  end
end
