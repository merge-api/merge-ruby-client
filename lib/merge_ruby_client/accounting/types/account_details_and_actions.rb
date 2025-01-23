# frozen_string_literal: true

require_relative "category_enum"
require_relative "account_details_and_actions_status_enum"
require_relative "account_details_and_actions_integration"
require "date"
require "ostruct"
require "json"

module Merge
  module Accounting
    # # The LinkedAccount Object
    #  ### Description
    #  The `LinkedAccount` object is used to represent an end user's link with a
    #  specific integration.
    #  ### Usage Example
    #  View a list of your organization's `LinkedAccount` objects.
    class AccountDetailsAndActions
      # @return [String]
      attr_reader :id
      # @return [Merge::Accounting::CategoryEnum]
      attr_reader :category
      # @return [Merge::Accounting::AccountDetailsAndActionsStatusEnum]
      attr_reader :status
      # @return [String]
      attr_reader :status_detail
      # @return [String]
      attr_reader :end_user_origin_id
      # @return [String]
      attr_reader :end_user_organization_name
      # @return [String]
      attr_reader :end_user_email_address
      # @return [String] The tenant or domain the customer has provided access to.
      attr_reader :subdomain
      # @return [String]
      attr_reader :webhook_listener_url
      # @return [Boolean] Whether a Production Linked Account's credentials match another existing
      #  Production Linked Account. This field is `null` for Test Linked Accounts,
      #  incomplete Production Linked Accounts, and ignored duplicate Production Linked
      #  Account sets.
      attr_reader :is_duplicate
      # @return [Merge::Accounting::AccountDetailsAndActionsIntegration]
      attr_reader :integration
      # @return [String]
      attr_reader :account_type
      # @return [DateTime]
      attr_reader :completed_at
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param id [String]
      # @param category [Merge::Accounting::CategoryEnum]
      # @param status [Merge::Accounting::AccountDetailsAndActionsStatusEnum]
      # @param status_detail [String]
      # @param end_user_origin_id [String]
      # @param end_user_organization_name [String]
      # @param end_user_email_address [String]
      # @param subdomain [String] The tenant or domain the customer has provided access to.
      # @param webhook_listener_url [String]
      # @param is_duplicate [Boolean] Whether a Production Linked Account's credentials match another existing
      #  Production Linked Account. This field is `null` for Test Linked Accounts,
      #  incomplete Production Linked Accounts, and ignored duplicate Production Linked
      #  Account sets.
      # @param integration [Merge::Accounting::AccountDetailsAndActionsIntegration]
      # @param account_type [String]
      # @param completed_at [DateTime]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Accounting::AccountDetailsAndActions]
      def initialize(id:, status:, end_user_organization_name:, end_user_email_address:, webhook_listener_url:,
                     account_type:, completed_at:, category: OMIT, status_detail: OMIT, end_user_origin_id: OMIT, subdomain: OMIT, is_duplicate: OMIT, integration: OMIT, additional_properties: nil)
        @id = id
        @category = category if category != OMIT
        @status = status
        @status_detail = status_detail if status_detail != OMIT
        @end_user_origin_id = end_user_origin_id if end_user_origin_id != OMIT
        @end_user_organization_name = end_user_organization_name
        @end_user_email_address = end_user_email_address
        @subdomain = subdomain if subdomain != OMIT
        @webhook_listener_url = webhook_listener_url
        @is_duplicate = is_duplicate if is_duplicate != OMIT
        @integration = integration if integration != OMIT
        @account_type = account_type
        @completed_at = completed_at
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "category": category,
          "status": status,
          "status_detail": status_detail,
          "end_user_origin_id": end_user_origin_id,
          "end_user_organization_name": end_user_organization_name,
          "end_user_email_address": end_user_email_address,
          "subdomain": subdomain,
          "webhook_listener_url": webhook_listener_url,
          "is_duplicate": is_duplicate,
          "integration": integration,
          "account_type": account_type,
          "completed_at": completed_at
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of AccountDetailsAndActions
      #
      # @param json_object [String]
      # @return [Merge::Accounting::AccountDetailsAndActions]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = parsed_json["id"]
        category = parsed_json["category"]
        status = parsed_json["status"]
        status_detail = parsed_json["status_detail"]
        end_user_origin_id = parsed_json["end_user_origin_id"]
        end_user_organization_name = parsed_json["end_user_organization_name"]
        end_user_email_address = parsed_json["end_user_email_address"]
        subdomain = parsed_json["subdomain"]
        webhook_listener_url = parsed_json["webhook_listener_url"]
        is_duplicate = parsed_json["is_duplicate"]
        if parsed_json["integration"].nil?
          integration = nil
        else
          integration = parsed_json["integration"].to_json
          integration = Merge::Accounting::AccountDetailsAndActionsIntegration.from_json(json_object: integration)
        end
        account_type = parsed_json["account_type"]
        completed_at = (DateTime.parse(parsed_json["completed_at"]) unless parsed_json["completed_at"].nil?)
        new(
          id: id,
          category: category,
          status: status,
          status_detail: status_detail,
          end_user_origin_id: end_user_origin_id,
          end_user_organization_name: end_user_organization_name,
          end_user_email_address: end_user_email_address,
          subdomain: subdomain,
          webhook_listener_url: webhook_listener_url,
          is_duplicate: is_duplicate,
          integration: integration,
          account_type: account_type,
          completed_at: completed_at,
          additional_properties: struct
        )
      end

      # Serialize an instance of AccountDetailsAndActions to a JSON object
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
        obj.id.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.category&.is_a?(Merge::Accounting::CategoryEnum) != false || raise("Passed value for field obj.category is not the expected type, validation failed.")
        obj.status.is_a?(Merge::Accounting::AccountDetailsAndActionsStatusEnum) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
        obj.status_detail&.is_a?(String) != false || raise("Passed value for field obj.status_detail is not the expected type, validation failed.")
        obj.end_user_origin_id&.is_a?(String) != false || raise("Passed value for field obj.end_user_origin_id is not the expected type, validation failed.")
        obj.end_user_organization_name.is_a?(String) != false || raise("Passed value for field obj.end_user_organization_name is not the expected type, validation failed.")
        obj.end_user_email_address.is_a?(String) != false || raise("Passed value for field obj.end_user_email_address is not the expected type, validation failed.")
        obj.subdomain&.is_a?(String) != false || raise("Passed value for field obj.subdomain is not the expected type, validation failed.")
        obj.webhook_listener_url.is_a?(String) != false || raise("Passed value for field obj.webhook_listener_url is not the expected type, validation failed.")
        obj.is_duplicate&.is_a?(Boolean) != false || raise("Passed value for field obj.is_duplicate is not the expected type, validation failed.")
        obj.integration.nil? || Merge::Accounting::AccountDetailsAndActionsIntegration.validate_raw(obj: obj.integration)
        obj.account_type.is_a?(String) != false || raise("Passed value for field obj.account_type is not the expected type, validation failed.")
        obj.completed_at.is_a?(DateTime) != false || raise("Passed value for field obj.completed_at is not the expected type, validation failed.")
      end
    end
  end
end
