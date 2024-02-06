# frozen_string_literal: true

require_relative "item_status"
require_relative "item_purchase_account"
require_relative "item_sales_account"
require_relative "item_company"
require "date"
require_relative "remote_data"
require "json"

module Merge
  module Accounting
    # # The Item Object
    #
    # ### Description
    #
    # The `Item` object refers to the goods involved in a transaction.
    #
    # ### Usage Example
    #
    # Fetch from the `LIST Items` endpoint and view a company's items.
    class Item
      attr_reader :id, :remote_id, :name, :status, :unit_price, :purchase_price, :purchase_account, :sales_account,
                  :company, :remote_updated_at, :remote_was_deleted, :created_at, :modified_at, :field_mappings, :remote_data, :additional_properties

      # @param id [String]
      # @param remote_id [String] The third-party API ID of the matching object.
      # @param name [String] The item's name.
      # @param status [Accounting::ItemStatus] The item's status.
      #   - `ACTIVE` - ACTIVE
      #   - `ARCHIVED` - ARCHIVED
      # @param unit_price [Float] The item's unit price.
      # @param purchase_price [Float] The price at which the item is purchased from a vendor.
      # @param purchase_account [Accounting::ItemPurchaseAccount] References the default account used to record a purchase of the item.
      # @param sales_account [Accounting::ItemSalesAccount] References the default account used to record a sale.
      # @param company [Accounting::ItemCompany] The company the item belongs to.
      # @param remote_updated_at [DateTime] When the third party's item note was updated.
      # @param remote_was_deleted [Boolean] Indicates whether or not this object has been deleted in the third party platform.
      # @param created_at [DateTime]
      # @param modified_at [DateTime] This is the datetime that this object was last updated by Merge
      # @param field_mappings [Hash{String => String}]
      # @param remote_data [Array<Accounting::RemoteData>]
      # @param additional_properties [OpenStruct] Additional properties unmapped to the current class definition
      # @return [Accounting::Item]
      def initialize(id: nil, remote_id: nil, name: nil, status: nil, unit_price: nil, purchase_price: nil,
                     purchase_account: nil, sales_account: nil, company: nil, remote_updated_at: nil, remote_was_deleted: nil, created_at: nil, modified_at: nil, field_mappings: nil, remote_data: nil, additional_properties: nil)
        # @type [String]
        @id = id
        # @type [String] The third-party API ID of the matching object.
        @remote_id = remote_id
        # @type [String] The item's name.
        @name = name
        # @type [Accounting::ItemStatus] The item's status.
        #   - `ACTIVE` - ACTIVE
        #   - `ARCHIVED` - ARCHIVED
        @status = status
        # @type [Float] The item's unit price.
        @unit_price = unit_price
        # @type [Float] The price at which the item is purchased from a vendor.
        @purchase_price = purchase_price
        # @type [Accounting::ItemPurchaseAccount] References the default account used to record a purchase of the item.
        @purchase_account = purchase_account
        # @type [Accounting::ItemSalesAccount] References the default account used to record a sale.
        @sales_account = sales_account
        # @type [Accounting::ItemCompany] The company the item belongs to.
        @company = company
        # @type [DateTime] When the third party's item note was updated.
        @remote_updated_at = remote_updated_at
        # @type [Boolean] Indicates whether or not this object has been deleted in the third party platform.
        @remote_was_deleted = remote_was_deleted
        # @type [DateTime]
        @created_at = created_at
        # @type [DateTime] This is the datetime that this object was last updated by Merge
        @modified_at = modified_at
        # @type [Hash{String => String}]
        @field_mappings = field_mappings
        # @type [Array<Accounting::RemoteData>]
        @remote_data = remote_data
        # @type [OpenStruct] Additional properties unmapped to the current class definition
        @additional_properties = additional_properties
      end

      # Deserialize a JSON object to an instance of Item
      #
      # @param json_object [JSON]
      # @return [Accounting::Item]
      def self.from_json(json_object:)
        struct = JSON.parse(json_object, object_class: OpenStruct)
        parsed_json = JSON.parse(json_object)
        id = struct.id
        remote_id = struct.remote_id
        name = struct.name
        if parsed_json["status"].nil?
          status = nil
        else
          status = parsed_json["status"].to_json
          status = Accounting::ItemStatus.from_json(json_object: status)
        end
        unit_price = struct.unit_price
        purchase_price = struct.purchase_price
        if parsed_json["purchase_account"].nil?
          purchase_account = nil
        else
          purchase_account = parsed_json["purchase_account"].to_json
          purchase_account = Accounting::ItemPurchaseAccount.from_json(json_object: purchase_account)
        end
        if parsed_json["sales_account"].nil?
          sales_account = nil
        else
          sales_account = parsed_json["sales_account"].to_json
          sales_account = Accounting::ItemSalesAccount.from_json(json_object: sales_account)
        end
        if parsed_json["company"].nil?
          company = nil
        else
          company = parsed_json["company"].to_json
          company = Accounting::ItemCompany.from_json(json_object: company)
        end
        remote_updated_at = unless parsed_json["remote_updated_at"].nil?
                              DateTime.parse(parsed_json["remote_updated_at"])
                            end
        remote_was_deleted = struct.remote_was_deleted
        created_at = (DateTime.parse(parsed_json["created_at"]) unless parsed_json["created_at"].nil?)
        modified_at = (DateTime.parse(parsed_json["modified_at"]) unless parsed_json["modified_at"].nil?)
        field_mappings = struct.field_mappings
        remote_data = parsed_json["remote_data"]&.map do |v|
          v = v.to_json
          Accounting::RemoteData.from_json(json_object: v)
        end
        new(id: id, remote_id: remote_id, name: name, status: status, unit_price: unit_price,
            purchase_price: purchase_price, purchase_account: purchase_account, sales_account: sales_account, company: company, remote_updated_at: remote_updated_at, remote_was_deleted: remote_was_deleted, created_at: created_at, modified_at: modified_at, field_mappings: field_mappings, remote_data: remote_data, additional_properties: struct)
      end

      # Serialize an instance of Item to a JSON object
      #
      # @return [JSON]
      def to_json(*_args)
        {
          "id": @id,
          "remote_id": @remote_id,
          "name": @name,
          "status": @status,
          "unit_price": @unit_price,
          "purchase_price": @purchase_price,
          "purchase_account": @purchase_account,
          "sales_account": @sales_account,
          "company": @company,
          "remote_updated_at": @remote_updated_at,
          "remote_was_deleted": @remote_was_deleted,
          "created_at": @created_at,
          "modified_at": @modified_at,
          "field_mappings": @field_mappings,
          "remote_data": @remote_data
        }.to_json
      end

      # Leveraged for Union-type generation, validate_raw attempts to parse the given hash and check each fields type against the current object's property definitions.
      #
      # @param obj [Object]
      # @return [Void]
      def self.validate_raw(obj:)
        obj.id&.is_a?(String) != false || raise("Passed value for field obj.id is not the expected type, validation failed.")
        obj.remote_id&.is_a?(String) != false || raise("Passed value for field obj.remote_id is not the expected type, validation failed.")
        obj.name&.is_a?(String) != false || raise("Passed value for field obj.name is not the expected type, validation failed.")
        obj.status.nil? || Accounting::ItemStatus.validate_raw(obj: obj.status)
        obj.unit_price&.is_a?(Float) != false || raise("Passed value for field obj.unit_price is not the expected type, validation failed.")
        obj.purchase_price&.is_a?(Float) != false || raise("Passed value for field obj.purchase_price is not the expected type, validation failed.")
        obj.purchase_account.nil? || Accounting::ItemPurchaseAccount.validate_raw(obj: obj.purchase_account)
        obj.sales_account.nil? || Accounting::ItemSalesAccount.validate_raw(obj: obj.sales_account)
        obj.company.nil? || Accounting::ItemCompany.validate_raw(obj: obj.company)
        obj.remote_updated_at&.is_a?(DateTime) != false || raise("Passed value for field obj.remote_updated_at is not the expected type, validation failed.")
        obj.remote_was_deleted&.is_a?(Boolean) != false || raise("Passed value for field obj.remote_was_deleted is not the expected type, validation failed.")
        obj.created_at&.is_a?(DateTime) != false || raise("Passed value for field obj.created_at is not the expected type, validation failed.")
        obj.modified_at&.is_a?(DateTime) != false || raise("Passed value for field obj.modified_at is not the expected type, validation failed.")
        obj.field_mappings&.is_a?(Hash) != false || raise("Passed value for field obj.field_mappings is not the expected type, validation failed.")
        obj.remote_data&.is_a?(Array) != false || raise("Passed value for field obj.remote_data is not the expected type, validation failed.")
      end
    end
  end
end
