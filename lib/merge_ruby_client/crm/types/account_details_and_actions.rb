# frozen_string_literal: true

require_relative "category_enum"
require_relative "account_details_and_actions_status_enum"
require_relative "account_details_and_actions_integration"
require "json"

module Merge
  module Crm
    # # The LinkedAccount Object
    #
    # ### Description
    #
    # The `LinkedAccount` object is used to represent an end user's link with a specific integration.
    #
    # ### Usage Example
    #
    # View a list of your organization's `LinkedAccount` objects.
    class AccountDetailsAndActions
      attr_reader :id, :category, :status, :status_detail, :end_user_origin_id, :end_user_organization_name,
                  :end_user_email_address, :webhook_listener_url, :is_duplicate, :integration, :account_type, :additional_properties

      # @param id [String]
      # @param category [CATEGORY_ENUM]
      # @param status [ACCOUNT_DETAILS_AND_ACTIONS_STATUS_ENUM]
      # @param status_detail [String]
      # @param end_user_origin_id [String]
      # @param end_user_organization_name [String]
      # @param end_user_email_address [String]
      # @param webhook_listener_url [String]
      # @param is_duplicate [Boolean] Whether a Production Linked Account's credentials match another existing Production Linked Account. This field is `null` for Test Linked Accounts, incomplete Production Linked Accounts, and ignored duplicate Production Linked Account sets.
      # @param integration [Crm::AccountDetailsAndActionsIntegration]
      # @param account_type [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Crm::AccountDetailsAndActions]
      def initialize(id:, status:, end_user_organization_name:, end_user_email_address:, webhook_listener_url:,
                     account_type:, category: nil, status_detail: nil, end_user_origin_id: nil, is_duplicate: nil, integration: nil, additional_properties: nil)
        # @type [String]
        @id = id
        # @type [CATEGORY_ENUM]
        @category = category
        # @type [ACCOUNT_DETAILS_AND_ACTIONS_STATUS_ENUM]
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
        # @type [Crm::AccountDetailsAndActionsIntegration]
        @integration = integration
        # @type [String]
        @account_type = account_type
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of AccountDetailsAndActions
      #
      # @param json_object [JSON]
      # @return [Crm::AccountDetailsAndActions]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = struct.id
        category = Crm::CATEGORY_ENUM.key(parsed_json["category"]) || parsed_json["category"]
        status = Crm::ACCOUNT_DETAILS_AND_ACTIONS_STATUS_ENUM.key(parsed_json["status"]) || parsed_json["status"]
        status_detail = struct.status_detail
        end_user_origin_id = struct.end_user_origin_id
        end_user_organization_name = struct.end_user_organization_name
        end_user_email_address = struct.end_user_email_address
        webhook_listener_url = struct.webhook_listener_url
        is_duplicate = struct.is_duplicate
        if parsed_json["integration"].nil?
          integration = nil
        else
          integration = parsed_json["integration"].to_json
          integration = Crm::AccountDetailsAndActionsIntegration.from_json(json_object: integration)
        end
        account_type = struct.account_type
        new(id: id, category: category, status: status, status_detail: status_detail,
            end_user_origin_id: end_user_origin_id, end_user_organization_name: end_user_organization_name, end_user_email_address: end_user_email_address, webhook_listener_url: webhook_listener_url, is_duplicate: is_duplicate, integration: integration, account_type: account_type, additional_properties: struct)
      end

      # Serialize an instance of AccountDetailsAndActions to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "id": @id,
          "category": Crm::CATEGORY_ENUM[@category] || @category,
          "status": Crm::ACCOUNT_DETAILS_AND_ACTIONS_STATUS_ENUM[@status] || @status,
          "status_detail": @status_detail,
          "end_user_origin_id": @end_user_origin_id,
          "end_user_organization_name": @end_user_organization_name,
          "end_user_email_address": @end_user_email_address,
          "webhook_listener_url": @webhook_listener_url,
          "is_duplicate": @is_duplicate,
          "integration": @integration,
          "account_type": @account_type
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.category&.is_a?(Crm::CATEGORY_ENUM) != false || raise("Passed value for field obj.category is not the expected type, validation failed.")
        obj.status.is_a?(Crm::ACCOUNT_DETAILS_AND_ACTIONS_STATUS_ENUM) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
        obj.status_detail&.is_a?(String) != false || raise("Passed value for field obj.status_detail is not the expected type, validation failed.")
        obj.end_user_origin_id&.is_a?(String) != false || raise("Passed value for field obj.end_user_origin_id is not the expected type, validation failed.")
        obj.end_user_organization_name.is_a?(String) != false || raise("Passed value for field obj.end_user_organization_name is not the expected type, validation failed.")
        obj.end_user_email_address.is_a?(String) != false || raise("Passed value for field obj.end_user_email_address is not the expected type, validation failed.")
        obj.webhook_listener_url.is_a?(String) != false || raise("Passed value for field obj.webhook_listener_url is not the expected type, validation failed.")
        obj.is_duplicate&.is_a?(Boolean) != false || raise("Passed value for field obj.is_duplicate is not the expected type, validation failed.")
        obj.integration.nil? || Crm::AccountDetailsAndActionsIntegration.validate_raw(obj: obj.integration)
        obj.account_type.is_a?(String) != false || raise("Passed value for field obj.account_type is not the expected type, validation failed.")
      end
    end
  end
end
