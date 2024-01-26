# frozen_string_literal: true
require "json"

module Merge
  module Accounting
    # # The Accounting Attachment Object 
### Description

The `AccountingAttachment` object is used to represent a company's attachments.

### Usage Example

Fetch from the `LIST AccountingAttachments` endpoint and view a company's attachments.
    class AccountingAttachmentRequest
      attr_reader :file_name, :file_url, :company, :integration_params, :linked_account_params, :additional_properties
      # @param file_name [String] The attachment's name.
      # @param file_url [String] The attachment's url.
      # @param company [String] The company the accounting attachment belongs to.
      # @param integration_params [Hash{String => String}] 
      # @param linked_account_params [Hash{String => String}] 
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Accounting::AccountingAttachmentRequest]
      def initialize(file_name: nil, file_url: nil, company: nil, integration_params: nil, linked_account_params: nil, additional_properties: nil)
        # @type [String] The attachment's name.
        @file_name = file_name
        # @type [String] The attachment's url.
        @file_url = file_url
        # @type [String] The company the accounting attachment belongs to.
        @company = company
        # @type [Hash{String => String}] 
        @integration_params = integration_params
        # @type [Hash{String => String}] 
        @linked_account_params = linked_account_params
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end
      # Deserialize a JSON object to an instance of AccountingAttachmentRequest
      #
      # @param json_object [JSON] 
      # @return [Accounting::AccountingAttachmentRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        file_name = struct.file_name
        file_url = struct.file_url
        company = struct.company
        integration_params = struct.integration_params
        linked_account_params = struct.linked_account_params
        new(file_name: file_name, file_url: file_url, company: company, integration_params: integration_params, linked_account_params: linked_account_params, additional_properties: struct)
      end
      # Serialize an instance of AccountingAttachmentRequest to a JSON object
      #
      # @return [JSON]
      def to_json
        { "file_name": @file_name, "file_url": @file_url, "company": @company, "integration_params": @integration_params, "linked_account_params": @linked_account_params }.to_json()
      end
      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
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