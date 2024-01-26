# frozen_string_literal: true

module Merge
  module Accounting
    # @type [Hash{String => String}]
    EVENT_TYPE_ENUM = {
      created_remote_production_api_key: "CREATED_REMOTE_PRODUCTION_API_KEY",
      deleted_remote_production_api_key: "DELETED_REMOTE_PRODUCTION_API_KEY",
      created_test_api_key: "CREATED_TEST_API_KEY",
      deleted_test_api_key: "DELETED_TEST_API_KEY",
      regenerated_production_api_key: "REGENERATED_PRODUCTION_API_KEY",
      invited_user: "INVITED_USER",
      two_factor_auth_enabled: "TWO_FACTOR_AUTH_ENABLED",
      two_factor_auth_disabled: "TWO_FACTOR_AUTH_DISABLED",
      deleted_linked_account: "DELETED_LINKED_ACCOUNT",
      created_destination: "CREATED_DESTINATION",
      deleted_destination: "DELETED_DESTINATION",
      changed_scopes: "CHANGED_SCOPES",
      changed_personal_information: "CHANGED_PERSONAL_INFORMATION",
      changed_organization_settings: "CHANGED_ORGANIZATION_SETTINGS",
      enabled_integration: "ENABLED_INTEGRATION",
      disabled_integration: "DISABLED_INTEGRATION",
      enabled_category: "ENABLED_CATEGORY",
      disabled_category: "DISABLED_CATEGORY",
      changed_password: "CHANGED_PASSWORD",
      reset_password: "RESET_PASSWORD",
      enabled_redact_unmapped_data_for_organization: "ENABLED_REDACT_UNMAPPED_DATA_FOR_ORGANIZATION",
      enabled_redact_unmapped_data_for_linked_account: "ENABLED_REDACT_UNMAPPED_DATA_FOR_LINKED_ACCOUNT",
      disabled_redact_unmapped_data_for_organization: "DISABLED_REDACT_UNMAPPED_DATA_FOR_ORGANIZATION",
      disabled_redact_unmapped_data_for_linked_account: "DISABLED_REDACT_UNMAPPED_DATA_FOR_LINKED_ACCOUNT",
      created_integration_wide_field_mapping: "CREATED_INTEGRATION_WIDE_FIELD_MAPPING",
      created_linked_account_field_mapping: "CREATED_LINKED_ACCOUNT_FIELD_MAPPING",
      changed_integration_wide_field_mapping: "CHANGED_INTEGRATION_WIDE_FIELD_MAPPING",
      changed_linked_account_field_mapping: "CHANGED_LINKED_ACCOUNT_FIELD_MAPPING",
      deleted_integration_wide_field_mapping: "DELETED_INTEGRATION_WIDE_FIELD_MAPPING",
      deleted_linked_account_field_mapping: "DELETED_LINKED_ACCOUNT_FIELD_MAPPING"
    }.frozen
  end
end
