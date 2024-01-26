# frozen_string_literal: true

require "json"

module Merge
  module Hris
    class AccountDetails
      attr_reader :id, :integration, :integration_slug, :category, :end_user_origin_id, :end_user_organization_name,
                  :end_user_email_address, :status, :webhook_listener_url, :is_duplicate, :account_type, :additional_properties

      # @param id [String]
      # @param integration [String]
      # @param integration_slug [String]
      # @param category [Hash{String => String}]
      # @param end_user_origin_id [String]
      # @param end_user_organization_name [String]
      # @param end_user_email_address [String]
      # @param status [String]
      # @param webhook_listener_url [String]
      # @param is_duplicate [Boolean] Whether a Production Linked Account's credentials match another existing Production Linked Account. This field is `null` for Test Linked Accounts, incomplete Production Linked Accounts, and ignored duplicate Production Linked Account sets.
      # @param account_type [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Hris::AccountDetails]
      def initialize(id: nil, integration: nil, integration_slug: nil, category: nil, end_user_origin_id: nil,
                     end_user_organization_name: nil, end_user_email_address: nil, status: nil, webhook_listener_url: nil, is_duplicate: nil, account_type: nil, additional_properties: nil)
        # @type [String]
        @id = id
        # @type [String]
        @integration = integration
        # @type [String]
        @integration_slug = integration_slug
        # @type [Hash{String => String}]
        @category = category
        # @type [String]
        @end_user_origin_id = end_user_origin_id
        # @type [String]
        @end_user_organization_name = end_user_organization_name
        # @type [String]
        @end_user_email_address = end_user_email_address
        # @type [String]
        @status = status
        # @type [String]
        @webhook_listener_url = webhook_listener_url
        # @type [Boolean] Whether a Production Linked Account's credentials match another existing Production Linked Account. This field is `null` for Test Linked Accounts, incomplete Production Linked Accounts, and ignored duplicate Production Linked Account sets.
        @is_duplicate = is_duplicate
        # @type [String]
        @account_type = account_type
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of AccountDetails
      #
      # @param json_object [JSON]
      # @return [Hris::AccountDetails]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        id = struct.id
        integration = struct.integration
        integration_slug = struct.integration_slug
        category = CATEGORY_ENUM.key(struct.category)
        end_user_origin_id = struct.end_user_origin_id
        end_user_organization_name = struct.end_user_organization_name
        end_user_email_address = struct.end_user_email_address
        status = struct.status
        webhook_listener_url = struct.webhook_listener_url
        is_duplicate = struct.is_duplicate
        account_type = struct.account_type
        new(id: id, integration: integration, integration_slug: integration_slug, category: category,
            end_user_origin_id: end_user_origin_id, end_user_organization_name: end_user_organization_name, end_user_email_address: end_user_email_address, status: status, webhook_listener_url: webhook_listener_url, is_duplicate: is_duplicate, account_type: account_type, additional_properties: struct)
      end

      # Serialize an instance of AccountDetails to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "id": @id,
          "integration": @integration,
          "integration_slug": @integration_slug,
          "category": @category,
          "end_user_origin_id": @end_user_origin_id,
          "end_user_organization_name": @end_user_organization_name,
          "end_user_email_address": @end_user_email_address,
          "status": @status,
          "webhook_listener_url": @webhook_listener_url,
          "is_duplicate": @is_duplicate,
          "account_type": @account_type
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.integration&.is_a?(String) != false || raise("Passed value for field obj.integration is not the expected type, validation failed.")
        obj.integration_slug&.is_a?(String) != false || raise("Passed value for field obj.integration_slug is not the expected type, validation failed.")
        obj.category&.is_a?(CATEGORY_ENUM) != false || raise("Passed value for field obj.category is not the expected type, validation failed.")
        obj.end_user_origin_id&.is_a?(String) != false || raise("Passed value for field obj.end_user_origin_id is not the expected type, validation failed.")
        obj.end_user_organization_name&.is_a?(String) != false || raise("Passed value for field obj.end_user_organization_name is not the expected type, validation failed.")
        obj.end_user_email_address&.is_a?(String) != false || raise("Passed value for field obj.end_user_email_address is not the expected type, validation failed.")
        obj.status&.is_a?(String) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
        obj.webhook_listener_url&.is_a?(String) != false || raise("Passed value for field obj.webhook_listener_url is not the expected type, validation failed.")
        obj.is_duplicate&.is_a?(Boolean) != false || raise("Passed value for field obj.is_duplicate is not the expected type, validation failed.")
        obj.account_type&.is_a?(String) != false || raise("Passed value for field obj.account_type is not the expected type, validation failed.")
      end
    end
  end
end
