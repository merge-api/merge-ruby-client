# frozen_string_literal: true

require_relative "bank_feed_transaction_request_request_bank_feed_account"
require "date"
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
    class BankFeedTransactionRequestRequest
      # @return [Merge::Accounting::BankFeedTransactionRequestRequestBankFeedAccount] The bank feed account associated with the transaction.
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
      # @return [Hash{String => Object}]
      attr_reader :integration_params
      # @return [Hash{String => Object}]
      attr_reader :linked_account_params
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param bank_feed_account [Merge::Accounting::BankFeedTransactionRequestRequestBankFeedAccount] The bank feed account associated with the transaction.
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
      # @param integration_params [Hash{String => Object}]
      # @param linked_account_params [Hash{String => Object}]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Accounting::BankFeedTransactionRequestRequest]
      def initialize(bank_feed_account: OMIT, transaction_date: OMIT, posted_date: OMIT, amount: OMIT,
                     description: OMIT, transaction_type: OMIT, payee: OMIT, credit_or_debit: OMIT, source_transaction_id: OMIT, integration_params: OMIT, linked_account_params: OMIT, additional_properties: nil)
        @bank_feed_account = bank_feed_account if bank_feed_account != OMIT
        @transaction_date = transaction_date if transaction_date != OMIT
        @posted_date = posted_date if posted_date != OMIT
        @amount = amount if amount != OMIT
        @description = description if description != OMIT
        @transaction_type = transaction_type if transaction_type != OMIT
        @payee = payee if payee != OMIT
        @credit_or_debit = credit_or_debit if credit_or_debit != OMIT
        @source_transaction_id = source_transaction_id if source_transaction_id != OMIT
        @integration_params = integration_params if integration_params != OMIT
        @linked_account_params = linked_account_params if linked_account_params != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "bank_feed_account": bank_feed_account,
          "transaction_date": transaction_date,
          "posted_date": posted_date,
          "amount": amount,
          "description": description,
          "transaction_type": transaction_type,
          "payee": payee,
          "credit_or_debit": credit_or_debit,
          "source_transaction_id": source_transaction_id,
          "integration_params": integration_params,
          "linked_account_params": linked_account_params
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of BankFeedTransactionRequestRequest
      #
      # @param json_object [String]
      # @return [Merge::Accounting::BankFeedTransactionRequestRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["bank_feed_account"].nil?
          bank_feed_account = nil
        else
          bank_feed_account = parsed_json["bank_feed_account"].to_json
          bank_feed_account = Merge::Accounting::BankFeedTransactionRequestRequestBankFeedAccount.from_json(json_object: bank_feed_account)
        end
        transaction_date = (DateTime.parse(parsed_json["transaction_date"]) unless parsed_json["transaction_date"].nil?)
        posted_date = (DateTime.parse(parsed_json["posted_date"]) unless parsed_json["posted_date"].nil?)
        amount = parsed_json["amount"]
        description = parsed_json["description"]
        transaction_type = parsed_json["transaction_type"]
        payee = parsed_json["payee"]
        credit_or_debit = parsed_json["credit_or_debit"]
        source_transaction_id = parsed_json["source_transaction_id"]
        integration_params = parsed_json["integration_params"]
        linked_account_params = parsed_json["linked_account_params"]
        new(
          bank_feed_account: bank_feed_account,
          transaction_date: transaction_date,
          posted_date: posted_date,
          amount: amount,
          description: description,
          transaction_type: transaction_type,
          payee: payee,
          credit_or_debit: credit_or_debit,
          source_transaction_id: source_transaction_id,
          integration_params: integration_params,
          linked_account_params: linked_account_params,
          additional_properties: struct
        )
      end

      # Serialize an instance of BankFeedTransactionRequestRequest to a JSON object
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
        obj.bank_feed_account.nil? || Merge::Accounting::BankFeedTransactionRequestRequestBankFeedAccount.validate_raw(obj: obj.bank_feed_account)
        obj.transaction_date&.is_a?(DateTime) != false || raise("Passed value for field obj.transaction_date is not the expected type, validation failed.")
        obj.posted_date&.is_a?(DateTime) != false || raise("Passed value for field obj.posted_date is not the expected type, validation failed.")
        obj.amount&.is_a?(Float) != false || raise("Passed value for field obj.amount is not the expected type, validation failed.")
        obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
        obj.transaction_type&.is_a?(String) != false || raise("Passed value for field obj.transaction_type is not the expected type, validation failed.")
        obj.payee&.is_a?(String) != false || raise("Passed value for field obj.payee is not the expected type, validation failed.")
        obj.credit_or_debit&.is_a?(Merge::Accounting::CreditOrDebitEnum) != false || raise("Passed value for field obj.credit_or_debit is not the expected type, validation failed.")
        obj.source_transaction_id&.is_a?(String) != false || raise("Passed value for field obj.source_transaction_id is not the expected type, validation failed.")
        obj.integration_params&.is_a?(Hash) != false || raise("Passed value for field obj.integration_params is not the expected type, validation failed.")
        obj.linked_account_params&.is_a?(Hash) != false || raise("Passed value for field obj.linked_account_params is not the expected type, validation failed.")
      end
    end
  end
end
