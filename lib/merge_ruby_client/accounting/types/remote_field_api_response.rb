# frozen_string_literal: true

require_relative "remote_field_api"
require "ostruct"
require "json"

module Merge
  module Accounting
    class RemoteFieldApiResponse
      # @return [Array<Merge::Accounting::RemoteFieldApi>]
      attr_reader :account
      # @return [Array<Merge::Accounting::RemoteFieldApi>]
      attr_reader :accounting_attachment
      # @return [Array<Merge::Accounting::RemoteFieldApi>]
      attr_reader :balance_sheet
      # @return [Array<Merge::Accounting::RemoteFieldApi>]
      attr_reader :cash_flow_statement
      # @return [Array<Merge::Accounting::RemoteFieldApi>]
      attr_reader :company_info
      # @return [Array<Merge::Accounting::RemoteFieldApi>]
      attr_reader :contact
      # @return [Array<Merge::Accounting::RemoteFieldApi>]
      attr_reader :income_statement
      # @return [Array<Merge::Accounting::RemoteFieldApi>]
      attr_reader :credit_note
      # @return [Array<Merge::Accounting::RemoteFieldApi>]
      attr_reader :item
      # @return [Array<Merge::Accounting::RemoteFieldApi>]
      attr_reader :purchase_order
      # @return [Array<Merge::Accounting::RemoteFieldApi>]
      attr_reader :tracking_category
      # @return [Array<Merge::Accounting::RemoteFieldApi>]
      attr_reader :journal_entry
      # @return [Array<Merge::Accounting::RemoteFieldApi>]
      attr_reader :tax_rate
      # @return [Array<Merge::Accounting::RemoteFieldApi>]
      attr_reader :invoice
      # @return [Array<Merge::Accounting::RemoteFieldApi>]
      attr_reader :payment
      # @return [Array<Merge::Accounting::RemoteFieldApi>]
      attr_reader :expense
      # @return [Array<Merge::Accounting::RemoteFieldApi>]
      attr_reader :vendor_credit
      # @return [Array<Merge::Accounting::RemoteFieldApi>]
      attr_reader :transaction
      # @return [Array<Merge::Accounting::RemoteFieldApi>]
      attr_reader :accounting_period
      # @return [Array<Merge::Accounting::RemoteFieldApi>]
      attr_reader :general_ledger_transaction
      # @return [Array<Merge::Accounting::RemoteFieldApi>]
      attr_reader :bank_feed_account
      # @return [Array<Merge::Accounting::RemoteFieldApi>]
      attr_reader :employee
      # @return [Array<Merge::Accounting::RemoteFieldApi>]
      attr_reader :payment_method
      # @return [Array<Merge::Accounting::RemoteFieldApi>]
      attr_reader :project
      # @return [Array<Merge::Accounting::RemoteFieldApi>]
      attr_reader :payment_term
      # @return [OpenStruct] Additional properties unmapped to the current class definition
      attr_reader :additional_properties
      # @return [Object]
      attr_reader :_field_set
      protected :_field_set

      OMIT = Object.new

      # @param account [Array<Merge::Accounting::RemoteFieldApi>]
      # @param accounting_attachment [Array<Merge::Accounting::RemoteFieldApi>]
      # @param balance_sheet [Array<Merge::Accounting::RemoteFieldApi>]
      # @param cash_flow_statement [Array<Merge::Accounting::RemoteFieldApi>]
      # @param company_info [Array<Merge::Accounting::RemoteFieldApi>]
      # @param contact [Array<Merge::Accounting::RemoteFieldApi>]
      # @param income_statement [Array<Merge::Accounting::RemoteFieldApi>]
      # @param credit_note [Array<Merge::Accounting::RemoteFieldApi>]
      # @param item [Array<Merge::Accounting::RemoteFieldApi>]
      # @param purchase_order [Array<Merge::Accounting::RemoteFieldApi>]
      # @param tracking_category [Array<Merge::Accounting::RemoteFieldApi>]
      # @param journal_entry [Array<Merge::Accounting::RemoteFieldApi>]
      # @param tax_rate [Array<Merge::Accounting::RemoteFieldApi>]
      # @param invoice [Array<Merge::Accounting::RemoteFieldApi>]
      # @param payment [Array<Merge::Accounting::RemoteFieldApi>]
      # @param expense [Array<Merge::Accounting::RemoteFieldApi>]
      # @param vendor_credit [Array<Merge::Accounting::RemoteFieldApi>]
      # @param transaction [Array<Merge::Accounting::RemoteFieldApi>]
      # @param accounting_period [Array<Merge::Accounting::RemoteFieldApi>]
      # @param general_ledger_transaction [Array<Merge::Accounting::RemoteFieldApi>]
      # @param bank_feed_account [Array<Merge::Accounting::RemoteFieldApi>]
      # @param employee [Array<Merge::Accounting::RemoteFieldApi>]
      # @param payment_method [Array<Merge::Accounting::RemoteFieldApi>]
      # @param project [Array<Merge::Accounting::RemoteFieldApi>]
      # @param payment_term [Array<Merge::Accounting::RemoteFieldApi>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Accounting::RemoteFieldApiResponse]
      def initialize(account: OMIT, accounting_attachment: OMIT, balance_sheet: OMIT, cash_flow_statement: OMIT,
                     company_info: OMIT, contact: OMIT, income_statement: OMIT, credit_note: OMIT, item: OMIT, purchase_order: OMIT, tracking_category: OMIT, journal_entry: OMIT, tax_rate: OMIT, invoice: OMIT, payment: OMIT, expense: OMIT, vendor_credit: OMIT, transaction: OMIT, accounting_period: OMIT, general_ledger_transaction: OMIT, bank_feed_account: OMIT, employee: OMIT, payment_method: OMIT, project: OMIT, payment_term: OMIT, additional_properties: nil)
        @account = account if account != OMIT
        @accounting_attachment = accounting_attachment if accounting_attachment != OMIT
        @balance_sheet = balance_sheet if balance_sheet != OMIT
        @cash_flow_statement = cash_flow_statement if cash_flow_statement != OMIT
        @company_info = company_info if company_info != OMIT
        @contact = contact if contact != OMIT
        @income_statement = income_statement if income_statement != OMIT
        @credit_note = credit_note if credit_note != OMIT
        @item = item if item != OMIT
        @purchase_order = purchase_order if purchase_order != OMIT
        @tracking_category = tracking_category if tracking_category != OMIT
        @journal_entry = journal_entry if journal_entry != OMIT
        @tax_rate = tax_rate if tax_rate != OMIT
        @invoice = invoice if invoice != OMIT
        @payment = payment if payment != OMIT
        @expense = expense if expense != OMIT
        @vendor_credit = vendor_credit if vendor_credit != OMIT
        @transaction = transaction if transaction != OMIT
        @accounting_period = accounting_period if accounting_period != OMIT
        @general_ledger_transaction = general_ledger_transaction if general_ledger_transaction != OMIT
        @bank_feed_account = bank_feed_account if bank_feed_account != OMIT
        @employee = employee if employee != OMIT
        @payment_method = payment_method if payment_method != OMIT
        @project = project if project != OMIT
        @payment_term = payment_term if payment_term != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "Account": account,
          "AccountingAttachment": accounting_attachment,
          "BalanceSheet": balance_sheet,
          "CashFlowStatement": cash_flow_statement,
          "CompanyInfo": company_info,
          "Contact": contact,
          "IncomeStatement": income_statement,
          "CreditNote": credit_note,
          "Item": item,
          "PurchaseOrder": purchase_order,
          "TrackingCategory": tracking_category,
          "JournalEntry": journal_entry,
          "TaxRate": tax_rate,
          "Invoice": invoice,
          "Payment": payment,
          "Expense": expense,
          "VendorCredit": vendor_credit,
          "Transaction": transaction,
          "AccountingPeriod": accounting_period,
          "GeneralLedgerTransaction": general_ledger_transaction,
          "BankFeedAccount": bank_feed_account,
          "Employee": employee,
          "PaymentMethod": payment_method,
          "Project": project,
          "PaymentTerm": payment_term
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of RemoteFieldApiResponse
      #
      # @param json_object [String]
      # @return [Merge::Accounting::RemoteFieldApiResponse]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        account = parsed_json["Account"]&.map do |item|
          item = item.to_json
          Merge::Accounting::RemoteFieldApi.from_json(json_object: item)
        end
        accounting_attachment = parsed_json["AccountingAttachment"]&.map do |item|
          item = item.to_json
          Merge::Accounting::RemoteFieldApi.from_json(json_object: item)
        end
        balance_sheet = parsed_json["BalanceSheet"]&.map do |item|
          item = item.to_json
          Merge::Accounting::RemoteFieldApi.from_json(json_object: item)
        end
        cash_flow_statement = parsed_json["CashFlowStatement"]&.map do |item|
          item = item.to_json
          Merge::Accounting::RemoteFieldApi.from_json(json_object: item)
        end
        company_info = parsed_json["CompanyInfo"]&.map do |item|
          item = item.to_json
          Merge::Accounting::RemoteFieldApi.from_json(json_object: item)
        end
        contact = parsed_json["Contact"]&.map do |item|
          item = item.to_json
          Merge::Accounting::RemoteFieldApi.from_json(json_object: item)
        end
        income_statement = parsed_json["IncomeStatement"]&.map do |item|
          item = item.to_json
          Merge::Accounting::RemoteFieldApi.from_json(json_object: item)
        end
        credit_note = parsed_json["CreditNote"]&.map do |item|
          item = item.to_json
          Merge::Accounting::RemoteFieldApi.from_json(json_object: item)
        end
        item = parsed_json["Item"]&.map do |item|
          item = item.to_json
          Merge::Accounting::RemoteFieldApi.from_json(json_object: item)
        end
        purchase_order = parsed_json["PurchaseOrder"]&.map do |item|
          item = item.to_json
          Merge::Accounting::RemoteFieldApi.from_json(json_object: item)
        end
        tracking_category = parsed_json["TrackingCategory"]&.map do |item|
          item = item.to_json
          Merge::Accounting::RemoteFieldApi.from_json(json_object: item)
        end
        journal_entry = parsed_json["JournalEntry"]&.map do |item|
          item = item.to_json
          Merge::Accounting::RemoteFieldApi.from_json(json_object: item)
        end
        tax_rate = parsed_json["TaxRate"]&.map do |item|
          item = item.to_json
          Merge::Accounting::RemoteFieldApi.from_json(json_object: item)
        end
        invoice = parsed_json["Invoice"]&.map do |item|
          item = item.to_json
          Merge::Accounting::RemoteFieldApi.from_json(json_object: item)
        end
        payment = parsed_json["Payment"]&.map do |item|
          item = item.to_json
          Merge::Accounting::RemoteFieldApi.from_json(json_object: item)
        end
        expense = parsed_json["Expense"]&.map do |item|
          item = item.to_json
          Merge::Accounting::RemoteFieldApi.from_json(json_object: item)
        end
        vendor_credit = parsed_json["VendorCredit"]&.map do |item|
          item = item.to_json
          Merge::Accounting::RemoteFieldApi.from_json(json_object: item)
        end
        transaction = parsed_json["Transaction"]&.map do |item|
          item = item.to_json
          Merge::Accounting::RemoteFieldApi.from_json(json_object: item)
        end
        accounting_period = parsed_json["AccountingPeriod"]&.map do |item|
          item = item.to_json
          Merge::Accounting::RemoteFieldApi.from_json(json_object: item)
        end
        general_ledger_transaction = parsed_json["GeneralLedgerTransaction"]&.map do |item|
          item = item.to_json
          Merge::Accounting::RemoteFieldApi.from_json(json_object: item)
        end
        bank_feed_account = parsed_json["BankFeedAccount"]&.map do |item|
          item = item.to_json
          Merge::Accounting::RemoteFieldApi.from_json(json_object: item)
        end
        employee = parsed_json["Employee"]&.map do |item|
          item = item.to_json
          Merge::Accounting::RemoteFieldApi.from_json(json_object: item)
        end
        payment_method = parsed_json["PaymentMethod"]&.map do |item|
          item = item.to_json
          Merge::Accounting::RemoteFieldApi.from_json(json_object: item)
        end
        project = parsed_json["Project"]&.map do |item|
          item = item.to_json
          Merge::Accounting::RemoteFieldApi.from_json(json_object: item)
        end
        payment_term = parsed_json["PaymentTerm"]&.map do |item|
          item = item.to_json
          Merge::Accounting::RemoteFieldApi.from_json(json_object: item)
        end
        new(
          account: account,
          accounting_attachment: accounting_attachment,
          balance_sheet: balance_sheet,
          cash_flow_statement: cash_flow_statement,
          company_info: company_info,
          contact: contact,
          income_statement: income_statement,
          credit_note: credit_note,
          item: item,
          purchase_order: purchase_order,
          tracking_category: tracking_category,
          journal_entry: journal_entry,
          tax_rate: tax_rate,
          invoice: invoice,
          payment: payment,
          expense: expense,
          vendor_credit: vendor_credit,
          transaction: transaction,
          accounting_period: accounting_period,
          general_ledger_transaction: general_ledger_transaction,
          bank_feed_account: bank_feed_account,
          employee: employee,
          payment_method: payment_method,
          project: project,
          payment_term: payment_term,
          additional_properties: struct
        )
      end

      # Serialize an instance of RemoteFieldApiResponse to a JSON object
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
        obj.account&.is_a?(Array) != false || raise("Passed value for field obj.account is not the expected type, validation failed.")
        obj.accounting_attachment&.is_a?(Array) != false || raise("Passed value for field obj.accounting_attachment is not the expected type, validation failed.")
        obj.balance_sheet&.is_a?(Array) != false || raise("Passed value for field obj.balance_sheet is not the expected type, validation failed.")
        obj.cash_flow_statement&.is_a?(Array) != false || raise("Passed value for field obj.cash_flow_statement is not the expected type, validation failed.")
        obj.company_info&.is_a?(Array) != false || raise("Passed value for field obj.company_info is not the expected type, validation failed.")
        obj.contact&.is_a?(Array) != false || raise("Passed value for field obj.contact is not the expected type, validation failed.")
        obj.income_statement&.is_a?(Array) != false || raise("Passed value for field obj.income_statement is not the expected type, validation failed.")
        obj.credit_note&.is_a?(Array) != false || raise("Passed value for field obj.credit_note is not the expected type, validation failed.")
        obj.item&.is_a?(Array) != false || raise("Passed value for field obj.item is not the expected type, validation failed.")
        obj.purchase_order&.is_a?(Array) != false || raise("Passed value for field obj.purchase_order is not the expected type, validation failed.")
        obj.tracking_category&.is_a?(Array) != false || raise("Passed value for field obj.tracking_category is not the expected type, validation failed.")
        obj.journal_entry&.is_a?(Array) != false || raise("Passed value for field obj.journal_entry is not the expected type, validation failed.")
        obj.tax_rate&.is_a?(Array) != false || raise("Passed value for field obj.tax_rate is not the expected type, validation failed.")
        obj.invoice&.is_a?(Array) != false || raise("Passed value for field obj.invoice is not the expected type, validation failed.")
        obj.payment&.is_a?(Array) != false || raise("Passed value for field obj.payment is not the expected type, validation failed.")
        obj.expense&.is_a?(Array) != false || raise("Passed value for field obj.expense is not the expected type, validation failed.")
        obj.vendor_credit&.is_a?(Array) != false || raise("Passed value for field obj.vendor_credit is not the expected type, validation failed.")
        obj.transaction&.is_a?(Array) != false || raise("Passed value for field obj.transaction is not the expected type, validation failed.")
        obj.accounting_period&.is_a?(Array) != false || raise("Passed value for field obj.accounting_period is not the expected type, validation failed.")
        obj.general_ledger_transaction&.is_a?(Array) != false || raise("Passed value for field obj.general_ledger_transaction is not the expected type, validation failed.")
        obj.bank_feed_account&.is_a?(Array) != false || raise("Passed value for field obj.bank_feed_account is not the expected type, validation failed.")
        obj.employee&.is_a?(Array) != false || raise("Passed value for field obj.employee is not the expected type, validation failed.")
        obj.payment_method&.is_a?(Array) != false || raise("Passed value for field obj.payment_method is not the expected type, validation failed.")
        obj.project&.is_a?(Array) != false || raise("Passed value for field obj.project is not the expected type, validation failed.")
        obj.payment_term&.is_a?(Array) != false || raise("Passed value for field obj.payment_term is not the expected type, validation failed.")
      end
    end
  end
end
