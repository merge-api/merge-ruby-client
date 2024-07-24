# frozen_string_literal: true

require "date"
require_relative "status_7_d_1_enum"
require_relative "item_purchase_account"
require_relative "item_sales_account"
require_relative "item_company"
require_relative "remote_data"
require "ostruct"
require "json"

module Merge
  module Accounting
    # # The Item Object
    #  ### Description
    #  The `Item` object refers to the goods involved in a transaction.
    #  ### Usage Example
    #  Fetch from the `LIST Items` endpoint and view a company's items.
    class Item
      # @return [String]
      attr_reader :id
      # @return [String] The third-party API ID of the matching object.
      attr_reader :remote_id
      # @return [DateTime] The datetime that this object was created by Merge.
      attr_reader :created_at
      # @return [DateTime] The datetime that this object was modified by Merge.
      attr_reader :modified_at
      # @return [String] The item's name.
      attr_reader :name
      # @return [Merge::Accounting::Status7D1Enum] The item's status.
      #  - `ACTIVE` - ACTIVE
      #  - `ARCHIVED` - ARCHIVED
      attr_reader :status
      # @return [Float] The item's unit price.
      attr_reader :unit_price
      # @return [Float] The price at which the item is purchased from a vendor.
      attr_reader :purchase_price
      # @return [Merge::Accounting::ItemPurchaseAccount] References the default account used to record a purchase of the item.
      attr_reader :purchase_account
      # @return [Merge::Accounting::ItemSalesAccount] References the default account used to record a sale.
      attr_reader :sales_account
      # @return [Merge::Accounting::ItemCompany] The company the item belongs to.
      attr_reader :company
      # @return [DateTime] When the third party's item note was updated.
      attr_reader :remote_updated_at
      # @return [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform.
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
      # @param name [String] The item's name.
      # @param status [Merge::Accounting::Status7D1Enum] The item's status.
      #  - `ACTIVE` - ACTIVE
      #  - `ARCHIVED` - ARCHIVED
      # @param unit_price [Float] The item's unit price.
      # @param purchase_price [Float] The price at which the item is purchased from a vendor.
      # @param purchase_account [Merge::Accounting::ItemPurchaseAccount] References the default account used to record a purchase of the item.
      # @param sales_account [Merge::Accounting::ItemSalesAccount] References the default account used to record a sale.
      # @param company [Merge::Accounting::ItemCompany] The company the item belongs to.
      # @param remote_updated_at [DateTime] When the third party's item note was updated.
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party
      #  platform.
      # @param field_mappings [Hash{String => Object}]
      # @param remote_data [Array<Merge::Accounting::RemoteData>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Merge::Accounting::Item]
      def initialize(id: OMIT, remote_id: OMIT, created_at: OMIT, modified_at: OMIT, name: OMIT, status: OMIT,
                     unit_price: OMIT, purchase_price: OMIT, purchase_account: OMIT, sales_account: OMIT, company: OMIT, remote_updated_at: OMIT, remote_was_deleted: OMIT, field_mappings: OMIT, remote_data: OMIT, additional_properties: nil)
        @id = id if id != OMIT
        @remote_id = remote_id if remote_id != OMIT
        @created_at = created_at if created_at != OMIT
        @modified_at = modified_at if modified_at != OMIT
        @name = name if name != OMIT
        @status = status if status != OMIT
        @unit_price = unit_price if unit_price != OMIT
        @purchase_price = purchase_price if purchase_price != OMIT
        @purchase_account = purchase_account if purchase_account != OMIT
        @sales_account = sales_account if sales_account != OMIT
        @company = company if company != OMIT
        @remote_updated_at = remote_updated_at if remote_updated_at != OMIT
        @remote_was_deleted = remote_was_deleted if remote_was_deleted != OMIT
        @field_mappings = field_mappings if field_mappings != OMIT
        @remote_data = remote_data if remote_data != OMIT
        @additional_properties = additional_properties
        @_field_set = {
          "id": id,
          "remote_id": remote_id,
          "created_at": created_at,
          "modified_at": modified_at,
          "name": name,
          "status": status,
          "unit_price": unit_price,
          "purchase_price": purchase_price,
          "purchase_account": purchase_account,
          "sales_account": sales_account,
          "company": company,
          "remote_updated_at": remote_updated_at,
          "remote_was_deleted": remote_was_deleted,
          "field_mappings": field_mappings,
          "remote_data": remote_data
        }.reject do |_k, v|
          v == OMIT
        end
      end

      # Deserialize a JSON object to an instance of Item
      #
      # @param json_object [String]
      # @return [Merge::Accounting::Item]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = parsed_json["id"]
        remote_id = parsed_json["remote_id"]
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        name = parsed_json["name"]
        status = parsed_json["status"]
        unit_price = parsed_json["unit_price"]
        purchase_price = parsed_json["purchase_price"]
        if parsed_json["purchase_account"].nil?
          purchase_account = nil
        else
          purchase_account = parsed_json["purchase_account"].to_json
          purchase_account = Merge::Accounting::ItemPurchaseAccount.from_json(json_object: purchase_account)
        end
        if parsed_json["sales_account"].nil?
          sales_account = nil
        else
          sales_account = parsed_json["sales_account"].to_json
          sales_account = Merge::Accounting::ItemSalesAccount.from_json(json_object: sales_account)
        end
        if parsed_json["company"].nil?
          company = nil
        else
          company = parsed_json["company"].to_json
          company = Merge::Accounting::ItemCompany.from_json(json_object: company)
        end
        remote_updated_at = unless parsed_json["remote_updated_at"].nil?
                              DateTime.parse(parsed_json["remote_updated_at"])
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
          name: name,
          status: status,
          unit_price: unit_price,
          purchase_price: purchase_price,
          purchase_account: purchase_account,
          sales_account: sales_account,
          company: company,
          remote_updated_at: remote_updated_at,
          remote_was_deleted: remote_was_deleted,
          field_mappings: field_mappings,
          remote_data: remote_data,
          additional_properties: struct
        )
      end

      # Serialize an instance of Item to a JSON object
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
        obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.status&.is_a?(Merge::Accounting::Status7D1Enum) != false || raise("Passed value for field obj.status is not the expected type, validation failed.")
        obj.unit_price&.is_a?(Float) != false || raise("Passed value for field obj.unit_price is not the expected type, validation failed.")
        obj.purchase_price&.is_a?(Float) != false || raise("Passed value for field obj.purchase_price is not the expected type, validation failed.")
        obj.purchase_account.nil? || Merge::Accounting::ItemPurchaseAccount.validate_raw(obj: obj.purchase_account)
        obj.sales_account.nil? || Merge::Accounting::ItemSalesAccount.validate_raw(obj: obj.sales_account)
        obj.company.nil? || Merge::Accounting::ItemCompany.validate_raw(obj: obj.company)
        obj.remote_updated_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_updated_at is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end
