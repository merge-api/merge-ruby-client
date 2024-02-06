# frozen_string_literal: true

require_relative "audit_log_event_role"
require_relative "audit_log_event_event_type"
require "date"
require "json"

module Merge
  module Crm
    class AuditLogEvent
      attr_reader :id, :user_name, :user_email, :role, :ip_address, :event_type, :event_description, :created_at,
                  :additional_properties

      # @param id [String]
      # @param user_name [String] The User's full name at the time of this Event occurring.
      # @param user_email [String] The User's email at the time of this Event occurring.
      # @param role [Crm::AuditLogEventRole] Designates the role of the user (or SYSTEM/API if action not taken by a user) at the time of this Event occurring.
      #   - `ADMIN` - ADMIN
      #   - `DEVELOPER` - DEVELOPER
      #   - `MEMBER` - MEMBER
      #   - `API` - API
      #   - `SYSTEM` - SYSTEM
      #   - `MERGE_TEAM` - MERGE_TEAM
      # @param ip_address [String]
      # @param event_type [Crm::AuditLogEventEventType] Designates the type of event that occurred.
      #   - `CREATED_REMOTE_PRODUCTION_API_KEY` - CREATED_REMOTE_PRODUCTION_API_KEY
      #   - `DELETED_REMOTE_PRODUCTION_API_KEY` - DELETED_REMOTE_PRODUCTION_API_KEY
      #   - `CREATED_TEST_API_KEY` - CREATED_TEST_API_KEY
      #   - `DELETED_TEST_API_KEY` - DELETED_TEST_API_KEY
      #   - `REGENERATED_PRODUCTION_API_KEY` - REGENERATED_PRODUCTION_API_KEY
      #   - `INVITED_USER` - INVITED_USER
      #   - `TWO_FACTOR_AUTH_ENABLED` - TWO_FACTOR_AUTH_ENABLED
      #   - `TWO_FACTOR_AUTH_DISABLED` - TWO_FACTOR_AUTH_DISABLED
      #   - `DELETED_LINKED_ACCOUNT` - DELETED_LINKED_ACCOUNT
      #   - `CREATED_DESTINATION` - CREATED_DESTINATION
      #   - `DELETED_DESTINATION` - DELETED_DESTINATION
      #   - `CHANGED_SCOPES` - CHANGED_SCOPES
      #   - `CHANGED_PERSONAL_INFORMATION` - CHANGED_PERSONAL_INFORMATION
      #   - `CHANGED_ORGANIZATION_SETTINGS` - CHANGED_ORGANIZATION_SETTINGS
      #   - `ENABLED_INTEGRATION` - ENABLED_INTEGRATION
      #   - `DISABLED_INTEGRATION` - DISABLED_INTEGRATION
      #   - `ENABLED_CATEGORY` - ENABLED_CATEGORY
      #   - `DISABLED_CATEGORY` - DISABLED_CATEGORY
      #   - `CHANGED_PASSWORD` - CHANGED_PASSWORD
      #   - `RESET_PASSWORD` - RESET_PASSWORD
      #   - `ENABLED_REDACT_UNMAPPED_DATA_FOR_ORGANIZATION` - ENABLED_REDACT_UNMAPPED_DATA_FOR_ORGANIZATION
      #   - `ENABLED_REDACT_UNMAPPED_DATA_FOR_LINKED_ACCOUNT` - ENABLED_REDACT_UNMAPPED_DATA_FOR_LINKED_ACCOUNT
      #   - `DISABLED_REDACT_UNMAPPED_DATA_FOR_ORGANIZATION` - DISABLED_REDACT_UNMAPPED_DATA_FOR_ORGANIZATION
      #   - `DISABLED_REDACT_UNMAPPED_DATA_FOR_LINKED_ACCOUNT` - DISABLED_REDACT_UNMAPPED_DATA_FOR_LINKED_ACCOUNT
      #   - `CREATED_INTEGRATION_WIDE_FIELD_MAPPING` - CREATED_INTEGRATION_WIDE_FIELD_MAPPING
      #   - `CREATED_LINKED_ACCOUNT_FIELD_MAPPING` - CREATED_LINKED_ACCOUNT_FIELD_MAPPING
      #   - `CHANGED_INTEGRATION_WIDE_FIELD_MAPPING` - CHANGED_INTEGRATION_WIDE_FIELD_MAPPING
      #   - `CHANGED_LINKED_ACCOUNT_FIELD_MAPPING` - CHANGED_LINKED_ACCOUNT_FIELD_MAPPING
      #   - `DELETED_INTEGRATION_WIDE_FIELD_MAPPING` - DELETED_INTEGRATION_WIDE_FIELD_MAPPING
      #   - `DELETED_LINKED_ACCOUNT_FIELD_MAPPING` - DELETED_LINKED_ACCOUNT_FIELD_MAPPING
      # @param event_description [String]
      # @param created_at [DateTime]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Crm::AuditLogEvent]
      def initialize(role:, ip_address:, event_type:, event_description:, id: nil, user_name: nil, user_email: nil,
                     created_at: nil, additional_properties: nil)
        # @type [String]
        @id = id
        # @type [String] The User's full name at the time of this Event occurring.
        @user_name = user_name
        # @type [String] The User's email at the time of this Event occurring.
        @user_email = user_email
        # @type [Crm::AuditLogEventRole] Designates the role of the user (or SYSTEM/API if action not taken by a user) at the time of this Event occurring.
        #   - `ADMIN` - ADMIN
        #   - `DEVELOPER` - DEVELOPER
        #   - `MEMBER` - MEMBER
        #   - `API` - API
        #   - `SYSTEM` - SYSTEM
        #   - `MERGE_TEAM` - MERGE_TEAM
        @role = role
        # @type [String]
        @ip_address = ip_address
        # @type [Crm::AuditLogEventEventType] Designates the type of event that occurred.
        #   - `CREATED_REMOTE_PRODUCTION_API_KEY` - CREATED_REMOTE_PRODUCTION_API_KEY
        #   - `DELETED_REMOTE_PRODUCTION_API_KEY` - DELETED_REMOTE_PRODUCTION_API_KEY
        #   - `CREATED_TEST_API_KEY` - CREATED_TEST_API_KEY
        #   - `DELETED_TEST_API_KEY` - DELETED_TEST_API_KEY
        #   - `REGENERATED_PRODUCTION_API_KEY` - REGENERATED_PRODUCTION_API_KEY
        #   - `INVITED_USER` - INVITED_USER
        #   - `TWO_FACTOR_AUTH_ENABLED` - TWO_FACTOR_AUTH_ENABLED
        #   - `TWO_FACTOR_AUTH_DISABLED` - TWO_FACTOR_AUTH_DISABLED
        #   - `DELETED_LINKED_ACCOUNT` - DELETED_LINKED_ACCOUNT
        #   - `CREATED_DESTINATION` - CREATED_DESTINATION
        #   - `DELETED_DESTINATION` - DELETED_DESTINATION
        #   - `CHANGED_SCOPES` - CHANGED_SCOPES
        #   - `CHANGED_PERSONAL_INFORMATION` - CHANGED_PERSONAL_INFORMATION
        #   - `CHANGED_ORGANIZATION_SETTINGS` - CHANGED_ORGANIZATION_SETTINGS
        #   - `ENABLED_INTEGRATION` - ENABLED_INTEGRATION
        #   - `DISABLED_INTEGRATION` - DISABLED_INTEGRATION
        #   - `ENABLED_CATEGORY` - ENABLED_CATEGORY
        #   - `DISABLED_CATEGORY` - DISABLED_CATEGORY
        #   - `CHANGED_PASSWORD` - CHANGED_PASSWORD
        #   - `RESET_PASSWORD` - RESET_PASSWORD
        #   - `ENABLED_REDACT_UNMAPPED_DATA_FOR_ORGANIZATION` - ENABLED_REDACT_UNMAPPED_DATA_FOR_ORGANIZATION
        #   - `ENABLED_REDACT_UNMAPPED_DATA_FOR_LINKED_ACCOUNT` - ENABLED_REDACT_UNMAPPED_DATA_FOR_LINKED_ACCOUNT
        #   - `DISABLED_REDACT_UNMAPPED_DATA_FOR_ORGANIZATION` - DISABLED_REDACT_UNMAPPED_DATA_FOR_ORGANIZATION
        #   - `DISABLED_REDACT_UNMAPPED_DATA_FOR_LINKED_ACCOUNT` - DISABLED_REDACT_UNMAPPED_DATA_FOR_LINKED_ACCOUNT
        #   - `CREATED_INTEGRATION_WIDE_FIELD_MAPPING` - CREATED_INTEGRATION_WIDE_FIELD_MAPPING
        #   - `CREATED_LINKED_ACCOUNT_FIELD_MAPPING` - CREATED_LINKED_ACCOUNT_FIELD_MAPPING
        #   - `CHANGED_INTEGRATION_WIDE_FIELD_MAPPING` - CHANGED_INTEGRATION_WIDE_FIELD_MAPPING
        #   - `CHANGED_LINKED_ACCOUNT_FIELD_MAPPING` - CHANGED_LINKED_ACCOUNT_FIELD_MAPPING
        #   - `DELETED_INTEGRATION_WIDE_FIELD_MAPPING` - DELETED_INTEGRATION_WIDE_FIELD_MAPPING
        #   - `DELETED_LINKED_ACCOUNT_FIELD_MAPPING` - DELETED_LINKED_ACCOUNT_FIELD_MAPPING
        @event_type = event_type
        # @type [String]
        @event_description = event_description
        # @type [DateTime]
        @created_at = created_at
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of AuditLogEvent
      #
      # @param json_object [JSON]
      # @return [Crm::AuditLogEvent]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = struct.id
        user_name = struct.user_name
        user_email = struct.user_email
        if parsed_json["role"].nil?
          role = nil
        else
          role = parsed_json["role"].to_json
          role = Crm::AuditLogEventRole.from_json(json_object: role)
        end
        ip_address = struct.ip_address
        if parsed_json["event_type"].nil?
          event_type = nil
        else
          event_type = parsed_json["event_type"].to_json
          event_type = Crm::AuditLogEventEventType.from_json(json_object: event_type)
        end
        event_description = struct.event_description
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        new(id: id, user_name: user_name, user_email: user_email, role: role, ip_address: ip_address,
            event_type: event_type, event_description: event_description, created_at: created_at, additional_properties: struct)
      end

      # Serialize an instance of AuditLogEvent to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "id": @id,
          "user_name": @user_name,
          "user_email": @user_email,
          "role": @role,
          "ip_address": @ip_address,
          "event_type": @event_type,
          "event_description": @event_description,
          "created_at": @created_at
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.user_name&.is_a?(String) != false || raise("Passed value for field obj.user_name is not the expected type, validation failed.")
        obj.user_email&.is_a?(String) != false || raise("Passed value for field obj.user_email is not the expected type, validation failed.")
        Crm::AuditLogEventRole.validate_raw(obj: obj.role)
        obj.ip_address.is_a?(String) != false || raise("Passed value for field obj.ip_address is not the expected type, validation failed.")
        Crm::AuditLogEventEventType.validate_raw(obj: obj.event_type)
        obj.event_description.is_a?(String) != false || raise("Passed value for field obj.event_description is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
      end
    end
  end
end