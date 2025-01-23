# frozen_string_literal: true

require "date"
require_relative "bank_feed_transaction_bank_feed_account"
require_relative "credit_or_debit_enum"
require "ostruct"
require "json"

module Merge
  module Accounting
    # # The BankFeedTransaction Object
    #  ### Description
    #  The `BankFeedTransaction` object is used to represent transactions linked to a
    #  bank feed account. This includes details about the transaction such as the date,
    #  amount, description, and type.
    #  ### Usage Example
    #  Fetch from the `GET BankFeedTransaction` endpoint to view details of a
    #  transaction associated with a bank feed account.
    class BankFeedTransaction
      # @return [String]
      attr_reader :id
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [DateTime] The datetime that this object was created by Merge.
      attr_reader :created_at
      # @return [DateTime] The datetime that this object was modified by Merge.
      attr_reader :modified_at
      # @return [Merge::Accounting::BankFeedTransactionBankFeedAccount] The bank feed account associated with the transaction.
      attr_reader :bank_feed_account
      # @return [DateTime] The date that the transaction occurred.
      attr_reader :transaction_date
      # @return [DateTime] The date the transaction was posted to the bank account.
      attr_reader :posted_date
      # @return [Float] The amount of the transaction.
      attr_reader :amount
      # @return [String] The description of the transaction.
      attr_reader :description
      # @return [String] The underlying type of the transaction.
      attr_reader :transaction_type
      # @return [String] The person or merchant who initiated the transaction, or alternatively, to whom
      #  the transaction was paid.
      attr_reader :payee
      # @return [Merge::Accounting::CreditOrDebitEnum] If the transaction is of type debit or credit.
      #  - `CREDIT` - CREDIT
      #  - `DEBIT` - DEBIT
      attr_reader :credit_or_debit
      # @return [String] The customer’s identifier for the transaction.
      attr_reader :source_transaction_id
      # @return [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      attr_reader :remote_was_deleted
      # @return [Boolean] Whether or not this transaction has been processed by the external system. For
      #  example, NetSuite writes this field as True when the SuiteApp has processed the
      #  transaction.
      attr_reader :is_processed
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
      # @param bank_feed_account [Merge::Accounting::BankFeedTransactionBankFeedAccount] The bank feed account associated with the transaction.
      # @param transaction_date [DateTime] The date that the transaction occurred.
      # @param posted_date [DateTime] The date the transaction was posted to the bank account.
      # @param amount [Float] The amount of the transaction.
      # @param description [String] The description of the transaction.
      # @param transaction_type [String] The underlying type of the transaction.
      # @param payee [String] The person or merchant who initiated the transaction, or alternatively, to whom
      #  the transaction was paid.
      # @param credit_or_debit [Merge::Accounting::CreditOrDebitEnum] If the transaction is of type debit or credit.
      #  - `CREDIT` - CREDIT
      #  - `DEBIT` - DEBIT
      # @param source_transaction_id [String] The customer’s identifier for the transaction.
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      # @param is_processed [Boolean] Whether or not this transaction has been processed by the external system. For
      #  example, NetSuite writes this field as True when the SuiteApp has processed the
      #  transaction.
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Accounting::BankFeedTransaction]
      def initialize(id: OMIT, remote_id: OMIT, created_at: OMIT, modified_at: OMIT, bank_feed_account: OMIT,
                     transaction_date: OMIT, posted_date: OMIT, amount: OMIT, description: OMIT, transaction_type: OMIT, payee: OMIT, credit_or_debit: OMIT, source_transaction_id: OMIT, remote_was_deleted: OMIT, is_processed: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @bank_feed_account = bank_feed_account if bank_feed_account != OMIT
        @transaction_date = transaction_date if transaction_date != OMIT
        @posted_date = posted_date if posted_date != OMIT
        @amount = amount if amount != OMIT
        @description = description if description != OMIT
        @transaction_type = transaction_type if transaction_type != OMIT
        @payee = payee if payee != OMIT
        @credit_or_debit = credit_or_debit if credit_or_debit != OMIT
        @source_transaction_id = source_transaction_id if source_transaction_id != OMIT
        @remote_was_deleted = remote_was_deleted if remote_was_deleted != OMIT
        @is_processed = is_processed if is_processed != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "remote_id": remote_id,
          "created_at": created_at,
          "modified_at": modified_at,
          "bank_feed_account": bank_feed_account,
          "transaction_date": transaction_date,
          "posted_date": posted_date,
          "amount": amount,
          "description": description,
          "transaction_type": transaction_type,
          "payee": payee,
          "credit_or_debit": credit_or_debit,
          "source_transaction_id": source_transaction_id,
          "remote_was_deleted": remote_was_deleted,
          "is_processed": is_processed
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of BankFeedTransaction
      #
      # @param json_object [String]
      # @return [Merge::Accounting::BankFeedTransaction]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = parsed_json["id"]
        remote_id = parsed_json["remote_id"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        if parsed_json["bank_feed_account"].nil?
          bank_feed_account = nil
        else
          bank_feed_account = parsed_json["bank_feed_account"].to_json
          bank_feed_account = Merge::Accounting::BankFeedTransactionBankFeedAccount.from_json(json_object: bank_feed_account)
        end
        transaction_date = (DateTime.parse(parsed_json["transaction_date"]) unless parsed_json["transaction_date"].nil?)
        posted_date = (DateTime.parse(parsed_json["posted_date"]) unless parsed_json["posted_date"].nil?)
        amount = parsed_json["amount"]
        description = parsed_json["description"]
        transaction_type = parsed_json["transaction_type"]
        payee = parsed_json["payee"]
        credit_or_debit = parsed_json["credit_or_debit"]
        source_transaction_id = parsed_json["source_transaction_id"]
        remote_was_deleted = parsed_json["remote_was_deleted"]
        is_processed = parsed_json["is_processed"]
        new(
          id: id,
          remote_id: remote_id,
          created_at: created_at,
          modified_at: modified_at,
          bank_feed_account: bank_feed_account,
          transaction_date: transaction_date,
          posted_date: posted_date,
          amount: amount,
          description: description,
          transaction_type: transaction_type,
          payee: payee,
          credit_or_debit: credit_or_debit,
          source_transaction_id: source_transaction_id,
          remote_was_deleted: remote_was_deleted,
          is_processed: is_processed,
          additional_properties: struct
        )
      end

      # Serialize an instance of BankFeedTransaction to a JSON object
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
        obj.bank_feed_account.nil? || Merge::Accounting::BankFeedTransactionBankFeedAccount.validate_raw(obj: obj.bank_feed_account)
        obj.transaction_date&.is_a?(DateTime) != false || raise("Passed value for field obj.transaction_date is not the expected type, validation failed.")
        obj.posted_date&.is_a?(DateTime) != false || raise("Passed value for field obj.posted_date is not the expected type, validation failed.")
        obj.amount&.is_a?(Float) != false || raise("Passed value for field obj.amount is not the expected type, validation failed.")
        obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
        obj.transaction_type&.is_a?(String) != false || raise("Passed value for field obj.transaction_type is not the expected type, validation failed.")
        obj.payee&.is_a?(String) != false || raise("Passed value for field obj.payee is not the expected type, validation failed.")
        obj.credit_or_debit&.is_a?(Merge::Accounting::CreditOrDebitEnum) != false || raise("Passed value for field obj.credit_or_debit is not the expected type, validation failed.")
        obj.source_transaction_id&.is_a?(String) != false || raise("Passed value for field obj.source_transaction_id is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.is_processed&.is_a?(Boolean) != false || raise("Passed value for field obj.is_processed is not the expected type, validation failed.")
      end
    end
  end
end
