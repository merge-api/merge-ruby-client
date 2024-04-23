# frozen_string_literal: true

require "ostruct"
require "json"

module Merge
  module Accounting
    # # The Accounting Attachment Object
    #  ### Description
    #  The `AccountingAttachment` object is used to represent a company's attachments.
    #  ### Usage Example
    #  Fetch from the `LIST AccountingAttachments` endpoint and view a company's
    #  attachments.
    class AccountingAttachmentRequest
      # @return [String] The attachment's name.
      attr_reader :file_name
      # @return [String] The attachment's url.
      attr_reader :file_url
      # @return [String] The company the accounting attachment belongs to.
      attr_reader :company
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
      # @param company [String] The company the accounting attachment belongs to.
      # @param integration_params [Hash{String => Object}]
      # @param linked_account_params [Hash{String => Object}]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Accounting::AccountingAttachmentRequest]
      def initialize(file_name: OMIT, file_url: OMIT, company: OMIT, integration_params: OMIT,
                     linked_account_params: OMIT, additional_properties: nil)
        @file_name = file_name if file_name != OMIT
        @file_url = file_url if file_url != OMIT
        @company = company if company != OMIT
        @integration_params = integration_params if integration_params != OMIT
        @linked_account_params = linked_account_params if linked_account_params != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "file_name": file_name,
          "file_url": file_url,
          "company": company,
          "integration_params": integration_params,
          "linked_account_params": linked_account_params
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of AccountingAttachmentRequest
      #
      # @param json_object [String]
      # @return [Merge::Accounting::AccountingAttachmentRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        file_name = struct["file_name"]
        file_url = struct["file_url"]
        company = struct["company"]
        integration_params = struct["integration_params"]
        linked_account_params = struct["linked_account_params"]
        new(
          file_name: file_name,
          file_url: file_url,
          company: company,
          integration_params: integration_params,
          linked_account_params: linked_account_params,
          additional_properties: struct
        )
      end

      # Serialize an instance of AccountingAttachmentRequest to a JSON object
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
        obj.company&.is_a?(String) != false || raise("Passed value for field obj.company is not the expected type, validation failed.")
        obj.integration_params&.is_a?(Hash) != false || raise("Passed value for field obj.integration_params is not the expected type, validation failed.")
        obj.linked_account_params&.is_a?(Hash) != false || raise("Passed value for field obj.linked_account_params is not the expected type, validation failed.")
      end
    end
  end
end
