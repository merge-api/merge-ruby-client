# frozen_string_literal: true

require_relative "attachment_type_enum"
require "ostruct"
require "json"

module Merge
  module Ats
    # # The Attachment Object
    #  ### Description
    #  The `Attachment` object is used to represent a file attached to a candidate.
    #  ### Usage Example
    #  Fetch from the `LIST Attachments` endpoint and view attachments accessible by a
    #  company.
    class AttachmentRequest
      # @return [String] The attachment's name.
      attr_reader :file_name
      # @return [String] The attachment's url.
      attr_reader :file_url
      # @return [String]
      attr_reader :candidate
      # @return [Merge::Ats::AttachmentTypeEnum] The attachment's type.
      #  - `RESUME` - RESUME
      #  - `COVER_LETTER` - COVER_LETTER
      #  - `OFFER_LETTER` - OFFER_LETTER
      #  - `OTHER` - OTHER
      attr_reader :attachment_type
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

      # @param file_name [String] The attachment's name.
      # @param file_url [String] The attachment's url.
      # @param candidate [String]
      # @param attachment_type [Merge::Ats::AttachmentTypeEnum] The attachment's type.
      #  - `RESUME` - RESUME
      #  - `COVER_LETTER` - COVER_LETTER
      #  - `OFFER_LETTER` - OFFER_LETTER
      #  - `OTHER` - OTHER
      # @param integration_params [Hash{String => Object}]
      # @param linked_account_params [Hash{String => Object}]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Ats::AttachmentRequest]
      def initialize(file_name: OMIT, file_url: OMIT, candidate: OMIT, attachment_type: OMIT, integration_params: OMIT,
                     linked_account_params: OMIT, additional_properties: nil)
        @file_name = file_name if file_name != OMIT
        @file_url = file_url if file_url != OMIT
        @candidate = candidate if candidate != OMIT
        @attachment_type = attachment_type if attachment_type != OMIT
        @integration_params = integration_params if integration_params != OMIT
        @linked_account_params = linked_account_params if linked_account_params != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "file_name": file_name,
          "file_url": file_url,
          "candidate": candidate,
          "attachment_type": attachment_type,
          "integration_params": integration_params,
          "linked_account_params": linked_account_params
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of AttachmentRequest
      #
      # @param json_object [String]
      # @return [Merge::Ats::AttachmentRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        file_name = parsed_json["file_name"]
        file_url = parsed_json["file_url"]
        candidate = parsed_json["candidate"]
        attachment_type = parsed_json["attachment_type"]
        integration_params = parsed_json["integration_params"]
        linked_account_params = parsed_json["linked_account_params"]
        new(
          file_name: file_name,
          file_url: file_url,
          candidate: candidate,
          attachment_type: attachment_type,
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
        obj.file_url&.is_a?(String) != false || raise("Passed value for field obj.file_url is not the expected type, validation failed.")
        obj.candidate&.is_a?(String) != false || raise("Passed value for field obj.candidate is not the expected type, validation failed.")
        obj.attachment_type&.is_a?(Merge::Ats::AttachmentTypeEnum) != false || raise("Passed value for field obj.attachment_type is not the expected type, validation failed.")
        obj.integration_params&.is_a?(Hash) != false || raise("Passed value for field obj.integration_params is not the expected type, validation failed.")
        obj.linked_account_params&.is_a?(Hash) != false || raise("Passed value for field obj.linked_account_params is not the expected type, validation failed.")
      end
    end
  end
end
