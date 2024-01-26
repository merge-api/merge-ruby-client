# frozen_string_literal: true

require "json"

module Merge
  module Accounting
    # Designates the type of event that occurred.
    `CREATED_REMOTE_PRODUCTION_API_KEY`
    `DELETED_REMOTE_PRODUCTION_API_KEY`
    `CREATED_TEST_API_KEY`
    `DELETED_TEST_API_KEY`
    `REGENERATED_PRODUCTION_API_KEY`
    `INVITED_USER`
    `TWO_FACTOR_AUTH_ENABLED`
    `TWO_FACTOR_AUTH_DISABLED`
    `DELETED_LINKED_ACCOUNT`
    `CREATED_DESTINATION`
    `DELETED_DESTINATION`
    `CHANGED_SCOPES`
    `CHANGED_PERSONAL_INFORMATION`
    `CHANGED_ORGANIZATION_SETTINGS`
    `ENABLED_INTEGRATION`
    `DISABLED_INTEGRATION`
    `ENABLED_CATEGORY`
    `DISABLED_CATEGORY`
    `CHANGED_PASSWORD`
    `RESET_PASSWORD`
    `ENABLED_REDACT_UNMAPPED_DATA_FOR_ORGANIZATION`
    `ENABLED_REDACT_UNMAPPED_DATA_FOR_LINKED_ACCOUNT`
    `DISABLED_REDACT_UNMAPPED_DATA_FOR_ORGANIZATION`
    `DISABLED_REDACT_UNMAPPED_DATA_FOR_LINKED_ACCOUNT`
    `CREATED_INTEGRATION_WIDE_FIELD_MAPPING`
    `CREATED_LINKED_ACCOUNT_FIELD_MAPPING`
    `CHANGED_INTEGRATION_WIDE_FIELD_MAPPING`
    `CHANGED_LINKED_ACCOUNT_FIELD_MAPPING`
    `DELETED_INTEGRATION_WIDE_FIELD_MAPPING`
    `DELETED_LINKED_ACCOUNT_FIELD_MAPPING`
    class AuditLogEventEventType
      attr_reader :member
      alias kind_of? is_a?
      # @param member [Object]
      # @return [Accounting::AuditLogEventEventType]
      def initialize(member:)
        # @type [Object]
        @member = member
      end

      # Deserialize a JSON object to an instance of AuditLogEventEventType
      #
      # @param json_object [JSON]
      # @return [Accounting::AuditLogEventEventType]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        begin
          struct.is_a?(EVENT_TYPE_ENUM) != false || raise("Passed value for field struct is not the expected type, validation failed.")
          member = EVENT_TYPE_ENUM.key(json_object)
          return new(member: member)
        rescue StandardError
          # noop
        end
        begin
          struct.is_a?(String) != false || raise("Passed value for field struct is not the expected type, validation failed.")
          member = json_object
          return new(member: member)
        rescue StandardError
          # noop
        end
        new(member: struct)
      end

      # For Union Types, to_json functionality is delegated to the wrapped member.
      #
      # @return [JSON]
      def to_json(*_args)
        @member.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        begin
          return obj.is_a?(EVENT_TYPE_ENUM) != false || raise("Passed value for field obj is not the expected type, validation failed.")
        rescue StandardError
          # noop
        end
        begin
          return obj.is_a?(String) != false || raise("Passed value for field obj is not the expected type, validation failed.")
        rescue StandardError
          # noop
        end
        raise("Passed value matched no type within the union, validation failed.")
      end

      # For Union Types, is_a? functionality is delegated to the wrapped member.
      #
      # @param obj [Object]
      # @return [Boolean]
      def is_a?(obj)
        @member.is_a?(obj)
      end
    end
  end
end
