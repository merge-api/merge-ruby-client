# frozen_string_literal: true

require_relative "credit_note_line_item_request_item"
require_relative "credit_note_line_item_request_company"
require "ostruct"
require "json"

module Merge
  module Accounting
    # # The CreditNoteLineItem Object
    #  ### Description
    #  The `CreditNoteLineItem` object is used to represent a credit note's line items.
    #  ### Usage Example
    #  Fetch from the `GET CreditNote` endpoint and view the credit note's line items.
    class CreditNoteLineItemRequest
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [Merge::Accounting::CreditNoteLineItemRequestItem]
      attr_reader :item
      # @return [String] The credit note line item's name.
      attr_reader :name
      # @return [String] The description of the item that is owed.
      attr_reader :description
      # @return [String] The credit note line item's quantity.
      attr_reader :quantity
      # @return [String] The credit note line item's memo.
      attr_reader :memo
      # @return [String] The credit note line item's unit price.
      attr_reader :unit_price
      # @return [String] The tax rate that applies to this line item.
      attr_reader :tax_rate
      # @return [String] The credit note line item's total.
      attr_reader :total_line_amount
      # @return [String] The credit note line item's associated tracking category.
      attr_reader :tracking_category
      # @return [Array<String>] The credit note line item's associated tracking categories.
      attr_reader :tracking_categories
      # @return [String] The credit note line item's account.
      attr_reader :account
      # @return [Merge::Accounting::CreditNoteLineItemRequestCompany] The company the credit note belongs to.
      attr_reader :company
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

      # @param remote_id [String] The third-party API ID of the matching object.
      # @param item [Merge::Accounting::CreditNoteLineItemRequestItem]
      # @param name [String] The credit note line item's name.
      # @param description [String] The description of the item that is owed.
      # @param quantity [String] The credit note line item's quantity.
      # @param memo [String] The credit note line item's memo.
      # @param unit_price [String] The credit note line item's unit price.
      # @param tax_rate [String] The tax rate that applies to this line item.
      # @param total_line_amount [String] The credit note line item's total.
      # @param tracking_category [String] The credit note line item's associated tracking category.
      # @param tracking_categories [Array<String>] The credit note line item's associated tracking categories.
      # @param account [String] The credit note line item's account.
      # @param company [Merge::Accounting::CreditNoteLineItemRequestCompany] The company the credit note belongs to.
      # @param integration_params [Hash{String => Object}]
      # @param linked_account_params [Hash{String => Object}]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Accounting::CreditNoteLineItemRequest]
      def initialize(remote_id: OMIT, item: OMIT, name: OMIT, description: OMIT, quantity: OMIT, memo: OMIT,
                     unit_price: OMIT, tax_rate: OMIT, total_line_amount: OMIT, tracking_category: OMIT, tracking_categories: OMIT, account: OMIT, company: OMIT, integration_params: OMIT, linked_account_params: OMIT, additional_properties: nil)
        @remote_id = remote_id if remote_id != OMIT
        @item = item if item != OMIT
        @name = name if name != OMIT
        @description = description if description != OMIT
        @quantity = quantity if quantity != OMIT
        @memo = memo if memo != OMIT
        @unit_price = unit_price if unit_price != OMIT
        @tax_rate = tax_rate if tax_rate != OMIT
        @total_line_amount = total_line_amount if total_line_amount != OMIT
        @tracking_category = tracking_category if tracking_category != OMIT
        @tracking_categories = tracking_categories if tracking_categories != OMIT
        @account = account if account != OMIT
        @company = company if company != OMIT
        @integration_params = integration_params if integration_params != OMIT
        @linked_account_params = linked_account_params if linked_account_params != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "remote_id": remote_id,
          "item": item,
          "name": name,
          "description": description,
          "quantity": quantity,
          "memo": memo,
          "unit_price": unit_price,
          "tax_rate": tax_rate,
          "total_line_amount": total_line_amount,
          "tracking_category": tracking_category,
          "tracking_categories": tracking_categories,
          "account": account,
          "company": company,
          "integration_params": integration_params,
          "linked_account_params": linked_account_params
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of CreditNoteLineItemRequest
      #
      # @param json_object [String]
      # @return [Merge::Accounting::CreditNoteLineItemRequest]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        remote_id = parsed_json["remote_id"]
        if parsed_json["item"].nil?
          item = nil
        else
          item = parsed_json["item"].to_json
          item = Merge::Accounting::CreditNoteLineItemRequestItem.from_json(json_object: item)
        end
        name = parsed_json["name"]
        description = parsed_json["description"]
        quantity = parsed_json["quantity"]
        memo = parsed_json["memo"]
        unit_price = parsed_json["unit_price"]
        tax_rate = parsed_json["tax_rate"]
        total_line_amount = parsed_json["total_line_amount"]
        tracking_category = parsed_json["tracking_category"]
        tracking_categories = parsed_json["tracking_categories"]
        account = parsed_json["account"]
        if parsed_json["company"].nil?
          company = nil
        else
          company = parsed_json["company"].to_json
          company = Merge::Accounting::CreditNoteLineItemRequestCompany.from_json(json_object: company)
        end
        integration_params = parsed_json["integration_params"]
        linked_account_params = parsed_json["linked_account_params"]
        new(
          remote_id: remote_id,
          item: item,
          name: name,
          description: description,
          quantity: quantity,
          memo: memo,
          unit_price: unit_price,
          tax_rate: tax_rate,
          total_line_amount: total_line_amount,
          tracking_category: tracking_category,
          tracking_categories: tracking_categories,
          account: account,
          company: company,
          integration_params: integration_params,
          linked_account_params: linked_account_params,
          additional_properties: struct
        )
      end

      # Serialize an instance of CreditNoteLineItemRequest to a JSON object
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
        obj.remote_id&.is_a?(String) != false || raise("Passed value for field obj.remote_id is not the expected type, validation failed.")
        obj.item.nil? || Merge::Accounting::CreditNoteLineItemRequestItem.validate_raw(obj: obj.item)
        obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.description&.is_a?(String) != false || raise("Passed value for field obj.description is not the expected type, validation failed.")
        obj.quantity&.is_a?(String) != false || raise("Passed value for field obj.quantity is not the expected type, validation failed.")
        obj.memo&.is_a?(String) != false || raise("Passed value for field obj.memo is not the expected type, validation failed.")
        obj.unit_price&.is_a?(String) != false || raise("Passed value for field obj.unit_price is not the expected type, validation failed.")
        obj.tax_rate&.is_a?(String) != false || raise("Passed value for field obj.tax_rate is not the expected type, validation failed.")
        obj.total_line_amount&.is_a?(String) != false || raise("Passed value for field obj.total_line_amount is not the expected type, validation failed.")
        obj.tracking_category&.is_a?(String) != false || raise("Passed value for field obj.tracking_category is not the expected type, validation failed.")
        obj.tracking_categories&.is_a?(Array) != false || raise("Passed value for field obj.tracking_categories is not the expected type, validation failed.")
        obj.account&.is_a?(String) != false || raise("Passed value for field obj.account is not the expected type, validation failed.")
        obj.company.nil? || Merge::Accounting::CreditNoteLineItemRequestCompany.validate_raw(obj: obj.company)
        obj.integration_params&.is_a?(Hash) != false || raise("Passed value for field obj.integration_params is not the expected type, validation failed.")
        obj.linked_account_params&.is_a?(Hash) != false || raise("Passed value for field obj.linked_account_params is not the expected type, validation failed.")
      end
    end
  end
end
