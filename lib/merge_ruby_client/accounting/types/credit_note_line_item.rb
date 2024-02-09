# frozen_string_literal: true

require_relative "credit_note_line_item_item"
require_relative "credit_note_line_item_company"
require "date"
require "json"

module Merge
  module Accounting
    class CreditNoteLineItem
      attr_reader :item, :name, :description, :quantity, :memo, :unit_price, :tax_rate, :total_line_amount,
                  :tracking_category, :tracking_categories, :account, :company, :remote_id, :remote_was_deleted, :id, :created_at, :modified_at, :additional_properties

      # @param item [Accounting::CreditNoteLineItemItem]
      # @param name [String] The credit note line item's name.
      # @param description [String] The description of the item that is owed.
      # @param quantity [String] The credit note line item's quantity.
      # @param memo [String] The credit note line item's memo.
      # @param unit_price [String] The credit note line item's unit price.
      # @param tax_rate [String] The credit note line item's tax rate.
      # @param total_line_amount [String] The credit note line item's total.
      # @param tracking_category [String] The credit note line item's associated tracking category.
      # @param tracking_categories [Array<String>] The credit note line item's associated tracking categories.
      # @param account [String] The credit note line item's account.
      # @param company [Accounting::CreditNoteLineItemCompany] The company the credit note belongs to.
      # @param remote_id [String] The third-party API ID of the matching object.
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party platform.
      # @param id [String]
      # @param created_at [DateTime]
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Accounting::CreditNoteLineItem]
      def initialize(tracking_categories:, item: nil, name: nil, description: nil, quantity: nil, memo: nil, unit_price: nil, tax_rate: nil,
                     total_line_amount: nil, tracking_category: nil, account: nil, company: nil, remote_id: nil, remote_was_deleted: nil, id: nil, created_at: nil, modified_at: nil, additional_properties: nil)
        # @type [Accounting::CreditNoteLineItemItem]
        @item = item
        # @type [String] The credit note line item's name.
        @name = name
        # @type [String] The description of the item that is owed.
        @description = description
        # @type [String] The credit note line item's quantity.
        @quantity = quantity
        # @type [String] The credit note line item's memo.
        @memo = memo
        # @type [String] The credit note line item's unit price.
        @unit_price = unit_price
        # @type [String] The credit note line item's tax rate.
        @tax_rate = tax_rate
        # @type [String] The credit note line item's total.
        @total_line_amount = total_line_amount
        # @type [String] The credit note line item's associated tracking category.
        @tracking_category = tracking_category
        # @type [Array<String>] The credit note line item's associated tracking categories.
        @tracking_categories = tracking_categories
        # @type [String] The credit note line item's account.
        @account = account
        # @type [Accounting::CreditNoteLineItemCompany] The company the credit note belongs to.
        @company = company
        # @type [String] The third-party API ID of the matching object.
        @remote_id = remote_id
        # @type [Boolean] Indicates whether or not this object has been deleted in the third party platform.
        @remote_was_deleted = remote_was_deleted
        # @type [String]
        @id = id
        # @type [DateTime]
        @created_at = created_at
        # @type [DateTime] This is the datetime that this object was last updated by Merge
        @modified_at = modified_at
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of CreditNoteLineItem
      #
      # @param json_object [JSON]
      # @return [Accounting::CreditNoteLineItem]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        if parsed_json["item"].nil?
          item = nil
        else
          item = parsed_json["item"].to_json
          item = Accounting::CreditNoteLineItemItem.from_json(json_object: item)
        end
        name = struct.name
        description = struct.description
        quantity = struct.quantity
        memo = struct.memo
        unit_price = struct.unit_price
        tax_rate = struct.tax_rate
        total_line_amount = struct.total_line_amount
        tracking_category = struct.tracking_category
        tracking_categories = struct.tracking_categories
        account = struct.account
        if parsed_json["company"].nil?
          company = nil
        else
          company = parsed_json["company"].to_json
          company = Accounting::CreditNoteLineItemCompany.from_json(json_object: company)
        end
        remote_id = struct.remote_id
        remote_was_deleted = struct.remote_was_deleted
        id = struct.id
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        new(item: item, name: name, description: description, quantity: quantity, memo: memo, unit_price: unit_price,
            tax_rate: tax_rate, total_line_amount: total_line_amount, tracking_category: tracking_category, tracking_categories: tracking_categories, account: account, company: company, remote_id: remote_id, remote_was_deleted: remote_was_deleted, id: id, created_at: created_at, modified_at: modified_at, additional_properties: struct)
      end

      # Serialize an instance of CreditNoteLineItem to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "item": @item,
          "name": @name,
          "description": @description,
          "quantity": @quantity,
          "memo": @memo,
          "unit_price": @unit_price,
          "tax_rate": @tax_rate,
          "total_line_amount": @total_line_amount,
          "tracking_category": @tracking_category,
          "tracking_categories": @tracking_categories,
          "account": @account,
          "company": @company,
          "remote_id": @remote_id,
          "remote_was_deleted": @remote_was_deleted,
          "id": @id,
          "created_at": @created_at,
          "modified_at": @modified_at
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.item.nil? || Accounting::CreditNoteLineItemItem.validate_raw(obj: obj.item)
        obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
        obj.quantity&.is_a?(String) != false || raise("Passed value for field obj.quantity is not the expected type, validation failed.")
        obj.memo&.is_a?(String) != false || raise("Passed value for field obj.memo is not the expected type, validation failed.")
        obj.unit_price&.is_a?(String) != false || raise("Passed value for field obj.unit_price is not the expected type, validation failed.")
        obj.tax_rate&.is_a?(String) != false || raise("Passed value for field obj.tax_rate is not the expected type, validation failed.")
        obj.total_line_amount&.is_a?(String) != false || raise("Passed value for field obj.total_line_amount is not the expected type, validation failed.")
        obj.tracking_category&.is_a?(String) != false || raise("Passed value for field obj.tracking_category is not the expected type, validation failed.")
        obj.tracking_categories.is_a?(Array) != false || raise("Passed value for field obj.tracking_categories is not the expected type, validation failed.")
        obj.account&.is_a?(String) != false || raise("Passed value for field obj.account is not the expected type, validation failed.")
        obj.company.nil? || Accounting::CreditNoteLineItemCompany.validate_raw(obj: obj.company)
        obj.remote_id&.is_a?(String) != false || raise("Passed value for field obj.remote_id is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
      end
    end
  end
end
