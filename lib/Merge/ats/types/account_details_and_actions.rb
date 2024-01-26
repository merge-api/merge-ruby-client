# frozen_string_literal: true
require_relative "account_details_and_actions_integration"
require "json"

module Merge
  module Ats
    # # The LinkedAccount Object 
### Description

The `LinkedAccount` object is used to represent an end user's link with a specific integration.

### Usage Example

View a list of your organization's `LinkedAccount` objects.
    class AccountDetailsAndActions
      attr_reader :id, :category, :status, :status_detail, :end_user_origin_id, :end_user_organization_name, :end_user_email_address, :webhook_listener_url, :is_duplicate, :integration, :account_type, :additional_properties
      # @param id [String] 
      # @param category [Hash{String => String}] 
      # @param status [Hash{String => String}] 
      # @param status_detail [String] 
      # @param end_user_origin_id [String] 
      # @param end_user_organization_name [String] 
      # @param end_user_email_address [String] 
      # @param webhook_listener_url [String] 
      # @param is_duplicate [Boolean] Whether a Production Linked Account's credentials match another existing Production Linked Account. This field is `null` for Test Linked Accounts, incomplete Production Linked Accounts, and ignored duplicate Production Linked Account sets.
      # @param integration [Ats::AccountDetailsAndActionsIntegration] 
      # @param account_type [String] 
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Ats::AccountDetailsAndActions]
      def initialize(id:, category: nil, status:, status_detail: nil, end_user_origin_id: nil, end_user_organization_name:, end_user_email_address:, webhook_listener_url:, is_duplicate: nil, integration: nil, account_type:, additional_properties: nil)
        # @type [String] 
        @id = id
        # @type [Hash{String => String}] 
        @category = category
        # @type [Hash{String => String}] 
        @status = status
        # @type [String] 
        @status_detail = status_detail
        # @type [String] 
        @end_user_origin_id = end_user_origin_id
        # @type [String] 
        @end_user_organization_name = end_user_organization_name
        # @type [String] 
        @end_user_email_address = end_user_email_address
        # @type [String] 
        @webhook_listener_url = webhook_listener_url
        # @type [Boolean] Whether a Production Linked Account's credentials match another existing Production Linked Account. This field is `null` for Test Linked Accounts, incomplete Production Linked Accounts, and ignored duplicate Production Linked Account sets.
        @is_duplicate = is_duplicate
        # @type [Ats::AccountDetailsAndActionsIntegration] 
        @integration = integration
        # @type [String] 
        @account_type = account_type
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end
      # Deserialize a JSON object to an instance of AccountDetailsAndActions
      #
      # @param json_object [JSON] 
      # @return [Ats::AccountDetailsAndActions]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        id = struct.id
        category = CATEGORY_ENUM.key(struct.category)
        status = ACCOUNT_DETAILS_AND_ACTIONS_STATUS_ENUM.key(struct.status)
        status_detail = struct.status_detail
        end_user_origin_id = struct.end_user_origin_id
        end_user_organization_name = struct.end_user_organization_name
        end_user_email_address = struct.end_user_email_address
        webhook_listener_url = struct.webhook_listener_url
        is_duplicate = struct.is_duplicate
        integration = struct.integration.to_h.to_json()
        integration = Ats::AccountDetailsAndActionsIntegration.from_json(json_object: integration)
        account_type = struct.account_type
        new(id: id, category: category, status: status, status_detail: status_detail, end_user_origin_id: end_user_origin_id, end_user_organization_name: end_user_organization_name, end_user_email_address: end_user_email_address, webhook_listener_url: webhook_listener_url, is_duplicate: is_duplicate, integration: integration, account_type: account_type, additional_properties: struct)
      end
      # Serialize an instance of AccountDetailsAndActions to a JSON object
      #
      # @return [JSON]
      def to_json
        { "id": @id, "category": @category, "status": @status, "status_detail": @status_detail, "end_user_origin_id": @end_user_origin_id, "end_user_organization_name": @end_user_organization_name, "end_user_email_address": @end_user_email_address, "webhook_listener_url": @webhook_listener_url, "is_duplicate": @is_duplicate, "integration": @integration, "account_type": @account_type }.to_json()
      end
      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object] 
      # @return [Void]
      def self.validate_raw(obj:)
        obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.category&.is_a?(CATEGORY_ENUM) != false || raise("Passed value for field obj.category is not the expected type, validation failed.")
        obj.status.is_a?(ACCOUNT_DETAILS_AND_ACTIONS_STATUS_ENUM) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
        obj.status_detail&.is_a?(String) != false || raise("Passed value for field obj.status_detail is not the expected type, validation failed.")
        obj.end_user_origin_id&.is_a?(String) != false || raise("Passed value for field obj.end_user_origin_id is not the expected type, validation failed.")
        obj.end_user_organization_name.is_a?(String) != false || raise("Passed value for field obj.end_user_organization_name is not the expected type, validation failed.")
        obj.end_user_email_address.is_a?(String) != false || raise("Passed value for field obj.end_user_email_address is not the expected type, validation failed.")
        obj.webhook_listener_url.is_a?(String) != false || raise("Passed value for field obj.webhook_listener_url is not the expected type, validation failed.")
        obj.is_duplicate&.is_a?(Boolean) != false || raise("Passed value for field obj.is_duplicate is not the expected type, validation failed.")
        obj.integration.nil?() || Ats::AccountDetailsAndActionsIntegration.validate_raw(obj: obj.integration)
        obj.account_type.is_a?(String) != false || raise("Passed value for field obj.account_type is not the expected type, validation failed.")
      end
    end
  end
end