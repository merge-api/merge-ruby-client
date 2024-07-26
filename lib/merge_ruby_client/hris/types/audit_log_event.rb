# frozen_string_literal: true

require_relative "role_enum"
require_relative "event_type_enum"
require "date"
require "ostruct"
require "json"

module Merge
  module Hris
    class AuditLogEvent
      # @return [String]
      attr_reader :id
      # @return [String] The User's full name at the time of this Event occurring.
      attr_reader :user_name
      # @return [String] The User's email at the time of this Event occurring.
      attr_reader :user_email
      # @return [Merge::Hris::RoleEnum] Designates the role of the user (or SYSTEM/API if action not taken by a user) at
      #  the time of this Event occurring.
      #  - `ADMIN` - ADMIN
      #  - `DEVELOPER` - DEVELOPER
      #  - `MEMBER` - MEMBER
      #  - `API` - API
      #  - `SYSTEM` - SYSTEM
      #  - `MERGE_TEAM` - MERGE_TEAM
      attr_reader :role
      # @return [String]
      attr_reader :ip_address
      # @return [Merge::Hris::EventTypeEnum] Designates the type of event that occurred.
      #  - `CREATED_REMOTE_PRODUCTION_API_KEY` - CREATED_REMOTE_PRODUCTION_API_KEY
      #  - `DELETED_REMOTE_PRODUCTION_API_KEY` - DELETED_REMOTE_PRODUCTION_API_KEY
      #  - `CREATED_TEST_API_KEY` - CREATED_TEST_API_KEY
      #  - `DELETED_TEST_API_KEY` - DELETED_TEST_API_KEY
      #  - `REGENERATED_PRODUCTION_API_KEY` - REGENERATED_PRODUCTION_API_KEY
      #  - `INVITED_USER` - INVITED_USER
      #  - `TWO_FACTOR_AUTH_ENABLED` - TWO_FACTOR_AUTH_ENABLED
      #  - `TWO_FACTOR_AUTH_DISABLED` - TWO_FACTOR_AUTH_DISABLED
      #  - `DELETED_LINKED_ACCOUNT` - DELETED_LINKED_ACCOUNT
      #  - `CREATED_DESTINATION` - CREATED_DESTINATION
      #  - `DELETED_DESTINATION` - DELETED_DESTINATION
      #  - `CHANGED_DESTINATION` - CHANGED_DESTINATION
      #  - `CHANGED_SCOPES` - CHANGED_SCOPES
      #  - `CHANGED_PERSONAL_INFORMATION` - CHANGED_PERSONAL_INFORMATION
      #  - `CHANGED_ORGANIZATION_SETTINGS` - CHANGED_ORGANIZATION_SETTINGS
      #  - `ENABLED_INTEGRATION` - ENABLED_INTEGRATION
      #  - `DISABLED_INTEGRATION` - DISABLED_INTEGRATION
      #  - `ENABLED_CATEGORY` - ENABLED_CATEGORY
      #  - `DISABLED_CATEGORY` - DISABLED_CATEGORY
      #  - `CHANGED_PASSWORD` - CHANGED_PASSWORD
      #  - `RESET_PASSWORD` - RESET_PASSWORD
      #  - `ENABLED_REDACT_UNMAPPED_DATA_FOR_ORGANIZATION` -
      #  ENABLED_REDACT_UNMAPPED_DATA_FOR_ORGANIZATION
      #  - `ENABLED_REDACT_UNMAPPED_DATA_FOR_LINKED_ACCOUNT` -
      #  ENABLED_REDACT_UNMAPPED_DATA_FOR_LINKED_ACCOUNT
      #  - `DISABLED_REDACT_UNMAPPED_DATA_FOR_ORGANIZATION` -
      #  DISABLED_REDACT_UNMAPPED_DATA_FOR_ORGANIZATION
      #  - `DISABLED_REDACT_UNMAPPED_DATA_FOR_LINKED_ACCOUNT` -
      #  DISABLED_REDACT_UNMAPPED_DATA_FOR_LINKED_ACCOUNT
      #  - `CREATED_INTEGRATION_WIDE_FIELD_MAPPING` -
      #  CREATED_INTEGRATION_WIDE_FIELD_MAPPING
      #  - `CREATED_LINKED_ACCOUNT_FIELD_MAPPING` - CREATED_LINKED_ACCOUNT_FIELD_MAPPING
      #  - `CHANGED_INTEGRATION_WIDE_FIELD_MAPPING` -
      #  CHANGED_INTEGRATION_WIDE_FIELD_MAPPING
      #  - `CHANGED_LINKED_ACCOUNT_FIELD_MAPPING` - CHANGED_LINKED_ACCOUNT_FIELD_MAPPING
      #  - `DELETED_INTEGRATION_WIDE_FIELD_MAPPING` -
      #  DELETED_INTEGRATION_WIDE_FIELD_MAPPING
      #  - `DELETED_LINKED_ACCOUNT_FIELD_MAPPING` - DELETED_LINKED_ACCOUNT_FIELD_MAPPING
      #  - `FORCED_LINKED_ACCOUNT_RESYNC` - FORCED_LINKED_ACCOUNT_RESYNC
      #  - `MUTED_ISSUE` - MUTED_ISSUE
      #  - `GENERATED_MAGIC_LINK` - GENERATED_MAGIC_LINK
      #  - `ENABLED_MERGE_WEBHOOK` - ENABLED_MERGE_WEBHOOK
      #  - `DISABLED_MERGE_WEBHOOK` - DISABLED_MERGE_WEBHOOK
      #  - `MERGE_WEBHOOK_TARGET_CHANGED` - MERGE_WEBHOOK_TARGET_CHANGED
      #  - `END_USER_CREDENTIALS_ACCESSED` - END_USER_CREDENTIALS_ACCESSED
      attr_reader :event_type
      # @return [String]
      attr_reader :event_description
      # @return [DateTime]
      attr_reader :created_at
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param id [String]
      # @param user_name [String] The User's full name at the time of this Event occurring.
      # @param user_email [String] The User's email at the time of this Event occurring.
      # @param role [Merge::Hris::RoleEnum] Designates the role of the user (or SYSTEM/API if action not taken by a user) at
      #  the time of this Event occurring.
      #  - `ADMIN` - ADMIN
      #  - `DEVELOPER` - DEVELOPER
      #  - `MEMBER` - MEMBER
      #  - `API` - API
      #  - `SYSTEM` - SYSTEM
      #  - `MERGE_TEAM` - MERGE_TEAM
      # @param ip_address [String]
      # @param event_type [Merge::Hris::EventTypeEnum] Designates the type of event that occurred.
      #  - `CREATED_REMOTE_PRODUCTION_API_KEY` - CREATED_REMOTE_PRODUCTION_API_KEY
      #  - `DELETED_REMOTE_PRODUCTION_API_KEY` - DELETED_REMOTE_PRODUCTION_API_KEY
      #  - `CREATED_TEST_API_KEY` - CREATED_TEST_API_KEY
      #  - `DELETED_TEST_API_KEY` - DELETED_TEST_API_KEY
      #  - `REGENERATED_PRODUCTION_API_KEY` - REGENERATED_PRODUCTION_API_KEY
      #  - `INVITED_USER` - INVITED_USER
      #  - `TWO_FACTOR_AUTH_ENABLED` - TWO_FACTOR_AUTH_ENABLED
      #  - `TWO_FACTOR_AUTH_DISABLED` - TWO_FACTOR_AUTH_DISABLED
      #  - `DELETED_LINKED_ACCOUNT` - DELETED_LINKED_ACCOUNT
      #  - `CREATED_DESTINATION` - CREATED_DESTINATION
      #  - `DELETED_DESTINATION` - DELETED_DESTINATION
      #  - `CHANGED_DESTINATION` - CHANGED_DESTINATION
      #  - `CHANGED_SCOPES` - CHANGED_SCOPES
      #  - `CHANGED_PERSONAL_INFORMATION` - CHANGED_PERSONAL_INFORMATION
      #  - `CHANGED_ORGANIZATION_SETTINGS` - CHANGED_ORGANIZATION_SETTINGS
      #  - `ENABLED_INTEGRATION` - ENABLED_INTEGRATION
      #  - `DISABLED_INTEGRATION` - DISABLED_INTEGRATION
      #  - `ENABLED_CATEGORY` - ENABLED_CATEGORY
      #  - `DISABLED_CATEGORY` - DISABLED_CATEGORY
      #  - `CHANGED_PASSWORD` - CHANGED_PASSWORD
      #  - `RESET_PASSWORD` - RESET_PASSWORD
      #  - `ENABLED_REDACT_UNMAPPED_DATA_FOR_ORGANIZATION` -
      #  ENABLED_REDACT_UNMAPPED_DATA_FOR_ORGANIZATION
      #  - `ENABLED_REDACT_UNMAPPED_DATA_FOR_LINKED_ACCOUNT` -
      #  ENABLED_REDACT_UNMAPPED_DATA_FOR_LINKED_ACCOUNT
      #  - `DISABLED_REDACT_UNMAPPED_DATA_FOR_ORGANIZATION` -
      #  DISABLED_REDACT_UNMAPPED_DATA_FOR_ORGANIZATION
      #  - `DISABLED_REDACT_UNMAPPED_DATA_FOR_LINKED_ACCOUNT` -
      #  DISABLED_REDACT_UNMAPPED_DATA_FOR_LINKED_ACCOUNT
      #  - `CREATED_INTEGRATION_WIDE_FIELD_MAPPING` -
      #  CREATED_INTEGRATION_WIDE_FIELD_MAPPING
      #  - `CREATED_LINKED_ACCOUNT_FIELD_MAPPING` - CREATED_LINKED_ACCOUNT_FIELD_MAPPING
      #  - `CHANGED_INTEGRATION_WIDE_FIELD_MAPPING` -
      #  CHANGED_INTEGRATION_WIDE_FIELD_MAPPING
      #  - `CHANGED_LINKED_ACCOUNT_FIELD_MAPPING` - CHANGED_LINKED_ACCOUNT_FIELD_MAPPING
      #  - `DELETED_INTEGRATION_WIDE_FIELD_MAPPING` -
      #  DELETED_INTEGRATION_WIDE_FIELD_MAPPING
      #  - `DELETED_LINKED_ACCOUNT_FIELD_MAPPING` - DELETED_LINKED_ACCOUNT_FIELD_MAPPING
      #  - `FORCED_LINKED_ACCOUNT_RESYNC` - FORCED_LINKED_ACCOUNT_RESYNC
      #  - `MUTED_ISSUE` - MUTED_ISSUE
      #  - `GENERATED_MAGIC_LINK` - GENERATED_MAGIC_LINK
      #  - `ENABLED_MERGE_WEBHOOK` - ENABLED_MERGE_WEBHOOK
      #  - `DISABLED_MERGE_WEBHOOK` - DISABLED_MERGE_WEBHOOK
      #  - `MERGE_WEBHOOK_TARGET_CHANGED` - MERGE_WEBHOOK_TARGET_CHANGED
      #  - `END_USER_CREDENTIALS_ACCESSED` - END_USER_CREDENTIALS_ACCESSED
      # @param event_description [String]
      # @param created_at [DateTime]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Hris::AuditLogEvent]
      def initialize(role:, ip_address:, event_type:, event_description:, id: OMIT, user_name: OMIT, user_email: OMIT,
                     created_at: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @user_name = user_name if user_name != OMIT
        @user_email = user_email if user_email != OMIT
        @role = role
        @ip_address = ip_address
        @event_type = event_type
        @event_description = event_description
        @created_at = created_at if created_at != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "user_name": user_name,
          "user_email": user_email,
          "role": role,
          "ip_address": ip_address,
          "event_type": event_type,
          "event_description": event_description,
          "created_at": created_at
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of AuditLogEvent
      #
      # @param json_object [String]
      # @return [Merge::Hris::AuditLogEvent]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = parsed_json["id"]
        user_name = parsed_json["user_name"]
        user_email = parsed_json["user_email"]
        role = parsed_json["role"]
        ip_address = parsed_json["ip_address"]
        event_type = parsed_json["event_type"]
        event_description = parsed_json["event_description"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        new(
          id: id,
          user_name: user_name,
          user_email: user_email,
          role: role,
          ip_address: ip_address,
          event_type: event_type,
          event_description: event_description,
          created_at: created_at,
          additional_properties: struct
        )
      end

      # Serialize an instance of AuditLogEvent to a JSON object
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
        obj.user_name&.is_a?(String) != false || raise("Passed value for field obj.user_name is not the expected type, validation failed.")
        obj.user_email&.is_a?(String) != false || raise("Passed value for field obj.user_email is not the expected type, validation failed.")
        obj.role.is_a?(Merge::Hris::RoleEnum) != false || raise("Passed value for field obj.role is not the expected type, validation failed.")
        obj.ip_address.is_a?(String) != false || raise("Passed value for field obj.ip_address is not the expected type, validation failed.")
        obj.event_type.is_a?(Merge::Hris::EventTypeEnum) != false || raise("Passed value for field obj.event_type is not the expected type, validation failed.")
        obj.event_description.is_a?(String) != false || raise("Passed value for field obj.event_description is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      end
    end
  end
end
