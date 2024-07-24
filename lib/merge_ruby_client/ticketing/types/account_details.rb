# frozen_string_literal: true

require_relative "category_enum"
require "ostruct"
require "json"

module Merge
  module Ticketing
    class AccountDetails
      # @return [String]
      attr_reader :id
      # @return [String]
      attr_reader :integration
      # @return [String]
      attr_reader :integration_slug
      # @return [Merge::Ticketing::CategoryEnum]
      attr_reader :category
      # @return [String]
      attr_reader :end_user_origin_id
      # @return [String]
      attr_reader :end_user_organization_name
      # @return [String]
      attr_reader :end_user_email_address
      # @return [String]
      attr_reader :status
      # @return [String]
      attr_reader :webhook_listener_url
      # @return [Boolean] Whether a Production Linked Account's credentials match another existing
      #  Production Linked Account. This field is `null` for Test Linked Accounts,
      #  incomplete Production Linked Accounts, and ignored duplicate Production Linked
      #  Account sets.
      attr_reader :is_duplicate
      # @return [String]
      attr_reader :account_type
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param id [String]
      # @param integration [String]
      # @param integration_slug [String]
      # @param category [Merge::Ticketing::CategoryEnum]
      # @param end_user_origin_id [String]
      # @param end_user_organization_name [String]
      # @param end_user_email_address [String]
      # @param status [String]
      # @param webhook_listener_url [String]
      # @param is_duplicate [Boolean] Whether a Production Linked Account's credentials match another existing
      #  Production Linked Account. This field is `null` for Test Linked Accounts,
      #  incomplete Production Linked Accounts, and ignored duplicate Production Linked
      #  Account sets.
      # @param account_type [String]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Ticketing::AccountDetails]
      def initialize(id: OMIT, integration: OMIT, integration_slug: OMIT, category: OMIT, end_user_origin_id: OMIT,
                     end_user_organization_name: OMIT, end_user_email_address: OMIT, status: OMIT, webhook_listener_url: OMIT, is_duplicate: OMIT, account_type: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @integration = integration if integration != OMIT
        @integration_slug = integration_slug if integration_slug != OMIT
        @category = category if category != OMIT
        @end_user_origin_id = end_user_origin_id if end_user_origin_id != OMIT
        @end_user_organization_name = end_user_organization_name if end_user_organization_name != OMIT
        @end_user_email_address = end_user_email_address if end_user_email_address != OMIT
        @status = status if status != OMIT
        @webhook_listener_url = webhook_listener_url if webhook_listener_url != OMIT
        @is_duplicate = is_duplicate if is_duplicate != OMIT
        @account_type = account_type if account_type != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "integration": integration,
          "integration_slug": integration_slug,
          "category": category,
          "end_user_origin_id": end_user_origin_id,
          "end_user_organization_name": end_user_organization_name,
          "end_user_email_address": end_user_email_address,
          "status": status,
          "webhook_listener_url": webhook_listener_url,
          "is_duplicate": is_duplicate,
          "account_type": account_type
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of AccountDetails
      #
      # @param json_object [String]
      # @return [Merge::Ticketing::AccountDetails]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = parsed_json["id"]
        integration = parsed_json["integration"]
        integration_slug = parsed_json["integration_slug"]
        category = parsed_json["category"]
        end_user_origin_id = parsed_json["end_user_origin_id"]
        end_user_organization_name = parsed_json["end_user_organization_name"]
        end_user_email_address = parsed_json["end_user_email_address"]
        status = parsed_json["status"]
        webhook_listener_url = parsed_json["webhook_listener_url"]
        is_duplicate = parsed_json["is_duplicate"]
        account_type = parsed_json["account_type"]
        new(
          id: id,
          integration: integration,
          integration_slug: integration_slug,
          category: category,
          end_user_origin_id: end_user_origin_id,
          end_user_organization_name: end_user_organization_name,
          end_user_email_address: end_user_email_address,
          status: status,
          webhook_listener_url: webhook_listener_url,
          is_duplicate: is_duplicate,
          account_type: account_type,
          additional_properties: struct
        )
      end

      # Serialize an instance of AccountDetails to a JSON object
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
        obj.integration&.is_a?(String) != false || raise("Passed value for field obj.integration is not the expected type, validation failed.")
        obj.integration_slug&.is_a?(String) != false || raise("Passed value for field obj.integration_slug is not the expected type, validation failed.")
        obj.category&.is_a?(Merge::Ticketing::CategoryEnum) != false || raise("Passed value for field obj.category is not the expected type, validation failed.")
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
