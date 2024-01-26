# frozen_string_literal: true
require_relative "attachment_request_attachment_type"
require "json"

module Merge
  module Ats
    # # The Attachment Object 
### Description

The `Attachment` object is used to represent a file attached to a candidate.

### Usage Example

Fetch from the `LIST Attachments` endpoint and view attachments accessible by a company.
    class AttachmentRequest
      attr_reader :file_name, :file_url, :candidate, :attachment_type, :integration_params, :linked_account_params, :additional_properties
      # @param file_name [String] The attachment's name.
      # @param file_url [String] The attachment's url.
      # @param candidate [String] 
      # @param attachment_type [Ats::AttachmentRequestAttachmentType] The attachment's type.  - `RESUME` - RESUME
- `COVER_LETTER` - COVER_LETTER
- `OFFER_LETTER` - OFFER_LETTER
- `OTHER` - OTHER
      # @param integration_params [Hash{String => String}] 
      # @param linked_account_params [Hash{String => String}] 
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Ats::AttachmentRequest]
      def initialize(file_name: nil, file_url: nil, candidate: nil, attachment_type: nil, integration_params: nil, linked_account_params: nil, additional_properties: nil)
        # @type [String] The attachment's name.
        @file_name = file_name
        # @type [String] The attachment's url.
        @file_url = file_url
        # @type [String] 
        @candidate = candidate
        # @type [Ats::AttachmentRequestAttachmentType] The attachment's type. 
- `RESUME` - RESUME
- `COVER_LETTER` - COVER_LETTER
- `OFFER_LETTER` - OFFER_LETTER
- `OTHER` - OTHER
        @attachment_type = attachment_type
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
      # @return [Ats::AttachmentRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        file_name = struct.file_name
        file_url = struct.file_url
        candidate = struct.candidate
        attachment_type = struct.attachment_type.to_h.to_json()
        attachment_type = Ats::AttachmentRequestAttachmentType.from_json(json_object: attachment_type)
        integration_params = struct.integration_params
        linked_account_params = struct.linked_account_params
        new(file_name: file_name, file_url: file_url, candidate: candidate, attachment_type: attachment_type, integration_params: integration_params, linked_account_params: linked_account_params, additional_properties: struct)
      end
      # Serialize an instance of AttachmentRequest to a JSON object
      #
      # @return [JSON]
      def to_json
        { "file_name": @file_name, "file_url": @file_url, "candidate": @candidate, "attachment_type": @attachment_type, "integration_params": @integration_params, "linked_account_params": @linked_account_params }.to_json()
      end
      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object] 
      # @return [Void]
      def self.validate_raw(obj:)
        obj.file_name&.is_a?(String) != false || raise("Passed value for field obj.file_name is not the expected type, validation failed.")
        obj.file_url&.is_a?(String) != false || raise("Passed value for field obj.file_url is not the expected type, validation failed.")
        obj.candidate&.is_a?(String) != false || raise("Passed value for field obj.candidate is not the expected type, validation failed.")
        obj.attachment_type.nil?() || Ats::AttachmentRequestAttachmentType.validate_raw(obj: obj.attachment_type)
        obj.integration_params&.is_a?(Hash) != false || raise("Passed value for field obj.integration_params is not the expected type, validation failed.")
        obj.linked_account_params&.is_a?(Hash) != false || raise("Passed value for field obj.linked_account_params is not the expected type, validation failed.")
      end
    end
  end
end