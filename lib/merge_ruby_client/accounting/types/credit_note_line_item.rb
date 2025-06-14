# frozen_string_literal: true

require "date"
require_relative "credit_note_line_item_item"
require_relative "credit_note_line_item_company"
require_relative "credit_note_line_item_contact"
require_relative "credit_note_line_item_project"
require "ostruct"
require "json"

module Merge
  module Accounting
    # # The CreditNoteLineItem Object
    #  ### Description
    #  The `CreditNoteLineItem` object is used to represent a credit note's line items.
    #  ### Usage Example
    #  Fetch from the `GET CreditNote` endpoint and view the credit note's line items.
    class CreditNoteLineItem
      # @return [String]
      attr_reader :id
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [DateTime] The datetime that this object was created by Merge.
      attr_reader :created_at
      # @return [DateTime] The datetime that this object was modified by Merge.
      attr_reader :modified_at
      # @return [Merge::Accounting::CreditNoteLineItemItem]
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
      # @return [Merge::Accounting::CreditNoteLineItemCompany] The company the credit note belongs to.
      attr_reader :company
      # @return [Merge::Accounting::CreditNoteLineItemContact] The credit note's contact.
      attr_reader :contact
      # @return [Merge::Accounting::CreditNoteLineItemProject]
      attr_reader :project
      # @return [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      attr_reader :remote_was_deleted
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
      # @param item [Merge::Accounting::CreditNoteLineItemItem]
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
      # @param company [Merge::Accounting::CreditNoteLineItemCompany] The company the credit note belongs to.
      # @param contact [Merge::Accounting::CreditNoteLineItemContact] The credit note's contact.
      # @param project [Merge::Accounting::CreditNoteLineItemProject]
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform. Full coverage deletion detection is a premium add-on. Native deletion
      #  detection is offered for free with limited coverage. [Learn
      #  more](https://docs.merge.dev/integrations/hris/supported-features/).
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Accounting::CreditNoteLineItem]
      def initialize(id: OMIT, remote_id: OMIT, created_at: OMIT, modified_at: OMIT, item: OMIT, name: OMIT,
                     description: OMIT, quantity: OMIT, memo: OMIT, unit_price: OMIT, tax_rate: OMIT, total_line_amount: OMIT, tracking_category: OMIT, tracking_categories: OMIT, account: OMIT, company: OMIT, contact: OMIT, project: OMIT, remote_was_deleted: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
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
        @contact = contact if contact != OMIT
        @project = project if project != OMIT
        @remote_was_deleted = remote_was_deleted if remote_was_deleted != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "remote_id": remote_id,
          "created_at": created_at,
          "modified_at": modified_at,
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
          "contact": contact,
          "project": project,
          "remote_was_deleted": remote_was_deleted
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of CreditNoteLineItem
      #
      # @param json_object [String]
      # @return [Merge::Accounting::CreditNoteLineItem]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = parsed_json["id"]
        remote_id = parsed_json["remote_id"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        if parsed_json["item"].nil?
          item = nil
        else
          item = parsed_json["item"].to_json
          item = Merge::Accounting::CreditNoteLineItemItem.from_json(json_object: item)
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
          company = Merge::Accounting::CreditNoteLineItemCompany.from_json(json_object: company)
        end
        if parsed_json["contact"].nil?
          contact = nil
        else
          contact = parsed_json["contact"].to_json
          contact = Merge::Accounting::CreditNoteLineItemContact.from_json(json_object: contact)
        end
        if parsed_json["project"].nil?
          project = nil
        else
          project = parsed_json["project"].to_json
          project = Merge::Accounting::CreditNoteLineItemProject.from_json(json_object: project)
        end
        remote_was_deleted = parsed_json["remote_was_deleted"]
        new(
          id: id,
          remote_id: remote_id,
          created_at: created_at,
          modified_at: modified_at,
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
          contact: contact,
          project: project,
          remote_was_deleted: remote_was_deleted,
          additional_properties: struct
        )
      end

      # Serialize an instance of CreditNoteLineItem to a JSON object
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
        obj.item.nil? || Merge::Accounting::CreditNoteLineItemItem.validate_raw(obj: obj.item)
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
        obj.company.nil? || Merge::Accounting::CreditNoteLineItemCompany.validate_raw(obj: obj.company)
        obj.contact.nil? || Merge::Accounting::CreditNoteLineItemContact.validate_raw(obj: obj.contact)
        obj.project.nil? || Merge::Accounting::CreditNoteLineItemProject.validate_raw(obj: obj.project)
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
      end
    end
  end
end
