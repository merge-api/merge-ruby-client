# frozen_string_literal: true

require "date"
require_relative "underlying_transaction_type_enum"
require_relative "general_ledger_transaction_accounting_period"
require_relative "general_ledger_transaction_company"
require_relative "general_ledger_transaction_tracking_categories_item"
require_relative "general_ledger_transaction_general_ledger_transaction_lines_item"
require_relative "remote_data"
require "ostruct"
require "json"

module Merge
  module Accounting
    # # The GeneralLedgerTransaction Object
    #  ### Description
    #  A General Ledger Entry is a record of a financial transaction that is posted to
    #  the general ledger, the central repository of a company’s financial data.
    #  The `GeneralLedgerTransaction` object is a singular endpoint to pull all
    #  transactions posted to a company’s general ledger. The transaction that
    #  generated the `GeneralLedgerTransaction` can be found by referencing the
    #  `underlying_transaction_type` and `underlying_transaction_remote_id` fields.
    #  The lines of a `GeneralLedgerTransaction` object will always have equal amounts
    #  of debits and credits.
    #  ### Usage Example
    #  Fetch from the `GET GeneralLedgerTransaction` endpoint and view a general ledger
    #  transaction.
    class GeneralLedgerTransaction
      # @return [String]
      attr_reader :id
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [DateTime] The datetime that this object was created by Merge.
      attr_reader :created_at
      # @return [DateTime] The datetime that this object was modified by Merge.
      attr_reader :modified_at
      # @return [String] The third party remote ID of the underlying transaction.
      attr_reader :underlying_transaction_remote_id
      # @return [Merge::Accounting::UnderlyingTransactionTypeEnum] The type of the underlying transaction.
      #  - `INVOICE` - INVOICE
      #  - `EXPENSE` - EXPENSE
      #  - `TRANSACTION` - TRANSACTION
      #  - `JOURNAL_ENTRY` - JOURNAL_ENTRY
      #  - `PAYMENT` - PAYMENT
      #  - `VENDOR_CREDIT` - VENDOR_CREDIT
      #  - `CREDIT_NOTE` - CREDIT_NOTE
      attr_reader :underlying_transaction_type
      # @return [Merge::Accounting::GeneralLedgerTransactionAccountingPeriod] The accounting period that the GeneralLedgerTransaction was generated in.
      attr_reader :accounting_period
      # @return [Merge::Accounting::GeneralLedgerTransactionCompany] The company the GeneralLedgerTransaction belongs to.
      attr_reader :company
      # @return [DateTime] When the third party's GeneralLedgerTransaction entry was updated.
      attr_reader :remote_updated_at
      # @return [DateTime] When the third party's GeneralLedgerTransaction entry was created.
      attr_reader :remote_created_at
      # @return [Array<Merge::Accounting::GeneralLedgerTransactionTrackingCategoriesItem>]
      attr_reader :tracking_categories
      # @return [DateTime] The date that the transaction was posted to the general ledger.
      attr_reader :posting_date
      # @return [Array<Merge::Accounting::GeneralLedgerTransactionGeneralLedgerTransactionLinesItem>] A list of “General Ledger Transaction Applied to Lines” objects.
      attr_reader :general_ledger_transaction_lines
      # @return [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      attr_reader :remote_was_deleted
      # @return [Hash{String => Object}]
      attr_reader :field_mappings
      # @return [Array<Merge::Accounting::RemoteData>]
      attr_reader :remote_data
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param id [String]
      # @param remote_id [String] The third-party API ID of the matching object.
      # @param created_at [DateTime] The datetime that this object was created by Merge.
      # @param modified_at [DateTime] The datetime that this object was modified by Merge.
      # @param underlying_transaction_remote_id [String] The third party remote ID of the underlying transaction.
      # @param underlying_transaction_type [Merge::Accounting::UnderlyingTransactionTypeEnum] The type of the underlying transaction.
      #  - `INVOICE` - INVOICE
      #  - `EXPENSE` - EXPENSE
      #  - `TRANSACTION` - TRANSACTION
      #  - `JOURNAL_ENTRY` - JOURNAL_ENTRY
      #  - `PAYMENT` - PAYMENT
      #  - `VENDOR_CREDIT` - VENDOR_CREDIT
      #  - `CREDIT_NOTE` - CREDIT_NOTE
      # @param accounting_period [Merge::Accounting::GeneralLedgerTransactionAccountingPeriod] The accounting period that the GeneralLedgerTransaction was generated in.
      # @param company [Merge::Accounting::GeneralLedgerTransactionCompany] The company the GeneralLedgerTransaction belongs to.
      # @param remote_updated_at [DateTime] When the third party's GeneralLedgerTransaction entry was updated.
      # @param remote_created_at [DateTime] When the third party's GeneralLedgerTransaction entry was created.
      # @param tracking_categories [Array<Merge::Accounting::GeneralLedgerTransactionTrackingCategoriesItem>]
      # @param posting_date [DateTime] The date that the transaction was posted to the general ledger.
      # @param general_ledger_transaction_lines [Array<Merge::Accounting::GeneralLedgerTransactionGeneralLedgerTransactionLinesItem>] A list of “General Ledger Transaction Applied to Lines” objects.
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      # @param field_mappings [Hash{String => Object}]
      # @param remote_data [Array<Merge::Accounting::RemoteData>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Accounting::GeneralLedgerTransaction]
      def initialize(id: OMIT, remote_id: OMIT, created_at: OMIT, modified_at: OMIT,
                     underlying_transaction_remote_id: OMIT, underlying_transaction_type: OMIT, accounting_period: OMIT, company: OMIT, remote_updated_at: OMIT, remote_created_at: OMIT, tracking_categories: OMIT, posting_date: OMIT, general_ledger_transaction_lines: OMIT, remote_was_deleted: OMIT, field_mappings: OMIT, remote_data: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @underlying_transaction_remote_id = underlying_transaction_remote_id if underlying_transaction_remote_id != OMIT
        @underlying_transaction_type = underlying_transaction_type if underlying_transaction_type != OMIT
        @accounting_period = accounting_period if accounting_period != OMIT
        @company = company if company != OMIT
        @remote_updated_at = remote_updated_at if remote_updated_at != OMIT
        @remote_created_at = remote_created_at if remote_created_at != OMIT
        @tracking_categories = tracking_categories if tracking_categories != OMIT
        @posting_date = posting_date if posting_date != OMIT
        @general_ledger_transaction_lines = general_ledger_transaction_lines if general_ledger_transaction_lines != OMIT
        @remote_was_deleted = remote_was_deleted if remote_was_deleted != OMIT
        @field_mappings = field_mappings if field_mappings != OMIT
        @remote_data = remote_data if remote_data != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "remote_id": remote_id,
          "created_at": created_at,
          "modified_at": modified_at,
          "underlying_transaction_remote_id": underlying_transaction_remote_id,
          "underlying_transaction_type": underlying_transaction_type,
          "accounting_period": accounting_period,
          "company": company,
          "remote_updated_at": remote_updated_at,
          "remote_created_at": remote_created_at,
          "tracking_categories": tracking_categories,
          "posting_date": posting_date,
          "general_ledger_transaction_lines": general_ledger_transaction_lines,
          "remote_was_deleted": remote_was_deleted,
          "field_mappings": field_mappings,
          "remote_data": remote_data
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of GeneralLedgerTransaction
      #
      # @param json_object [String]
      # @return [Merge::Accounting::GeneralLedgerTransaction]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = parsed_json["id"]
        remote_id = parsed_json["remote_id"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        underlying_transaction_remote_id = parsed_json["underlying_transaction_remote_id"]
        underlying_transaction_type = parsed_json["underlying_transaction_type"]
        if parsed_json["accounting_period"].nil?
          accounting_period = nil
        else
          accounting_period = parsed_json["accounting_period"].to_json
          accounting_period = Merge::Accounting::GeneralLedgerTransactionAccountingPeriod.from_json(json_object: accounting_period)
        end
        if parsed_json["company"].nil?
          company = nil
        else
          company = parsed_json["company"].to_json
          company = Merge::Accounting::GeneralLedgerTransactionCompany.from_json(json_object: company)
        end
        remote_updated_at = unless parsed_json["remote_updated_at"].nil?
                              DateTime.parse(parsed_json["remote_updated_at"])
                            end
        remote_created_at = unless parsed_json["remote_created_at"].nil?
                              DateTime.parse(parsed_json["remote_created_at"])
                            end
        tracking_categories = parsed_json["tracking_categories"]&.map do |item|
          item = item.to_json
          Merge::Accounting::GeneralLedgerTransactionTrackingCategoriesItem.from_json(json_object: item)
        end
        posting_date = (DateTime.parse(parsed_json["posting_date"]) unless parsed_json["posting_date"].nil?)
        general_ledger_transaction_lines = parsed_json["general_ledger_transaction_lines"]&.map do |item|
          item = item.to_json
          Merge::Accounting::GeneralLedgerTransactionGeneralLedgerTransactionLinesItem.from_json(json_object: item)
        end
        remote_was_deleted = parsed_json["remote_was_deleted"]
        field_mappings = parsed_json["field_mappings"]
        remote_data = parsed_json["remote_data"]&.map do |item|
          item = item.to_json
          Merge::Accounting::RemoteData.from_json(json_object: item)
        end
        new(
          id: id,
          remote_id: remote_id,
          created_at: created_at,
          modified_at: modified_at,
          underlying_transaction_remote_id: underlying_transaction_remote_id,
          underlying_transaction_type: underlying_transaction_type,
          accounting_period: accounting_period,
          company: company,
          remote_updated_at: remote_updated_at,
          remote_created_at: remote_created_at,
          tracking_categories: tracking_categories,
          posting_date: posting_date,
          general_ledger_transaction_lines: general_ledger_transaction_lines,
          remote_was_deleted: remote_was_deleted,
          field_mappings: field_mappings,
          remote_data: remote_data,
          additional_properties: struct
        )
      end

      # Serialize an instance of GeneralLedgerTransaction to a JSON object
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
        obj.remote_id&.is_a?(String) != false || raise("Passed value for field obj.remote_id is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
        obj.underlying_transaction_remote_id&.is_a?(String) != false || raise("Passed value for field obj.underlying_transaction_remote_id is not the expected type, validation failed.")
        obj.underlying_transaction_type&.is_a?(Merge::Accounting::UnderlyingTransactionTypeEnum) != false || raise("Passed value for field obj.underlying_transaction_type is not the expected type, validation failed.")
        obj.accounting_period.nil? || Merge::Accounting::GeneralLedgerTransactionAccountingPeriod.validate_raw(obj: obj.accounting_period)
        obj.company.nil? || Merge::Accounting::GeneralLedgerTransactionCompany.validate_raw(obj: obj.company)
        obj.remote_updated_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_updated_at is not the expected type, validation failed.")
        obj.remote_created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_created_at is not the expected type, validation failed.")
        obj.tracking_categories&.is_a?(Array) != false || raise("Passed value for field obj.tracking_categories is not the expected type, validation failed.")
        obj.posting_date&.is_a?(DateTime) != false || raise("Passed value for field obj.posting_date is not the expected type, validation failed.")
        obj.general_ledger_transaction_lines&.is_a?(Array) != false || raise("Passed value for field obj.general_ledger_transaction_lines is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end
